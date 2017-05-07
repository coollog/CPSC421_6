(* translate.sml *)

signature TRANSLATE =
sig
  type level
  type access
  type frag

  val outermost : level

  val newLevel : {parent: level, formals: 'a list} -> level
  val paramOffset : int -> int

  val allocInFrame : level -> access

  val getResult : unit -> frag list

  type gexp

  val unEx : gexp -> Tree.exp
  val unNx : gexp -> Tree.stm
  val unCx : gexp -> (Temp.label * Temp.label -> Tree.stm)

  val unit : gexp

  val simpleVar : access * level -> gexp
  val subscriptVar : gexp * gexp -> gexp
  val fieldVar : gexp * int -> gexp

  val intExp : int -> gexp
  val stringExp : string -> gexp
  val appExp : Symbol.symbol * gexp list * level * level -> gexp
  val seqExp : gexp list -> gexp
  val ifExp : gexp * gexp * gexp option -> gexp
  val whileExp : gexp * gexp * Temp.label -> gexp
  val breakExp : Temp.label -> gexp
  val arrayExp : gexp * gexp -> gexp
  val recordExp : gexp list -> gexp
  val binopExp : Absyn.oper * gexp * gexp -> gexp
  val relopExp : Absyn.oper * gexp * gexp -> gexp
  val strEq : bool * gexp * gexp -> gexp
  val assignExp : gexp * gexp -> gexp

  val fundec : Temp.label * level * gexp -> unit


end (* signature TRANSLATE *)


functor TranslateGen(Register : REGISTER_STD) : TRANSLATE =
struct

  structure A = Absyn
  structure F = Frame
  structure R = Register
  structure Tr = Tree
  structure T = Temp
  structure Er = ErrorMsg

  datatype level = LEVEL of {frame : F.frame,
                             sl_offset : int,
                             parent : level} * unit ref
                 | TOP

  val outermost = TOP

  type access = level * int  (* might needs to be changed later *)
  type frag = F.frag

  val fragmentlist = ref ([] : frag list)
  fun getResult() = !fragmentlist

  datatype gexp = Ex of Tr.exp
                | Nx of Tr.stm
                | Cx of T.label * T.label -> Tr.stm

  fun newLevel({parent, formals}) =
    let
      val numParams = length formals + 1 (* +1 for static link *)
      val (frame, _) = F.newFrame numParams

      val level = LEVEL({frame=frame,
                         sl_offset=R.paramBaseOffset,
                         parent=parent}, ref())
    in level end

  fun paramOffset(paramIndex) = R.paramBaseOffset + paramIndex * 4

  fun allocInFrame(level as LEVEL({frame,...}, _)) =
        (level, F.allocInFrame frame)
    | allocInFrame(TOP) = ErrorMsg.impossible "cannot amend top-level functions"


  fun seq([stm1, stm2]) = Tr.SEQ(stm1, stm2)
    | seq(stm::stms) = Tr.SEQ(stm, seq stms)
    | seq nil = ErrorMsg.impossible "sequence less than 2 statements"

  fun unEx(Ex e) = e
    | unEx(Cx genstm) =
      let val r = T.newtemp()
          val t = T.newlabel() and f = T.newlabel()
      in Tr.ESEQ(seq[Tr.MOVE(Tr.TEMP r, Tr.CONST 1),
                     genstm(t, f),
                     Tr.LABEL f,
                     Tr.MOVE(Tr.TEMP r, Tr.CONST 0),
                     Tr.LABEL t],
                 Tr.TEMP r)
      end
    | unEx(Nx s) = Tr.ESEQ(s, Tr.CONST 0)

  fun unNx(Ex e) = Tr.EXP e
    | unNx(cx as Cx _) = Tr.EXP(unEx cx)
    | unNx(Nx s) = s

  fun unCx(Ex e) =
      (fn (t, f) => case e of
        Tr.CONST 1 => Tr.JUMP(Tr.NAME t, [t])
      | Tr.CONST 0 => Tr.JUMP(Tr.NAME f, [f])
      | _ => Tr.CJUMP(Tr.TEST(Tr.EQ, e, Tr.CONST 0), f, t))
    | unCx(Cx genstm) = genstm
    | unCx(Nx _) = ErrorMsg.impossible "turning statement into conditional jump"


  val unit = Ex(Tr.CONST 0)

  fun findStaticLink(decLevel as LEVEL(_, decAccess),
                     LEVEL({sl_offset,parent,...}, curAccess),
                     curTree) =
        if decAccess = curAccess then
          curTree
        else
          let val curTree' =
            Tr.MEM(Tr.BINOP(Tr.PLUS, curTree, Tr.CONST sl_offset), 4)
          in findStaticLink(decLevel, parent, curTree') end
    | findStaticLink(_) =
        ErrorMsg.impossible "cannot find static link"

  fun simpleVar(access:access, level) =
    let val sl = findStaticLink(#1 access, level, Tr.TEMP R.FP)
    in Ex(Tr.MEM(Tr.BINOP(Tr.PLUS, sl, Tr.CONST(#2 access)), 4)) end

  fun subscriptVar(varExp, idxExp) =
    Ex(Tr.MEM(
      Tr.BINOP(Tr.PLUS, unEx varExp,
                        Tr.BINOP(Tr.MUL, unEx idxExp, Tr.CONST 4)), 4))

  fun fieldVar(varExp, fieldIdx) =
    Ex(Tr.MEM(Tr.BINOP(Tr.PLUS, unEx varExp, Tr.CONST(fieldIdx * 4)), 4))

  fun intExp i = Ex(Tr.CONST i)

  fun stringExp str =
    let val label = T.newlabel()
    in
      fragmentlist := F.DATA{lab=label,s=str} :: !fragmentlist;
      Ex(Tr.NAME label)
    end

  fun appExp(func, argsExps, TOP, _) =
      let val argList = map unEx argsExps
      in Ex(Tr.CALL(Tr.NAME func, argList)) end
    | appExp(func, argsExps, LEVEL({parent=calleeLevel,...},_), callerLevel) =
      let val argList = map unEx argsExps
          val sl = findStaticLink(calleeLevel, callerLevel, Tr.TEMP R.FP)
      in Ex(Tr.CALL(Tr.NAME func, sl::argList)) end

  fun seqExp exprs =
    let
      fun genESEQ([expr]) = unEx expr
        | genESEQ(expr::exprs) = Tr.ESEQ(unNx expr, genESEQ exprs)
        | genESEQ(nil) = ErrorMsg.impossible "sequence expression empty?"
    in
      Ex(genESEQ exprs)
    end

  fun ifExp(testExp, thenExp, elseExp) =
    let
      val r = T.newtemp()
      val t = T.newlabel() and f = T.newlabel()

      val test = unCx testExp (t, f)

    in case elseExp of

      SOME(elseExp) =>
        let val join = T.newlabel()
            val sequence = [test,
                            Tr.LABEL t,
                            Tr.MOVE(Tr.TEMP r, unEx thenExp),
                            Tr.JUMP(Tr.NAME join, [join]),
                            Tr.LABEL f,
                            Tr.MOVE(Tr.TEMP r, unEx elseExp),
                            Tr.LABEL join]
        in Ex(Tr.ESEQ(seq(sequence), Tr.TEMP r)) end

      | NONE =>
        let val sequence = [test,
                            Tr.LABEL t,
                            Tr.MOVE(Tr.TEMP r, unEx thenExp),
                            Tr.LABEL f]
        in Ex(Tr.ESEQ(seq(sequence), Tr.TEMP r)) end
    end

  fun whileExp(testExp, bodyExp, doneLabel) =
    let val testLabel = T.newlabel()
        val bodyLabel = T.newlabel()

        val test = unCx testExp (bodyLabel, doneLabel)

        val sequence = [Tr.LABEL testLabel,
                        test,
                        Tr.LABEL bodyLabel,
                        unNx bodyExp,
                        Tr.JUMP(Tr.NAME testLabel, [testLabel]),
                        Tr.LABEL doneLabel]
    in Nx(seq(sequence)) end

  fun breakExp(breakLabel) = Nx(Tr.JUMP(Tr.NAME breakLabel, [breakLabel]))

  fun arrayExp(sizeExp, initExp) =
    Ex(Tr.CALL(
      Tr.NAME(T.namedlabel "initArray"), [unEx sizeExp, unEx initExp]))

  fun recordExp(fieldExps) =
    let
      val t = T.newtemp()
      val allocation = Tr.MOVE(Tr.TEMP t, Tr.CALL(
        Tr.NAME(T.namedlabel "allocRecord"), [Tr.CONST(4 * length fieldExps)]))
      fun moveFields(field::fields, curIdx, curMoves) =
            moveFields(fields, curIdx + 1,
              curMoves@[Tr.MOVE(
                Tr.MEM(Tr.BINOP(Tr.PLUS, Tr.TEMP t, Tr.CONST(curIdx * 4)), 4),
                unEx field)])
        | moveFields(nil, _, curMoves) = curMoves
      val sequence = allocation::moveFields(fieldExps, 0, [])
    in
      Ex(Tr.ESEQ(seq(sequence), Tr.TEMP t))
    end

  fun binopExp(oper, leftExp, rightExp) =
    let val binop = case oper of
          A.PlusOp => Tr.PLUS
        | A.MinusOp => Tr.MINUS
        | A.TimesOp => Tr.MUL
        | A.DivideOp => Tr.DIV
        | _ => ErrorMsg.impossible "invalid binop"
    in Ex(Tr.BINOP(binop, unEx leftExp, unEx rightExp))
    end

  fun relopExp(oper, leftExp, rightExp) =
    let val relop = case oper of
          A.EqOp => Tr.EQ
        | A.NeqOp => Tr.NE
        | A.LtOp => Tr.LT
        | A.GtOp => Tr.GT
        | A.LeOp => Tr.LE
        | A.GeOp => Tr.GE
        | _ => ErrorMsg.impossible "invalid relop"
    in Cx(fn (t, f) =>
            Tr.CJUMP(Tr.TEST(relop, unEx leftExp, unEx rightExp), t, f))
    end

  fun strEq(isNeq, leftExp, rightExp) =
    let val stringEqual = Tr.CALL(
          Tr.NAME(T.namedlabel "stringEqual"), [unEx leftExp, unEx rightExp])
        val res = if isNeq then 0 else 1
    in Cx(fn (t, f) =>
        Tr.CJUMP(Tr.TEST(Tr.EQ, stringEqual, Tr.CONST res), t, f)) end

  fun assignExp(varExp, valExp) = Nx(Tr.MOVE(unEx varExp, unEx valExp))

  fun fundec(label, LEVEL({frame,...},_), bodyExp) =
    let val body = Tr.MOVE(Tr.TEMP R.RV, unEx bodyExp)
        val proc = F.PROC{name=label, body=body, frame=frame}
    in fragmentlist := proc :: !fragmentlist end
    | fundec(_, TOP, _) = ErrorMsg.impossible "top-level function declaration"

end (* functor TranslateGen *)






