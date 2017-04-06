(* translate.sml *)
(* Christopher Chute *)
(* April 2, 2017 *)
(* CPSC 421 - Zhong Shao *)

signature TRANSLATE = 
sig 
  type access
  type frag
  type gexp
  type level

  val outermost: level
  val newLevel: {parent: level, formals: 'a list} -> level
  val allocInFrame: level -> access (* val allocInRegister : unit -> access *)
  val getAccessForParam: level * int -> access
  val getResult: unit -> frag list

  (* Translate Absyn -> Intermediate Representation Expressions *)
  val transError: unit -> gexp                      (* Returned for errors *)
  val transNil: unit -> gexp                        (* Nil expression *)
  val transInt: int -> gexp                         (* Integer expression *)
  val transStr: string -> gexp                      (* String constant *)
  val transSeq: gexp list -> gexp                   (* Sequence of exps *)
  val transAssign: gexp * gexp -> gexp              (* Assignment statement *)
  val transSimpleVar: access * level -> gexp        (* Simple variable *)
  val transArrayAccess: gexp * gexp -> gexp         (* Array access (subscript) *)
  val transRecordAccess: gexp * int -> gexp         (* Record access (field) *)
  val transArrayInit: gexp * gexp -> gexp           (* Array initialization *)
  val transRecordInit: gexp list -> gexp            (* Record initialization *)
  val transBinop: gexp * Absyn.oper * gexp -> gexp  (* Binary operators (inc. equality) *)
  val transStrcmp: gexp * Absyn.oper * gexp -> gexp (* String comparison *)
  val transCond: gexp * gexp -> gexp                (* Conditional w/o else) *)
  val transCondElse: gexp * gexp * gexp -> gexp     (* Conditional with else *)
  val transWhile: gexp * gexp * Temp.label -> gexp  (* While loops *)
  val transFor: Frame.offset * gexp * gexp * gexp * Temp.label -> gexp (* For loops *)
  val transBreak: Temp.label -> gexp                    (* Break *)
  val transVarDec: gexp * access -> gexp                (* Variable declarations *)
  val transFunCall: Temp.label * gexp list * level * level -> gexp (* Function call *)
  val addFunDec: Temp.label * level * gexp -> unit      (* Function declarations *)
  val addMainFunDec: gexp * level -> unit               (* Function declaration for 'tigermain' *)

end (* signature TRANSLATE *)


functor TranslateGen(Register : REGISTER_STD) : TRANSLATE = 
struct

  structure A = Absyn
  structure F = Frame
  structure T = Tree
  structure Er = ErrorMsg
  structure R = Register

  (**
   * Describes a function nesting level.
   * Includes the frame holding local state, the static link offset within
   * the frame, and a pointer to the parent level. Also contains a unit ref,
   * as a unique identifier.
   *)
  datatype level = LEVEL of {frame: F.frame,
                            sl_offset: int,
                            parent: level} * unit ref
                 | TOP

  (**
   * Datatype representing different classes of Absyn.exp's.
   * Ex: A plain 'expression', represented as Tree.exp
   * Nx: A 'no-value expression', represented as Tree.stm
   * Cx: A 'conditional expression', represented as a (label, label) -> Tree.stm
   *)
  datatype gexp = Ex of T.exp
                | Nx of T.stm
                | Cx of Temp.label * Temp.label -> T.stm

  (**
   * Describes a local variable or a formal parameter.
   * An access is a 2-element tuple:
   * (level {frame, sl_offset, parent level}, offset within frame).
   * Note this is precisely the info necessary to access the value of a variable.
   *)
  type access = level * F.offset
  type frag = F.frag

  val fragmentList = ref ([]: frag list)
  fun getResult() = (!fragmentList)
  fun addFragment(f: F.frag) = (fragmentList := (f::(!fragmentList)))

  (**
   * The outermost function nesting level, in which library functions are
   * defined.
   *)
  val outermost: level = TOP

  (**
   * Allocate a new level for a function declaration.
   *)
  fun newLevel({parent: level, formals: 'a list}): level =
    let 
      val newFrame = (#1 (F.newFrame(List.length(formals))))
    in
      LEVEL({
        frame = newFrame,
        sl_offset = R.paramBaseOffset,
        parent = parent
      }, ref ())
    end

  (**
   * Allocate space for a local variable in a frame.
   *)
  fun allocInFrame(level as LEVEL({frame, ...}, _)): access = 
      (level, F.allocInFrame(frame))
    | allocInFrame(level as TOP) =
      (Er.impossible("Translate.allocInFrame should never be called on TOP");
      (level, 0));

  (**
   * Get the access information for the nth parameter in a given level.
   *)
  fun getAccessForParam(level as LEVEL(_, _), n): access =
      (level, F.getOffsetForParam(n))
    | getAccessForParam(level as TOP, n): access =
      (Er.impossible("Translate.getAccessForParam should never be called on TOP");
      (level, F.getOffsetForParam(n)));

  (**
   * Convert any gexp type to a Tree.exp.
   * Implementation given on page 153 of Appel.
   *)
  fun unEx(Ex(exp)): T.exp = exp
    | unEx(Nx(stm)): T.exp = T.ESEQ(stm, T.CONST 0)
    | unEx(Cx(cond)): T.exp =
      let
        val r = Temp.newtemp()  (* Result of expression (true->1, false->0) *)
        val t = Temp.newlabel() (* Label to which to jump when result is true *)
        val f = Temp.newlabel() (* Label to which to jump when result is false *)
      in
        (* Move 1 -> temp(r). If false, move 0 -> temp(r), otherwise done. *)
        T.ESEQ(
          T.SEQ(
            T.MOVE(T.TEMP(r), T.CONST(1)),
            T.SEQ(
              cond(t, f),
              T.SEQ(
                T.LABEL(f),
                T.SEQ(
                  T.MOVE(T.TEMP(r), T.CONST(0)),
                  T.LABEL(t)
                )
              )
            )
          ),
          T.TEMP(r)
        )
      end

  (**
   * Convert any gexp type to a Tree.stm.
   *)
  fun unNx(Ex(exp)): T.stm = T.EXP(exp)          (* Wrap expression into statement *)
    | unNx(Nx(stm)): T.stm = stm                 (* Already a statement *)
    | unNx(cjump as Cx(_)) = T.EXP(unEx(cjump)); (* conditional -> exp -> stm *)

  (**
   * Convert any gexp type to a (Tree.label, Tree.label) -> Tree.stm.
   *)
  fun unCx(Ex(exp)): (Temp.label * Temp.label) -> T.stm =
      (case(exp)
        (* Special case: T.CONST simple implementation. See page 151 of Appel. *)
        of T.CONST(value) => 
          if (value = 0)
          then (fn(t, f) => T.JUMP(T.NAME(f), [f]))
          else (fn(t, f) => T.JUMP(T.NAME(t), [t]))
        (* Treat zero expression as false, all non-zero expressions as true *)
        | _ => (fn(t, f) => T.CJUMP(T.TEST(T.EQ, exp, T.CONST(0)), f, t)))

    | unCx(Nx(_)) =
      (Er.impossible("type error: unCx called on Nx value");
      (fn(t: Temp.label, f: Temp.label) => T.EXP(T.CONST(0)))) (* Just return 0 *)
    | unCx(Cx(cond)) = cond;

  (**
   * Convert a list of T.stm's a T.SEQ.
   * We handle the cases separately based on the length of the list of stms.
   *)
  fun toSeqFromStms(stms: T.stm list): T.stm =
    let 
      val nStms = List.length(stms)
    in
      if (nStms = 0) then (Er.impossible("toSeqFromStms should never get 0 stms"))
      else if (nStms = 1) then hd(stms)
      else if (nStms = 2) then T.SEQ(hd(stms), hd(tl(stms)))
      else T.SEQ(T.SEQ(hd(stms), hd(tl(stms))), toSeqFromStms(tl(tl(stms))))
    end;

  (* Access a single word at the specified offset from frame pointer fp *)
  fun memAccess(base: T.exp, offset: F.offset): T.exp =
    T.MEM(T.BINOP(T.PLUS, base, T.CONST(offset)), F.wordSize);

  fun negate(exp: T.exp) = F.externalCall("not", [exp]);

  (**
   * Follow static links to produce a sequence of T.MEMs. This sequence is
   * the chain of memory accesses needed to find the variable from the original
   * level.
   * defLevelID: ID of the frame where the variable is defined
   * defOffset: Offset within the frame where the variable is defined
   * curChainExp: Sequence of memory accesses followed so far (starts at R.FP)
   * curLevel: The level where our search currently stands
   *)
  fun followStaticLinks(defLevelID, defOffset, curChainExp, curLevel): T.exp =
    (case(curLevel)
      of LEVEL({frame, sl_offset, parent}, curLevelID) =>
          if (curLevelID = defLevelID)
          (* Base case: Reached frame where var is defined *)
          then memAccess(curChainExp, defOffset)
          (* Recursive case: Follow a static link upwards *)
          else followStaticLinks(defLevelID, defOffset, memAccess(curChainExp, sl_offset), parent)
       | TOP => 
          ((Er.error 0 "Static link search failed to find simple variable");
          memAccess(T.TEMP(R.FP), defOffset))); (* Error: use current frame *)

  (**
   * Get an expression to return when there is an error.
   *)
  fun transError() = Ex(T.CONST(0));

  (**
   * Get a gexp for a nil expression.
   *)
  fun transNil() = Ex(T.CONST(0));

  (**
   * Get a gexp for an integer constant.
   *)
  fun transInt(i: int) = Ex(T.CONST(i));

  (**
   * Get a gexp for a string constant. See page 163 of Appel. The label for the
   * string is returned, and a fragment is stored in the global fragment list.
   *)
  fun transStr(s: string): gexp =
    (* Construct a new label where we will hold the string *)
    let val stringLabel = Temp.newlabel() in
      (addFragment(F.DATA({lab = stringLabel, s = s}));
      Ex(T.NAME(stringLabel)))
    end;

  (**
   * Translate a sequence of expressions. We extract the last expression,
   * put all others in tree of SEQ nodes, and then attach it to the last
   * expression in an ESEQ node.
   *)
  fun transSeq(nil: gexp list): gexp = Nx(T.EXP(T.CONST(0))) (* Nil value *)
    | transSeq(exps: gexp list) =
    let
      val expsMinusOne = List.rev(tl (List.rev exps));
      val lastExp = List.last exps;
    in
      Ex(
        T.ESEQ(
          toSeqFromStms(List.map unNx expsMinusOne),
          unEx(lastExp)
        )
      )
    end;

  (**
   * Get a gexp representing an assignment statement.
   *)
  fun transAssign(dest: gexp, src: gexp): gexp = Nx(T.MOVE(unEx(dest), unEx(src)));

  (**
   * Get a gexp for accessing a simple variable. Takes arguments describing
   * the level of definition `defLevel`, the offset `defOffset` within the frame
   * where the variable is defined, and the level of use `useLevel`.
   *)
  fun transSimpleVar((defLevel, defOffset): access, useLevel: level): gexp =
    (case(defLevel)
      (* Parse the declaration level information (frame, sl_offset, parent) *)
      of LEVEL(_, defLevelID) =>
        (case(useLevel)
          (* Parse the use level information (frame, sl_offset, and parent) *)
          of LEVEL(_, useLevelID) =>
              (* Follow static links until we find the variable *)
              Ex(followStaticLinks(defLevelID, defOffset, T.TEMP(R.FP), useLevel))
           (* Generate an error if declared or used at the top level *)
           | TOP =>
              ((Er.error 0 "Simple var accessed at the outermost nesting level");
              transError()))
       | TOP =>
          ((Er.error 0 "Simple var declared at the outermost nesting level");
          transError()));

  (**
   * Get a gexp for accessing an array variable.
   * Check that the index is non-negative and in-bounds for this array.
   *)
  fun transArrayAccess(arrayAddr: gexp, index: gexp): gexp =
    let
      val a = unEx(arrayAddr)
      val i = unEx(index)
      val value = Temp.newtemp()
      (* Make labels to implement bounds checking *)
      val idxGEZeroLabel = Temp.newlabel() (* Jump here when index >= 0 *)
      val idxIBLabel = Temp.newlabel()  (* Jump here when index in-bounds *)
      val idxOOBLabel = Temp.newlabel() (* Jump here when index out-of-bounds *)
      val doneLabel = Temp.newlabel()   (* Jump here when all done *)
      (* Build up the expressions needed to access the array *)
      (* Debugging: By default we always return the zeroth element of the array. *)
      val dfltAccess = T.MOVE(T.TEMP(value), T.BINOP(T.PLUS, a, T.CONST(1 * F.wordSize)))
      (* Check whether the index is >= 0 *)
      val checkIdxGEZero = T.CJUMP(T.TEST(T.GE, i, T.CONST(0)), idxGEZeroLabel, idxOOBLabel)
      (* Check whether the index is < length of array *)
      val checkIdxIB = T.CJUMP(T.TEST(T.LT, i, memAccess(a, 0)), idxIBLabel, idxOOBLabel)
      (* Convert the offset to an address offset in bytes *)
      val idxToBytes = T.BINOP(T.MUL, T.BINOP(T.PLUS, i, T.CONST(1)), T.CONST(F.wordSize))
      (* Store the array access into the temporary `value` *)
      val arrayAccess = T.MOVE(T.TEMP(value), T.BINOP(T.PLUS, a, idxToBytes))
      val goToDone = T.JUMP(T.NAME(doneLabel), [doneLabel])
      (* When index is OOB, print an error and exit *)
      val printError = T.EXP(F.externalCall("print", [unEx(transStr("Out-of-bounds array access.\n"))]))
      val haltProg = T.EXP(F.externalCall("exit", []))
    in
      Ex(
        T.ESEQ(
          toSeqFromStms([
            dfltAccess,
            checkIdxGEZero,
            T.LABEL(idxGEZeroLabel),
            checkIdxIB,
            T.LABEL(idxIBLabel),
            arrayAccess,
            goToDone,
            T.LABEL(idxOOBLabel),
            printError,
            haltProg,
            T.LABEL(doneLabel)
          ]),
          T.MEM(T.TEMP(value), F.wordSize)
        )
      )
    end;

  (**
   * Get a gexp for accessing a record field.
   * Note that Semant will have already validated the field access.
   * We only need to check that the record is non-nil.
   *)
  fun transRecordAccess(record: gexp, fieldIndex: int): gexp =
    let val recordAddr = unEx(record) in
      (case(recordAddr)
        of T.CONST(_) => 
            ((Er.error 0 "Dereference of nil record.\n"); Ex(T.CONST(1)))
         | _ =>
            Ex(memAccess(recordAddr, fieldIndex * F.wordSize)))
    end;

  (**
   * Construct an intermediate tree expression for an array initialization.
   * As suggested in Chapter 7 of Appel, we use the first word of an array
   * to store its size. This allows us to check array bounds.
   *)
  fun transArrayInit(sizeExp: gexp, initExp: gexp): gexp =
    let
      val a = Temp.newtemp() (* Address of array *)
      val nElts = unEx(sizeExp) (* Size of array *)
      val init = unEx(initExp) (* Initialization expression for array *)
      val nEltsPlusOne = T.BINOP(T.PLUS, nElts, T.CONST(1)) (* Length in first word *)
    in
      Ex(
        T.ESEQ(
          T.SEQ(
            (* Call initArray to get a region of initialized memory, put addr in `a` *)
            T.MOVE(T.TEMP(a), F.externalCall("initArray", [nEltsPlusOne, init])),
            (* Store the size of the array in the first word of the array *)
            T.MOVE(T.MEM(T.TEMP(a), F.wordSize), nElts)
          ),
          (* Evaluate to the address of the newly initialized array *)
          T.TEMP(a)
        )
      )
    end;

  (**
   * Construct an intermediate tree expression for a record initialization.
   *)
  fun transRecordInit(fieldExps: gexp list): gexp = 
    let
      val recordAddr = Temp.newtemp()
      val recordSize = List.length(fieldExps) * F.wordSize (* in bytes *)
      val fields = List.map unEx fieldExps
      (**
       * Build a list for the field initialization tree as shown
       * in Figure 7.4 on p. 164. This list will be passed to `toSeqFromStms`.
       *)
      fun fieldInitList(recordAddr: Temp.temp, (f::fs): T.exp list, fieldIndex: int) =
          (T.MOVE(memAccess(T.TEMP(recordAddr), fieldIndex * F.wordSize), f)::
          fieldInitList(recordAddr, fs, fieldIndex + 1))
        | fieldInitList(_, nil, _) = nil
    in
      Ex(
        T.ESEQ(
          T.SEQ(
            T.MOVE(
              T.TEMP(recordAddr),
              F.externalCall("allocRecord", [T.CONST(recordSize)])
            ),
            toSeqFromStms(fieldInitList(recordAddr, fields, 0))
          ),
          T.TEMP(recordAddr)
        )
      )
    end;

  (**
   * Translate a binary operation into its gexp form.
   * Note that type-checking will have already been performed by Semant.
   *)
  fun transBinop(left: gexp, bop: A.oper, right: gexp): gexp =
    let
      val l = unEx(left)
      val r = unEx(right)
    in
      (case(bop)
        (* Arithmetic Operations *)
        of A.PlusOp => Ex(T.BINOP(T.PLUS, l, r))
         | A.MinusOp => Ex(T.BINOP(T.MINUS, l, r))
         | A.TimesOp => Ex(T.BINOP(T.MUL, l, r))
         | A.DivideOp => Ex(T.BINOP(T.DIV, l, r))
        (* Comparison Operations *)
         | A.EqOp => Cx(fn(t, f) => T.CJUMP(T.TEST(T.EQ, l, r), t, f))
         | A.NeqOp => Cx(fn(t, f) => T.CJUMP(T.TEST(T.NE, l, r), t, f))
         | A.LtOp => Cx(fn(t, f) => T.CJUMP(T.TEST(T.LT, l, r), t, f))
         | A.LeOp => Cx(fn(t, f) => T.CJUMP(T.TEST(T.LE, l, r), t, f))
         | A.GtOp => Cx(fn(t, f) => T.CJUMP(T.TEST(T.GT, l, r), t, f))
         | A.GeOp => Cx(fn(t, f) => T.CJUMP(T.TEST(T.GE, l, r), t, f))
      )
    end;

  (**
   * Translate a string comparison into a gexp expression.
   *)
  fun transStrcmp(left: gexp, bop: A.oper, right: gexp): gexp =
    let
      val l = unEx(left)
      val r = unEx(right)
    in
      (case(bop)
         (* TODO: Test all cases, especially '>' and '<=' *)
         (* String Equality *)
        of A.EqOp => Cx(unCx(Ex(F.externalCall("stringEqual", [l, r]))))
         (* String Non-Equality (implemented as opposite of == *)
         | A.NeqOp => Cx(unCx(Ex(negate(F.externalCall("stringEqual", [l, r])))))
         (* String Less-Than *)
         | A.LtOp => Cx(unCx(Ex(F.externalCall("stringLessThan", [l, r]))))
         (* String Less-Than-Or-Equal-To *)
         | A.LeOp =>
            Cx(unCx(Ex(
                    T.BINOP(
                      T.PLUS,
                      F.externalCall("stringLessThan", [l, r]),
                      F.externalCall("stringEqual", [l, r])))))
         (* String Greater-Than (implemented as opposite of <=) *)
         | A.GtOp =>
            Cx(unCx(Ex(negate(
                        T.BINOP(
                          T.PLUS,
                          F.externalCall("stringLessThan", [l, r]),
                          F.externalCall("stringEqual", [l, r]))))))
         (* String Greater-Than-Or-Equal-To (implemented as opposite of <) *)
         | A.GeOp => Cx(unCx(Ex(negate(F.externalCall("stringLessThan", [l, r])))))
         | _ => (Er.impossible("Invalid string comparison"); transError())
      )
    end;

  (**
   * Translate a conditional expression without an 'else' block.
   *)
  fun transCond(pred: gexp, cons: gexp): gexp =
    let
      val predicate = unCx(pred)
      val consequence = unEx(cons)
      val testPassedLabel = Temp.newlabel()
      val doneLabel = Temp.newlabel()
    in
      Nx(
        toSeqFromStms([
          predicate(testPassedLabel, doneLabel),
          T.LABEL(testPassedLabel),
          T.EXP(consequence),
          T.LABEL(doneLabel)
        ])
      )
    end

  (**
   * Translate a conditional expression with an 'else' block.
   * The entire expression evaluates to a value, which has already been type-
   * checked in the Semant module.
   *)
  fun transCondElse(pred: gexp, cons: gexp, alt: gexp): gexp =
    let
      val predicate = unCx(pred)
      val consequence = unEx(cons)
      val alternative = unEx(alt)
      val value = Temp.newtemp()            (* Temp to store expression value *)
      val testPassedLabel = Temp.newlabel() (* Label for when test passes *)
      val testFailedLabel = Temp.newlabel() (* Label for when test fails *)
      val doneLabel = Temp.newlabel()       (* Label for exiting entire block *)
    in
      Ex(
        T.ESEQ(
          toSeqFromStms([
            predicate(testPassedLabel, testFailedLabel), (* Check predicate *)
            T.LABEL(testPassedLabel),                    (* if { *)
            T.MOVE(T.TEMP(value), consequence),          (*   do consequence *)
            T.LABEL(testFailedLabel),                    (* } else { *)
            T.MOVE(T.TEMP(value), alternative),          (*   do alternative *)
            T.LABEL(doneLabel)                           (* } *)
          ]),
          T.TEMP(value)
        )
      )
    end

  (**
   * Translate a while loop (conditional and body) into a gexp.
   * We require the done label be passed in from Semant, so that
   * break statements can be handled properly. See page 165 of Appel.
   *)
  fun transWhile(cond: gexp, body: gexp, doneLabel: Temp.label): gexp =
    let
      val test = unCx(cond) (* Predicate *)
      val body' = unEx(body) (* Consequence (body of loop) *)
      val testLabel = Temp.newlabel()       (* Label at top of loop *)
      val testPassedLabel = Temp.newlabel() (* Label to enter body of loop *)
    in
      Nx(
        toSeqFromStms([
          T.LABEL(testLabel),                     (* test: *)
          test(testPassedLabel, doneLabel),       (*   if not (cond) goto done *)
          T.LABEL(testPassedLabel),               (* testPassed: *)
          T.EXP(body'),                           (*   body *)
          T.JUMP(T.NAME(testLabel), [testLabel]), (*   goto test *)
          T.LABEL(doneLabel)                      (* done: *)
        ])
      )
    end;

  (**
   * Translate a for loop into a gexp.
   * We require the done label be passed in from Semant, so that
   * break statements can be handled properly. See page 166 of Appel.
   * Note: `counterOffset` is offset within frame of the counter local variable.
   *)
  fun transFor(counterOffset: F.offset, low: gexp, high: gexp, body: gexp, doneLabel: Temp.label) =
    let
      val body' = unEx(body)
      (* Loop control expressions and labels *)
      val l = unEx(low)
      val h = unEx(high)
      val limit = Temp.newtemp()
      val testPassedLabel = Temp.newlabel()
      val incrCounterLabel = Temp.newlabel()
      val doneLabel = Temp.newlabel()
      (* Build up expressions for the loop *)
      fun memAccessCounter() = memAccess(T.TEMP(R.FP), counterOffset)
      val initCounter = T.MOVE(memAccessCounter(), l)
      val initLimit = T.MOVE(T.TEMP(limit), h)

      (* Two tests are necessary to avoid the overflow case on p. 166 *)
      (* Test at the top of the loop that counter <= limit *)
      val counterLELimitTest =
        T.CJUMP(
          T.TEST(T.LE, memAccessCounter(), T.TEMP(limit)),
          testPassedLabel, (* Enter the loop if this test passes *)
          doneLabel
        )
      (* Test at the bottom of the loop that counter < limit before incrementing *)
      val counterLTLimitTest =
        T.CJUMP(
          T.TEST(T.LT, memAccessCounter(), T.TEMP(limit)),
          incrCounterLabel, (* Increment the counter and reenter the loop *)
          doneLabel
        )
      (* Increment the counter *)
      val incrCounter = T.MOVE(
        memAccessCounter(),
        T.BINOP(T.PLUS, memAccessCounter(), T.CONST(1))
      )
    in
      Nx(
        toSeqFromStms([
          initCounter,
          initLimit,
          counterLELimitTest,
          T.LABEL(testPassedLabel),
          T.EXP(body'),
          counterLTLimitTest,
          T.LABEL(incrCounterLabel),
          incrCounter,
          T.JUMP(T.NAME(testPassedLabel), [testPassedLabel]),
          T.LABEL(doneLabel)
        ])
      )
    end;

  (**
   * Break by jumping to a specified label.
   * Note that we verify in the Semant module that break is properly nested
   * inside a while or for loop.
   *)
  fun transBreak(dest: Temp.label): gexp = Nx(T.JUMP(T.NAME(dest), [dest]));

  (**
   * Translate a function call into a gexp.
   *)
  fun transFunCall(funName: Temp.label, formals: gexp list, defLevel: level, useLevel: level): gexp =
    let
      (**
       * Get the static link for a function application. Throughout this function,
       * the `u` prefix means 'use', and the `d` prefix means 'definition.'
       * See pages 133-4 and 142 of Appel.
       *)
      fun getStaticLink(defLevel: level, useLevel: level): Tree.exp =
        (case (defLevel)
          of LEVEL({parent=dp, ...}, dID) =>
              (case (useLevel)
                of LEVEL({sl_offset=us, parent=up, ...}, uID) =>
                    (* Called in same level as defined -> Dereference static link *)
                    if (uID = dID) then memAccess(T.TEMP(R.FP), us)
                    (* Called at level with same parent -> Dereference static link *)
                    else if (up = dp) then memAccess(T.TEMP(R.FP), us)
                    (* Otherwise take the calling function's FP as static link *)
                    else T.TEMP(R.FP)
                 | TOP => ((Er.error 0 "Function called from outermost level"); T.CONST(0)))
           | TOP => ((Er.impossible "getStaticLink on lib function"); T.CONST(0)))
      (* Convert formal parameters to their Tree.exp representation *)
      val params = List.map unEx formals
      (* Get the argument list for the function *)
      val argList =
        (case (defLevel)
          (* User-defined function, add static link to head of parameter list *)
          of LEVEL(_, _) => (getStaticLink(defLevel, useLevel)::params)
          (* Library function, no need to fetch static link *)
           | TOP => params)
    in
      Ex(T.CALL(T.NAME(funName), argList))
    end;

  (**
   * Translate a variable declaration into a Tree.gexp to initialize the binding.
   * Note that space has already been allocated in the frame.
   *)
  (* TODO: This is touchy. Make sure offset returned by allocInFrame will work here. *)
  fun transVarDec(init: gexp, (level, offset): access): gexp =
    (case (level)
      of LEVEL(_, _) =>
          Nx(T.MOVE(memAccess(T.TEMP(R.FP), offset), unEx(init)))
       | TOP =>
          ((Er.error 0 "Let binding in outermost nesting level"); transError()));

  (**
   * Translate a function definition comprising of a `level` and an already
   * translated function body. Produce a frag as described on page 169 of Appel.
   * Note that nothing is retured, but rather a PROC fragment is added to the frag list.
   * At end of function body, the return value gets stored in the RV register.
   *)
  fun addFunDec(name: Temp.label, level: level, body': gexp): unit =
    let val body = T.MOVE(T.TEMP(R.RV), unEx(body'))
    in
      (case (level)
        of LEVEL({frame, ...}, _) =>
            (* Add a fragment to move the function evaluation into the RV (retval) register *)
            addFragment(F.PROC({
              name = name,
              body = body,
              frame = frame
            }))
         | TOP => (Er.error 0 "User-defined function has outermost level"))
    end;

  (**
   * Translate the tigermain function definition, which wraps a Tiger program.
   * Produce a frag as described on page 169 of Appel.
   * Note that nothing is retured, but rather a PROC fragment is added to the frag list.
   * At end of function body, the return value gets stored in the RV register.
   *)
  fun addMainFunDec(body': gexp, level: level): unit =
    let val body = T.MOVE(T.TEMP(R.RV), unEx(body'))
    in
      (case (level)
        of LEVEL({frame, ...}, _) =>
            addFragment(F.PROC({
              name = Temp.namedlabel("tigermain"),
              body = body,
              frame = frame
            }))
         | TOP => (Er.error 0 "The tigermain function should have its own level"))
    end;

end (* functor TranslateGen *)
