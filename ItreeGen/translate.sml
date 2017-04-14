(*
 * Assignment 6
 * CS 521 Spring 2017
 * Wolf Honore
 *)

signature TRANSLATE =
sig
  type level
  type access
  type frag

  val outermost : level
  val newLevel : {parent : level, formals : 'a list}
                 -> (level * (('a * access) list))
  val allocInFrame : level -> access
  val allocInRegister : unit -> access
  val allocFormal : level -> int -> access

  type gexp

  (* ITree generation *)
  val simpleVar : access -> level -> gexp
  val fieldVar : gexp -> int -> gexp

  val nilExp : unit -> gexp
  val intExp : int -> gexp
  val strExp : string -> gexp
  val appExp : level -> level -> Temp.label -> gexp list -> gexp
  val arithExp : Absyn.oper -> gexp -> gexp -> gexp
  val intCompExp : Absyn.oper -> gexp -> gexp -> gexp
  val strCompExp : Absyn.oper -> gexp -> gexp -> level -> gexp
  val recExp : gexp list -> level -> gexp
  val seqExp : gexp -> gexp -> gexp
  val asgnExp : gexp -> gexp -> gexp
  val ifThenExp : gexp -> gexp -> gexp
  val ifThenElseExp : gexp -> gexp -> gexp -> gexp
  val whileExp : gexp -> gexp -> Temp.label -> gexp
  val forExp : access -> level -> gexp -> gexp -> gexp -> Temp.label -> gexp
  val breakExp : Temp.label -> gexp
  val letExp : gexp list -> gexp -> gexp
  val arrExp : gexp -> gexp -> level -> gexp

  val subsVar : gexp -> gexp -> level -> gexp

  val funFrag : Temp.label -> gexp -> level -> unit

  val getResult : gexp -> level -> frag list

  val reset : unit -> unit
end

functor TranslateGen (Register : REGISTER_STD) : TRANSLATE =
struct
  structure F = Frame
  structure Tr = Tree
  structure T = Temp
  structure Er = ErrorMsg
  structure R = Register

  datatype level = LEVEL of {frame : F.frame,
                             sl_offset : int,
                             parent : level} * unit ref
                 | TOP

  (* Access is just a level and an offset since nothing is allocated to
     registers currently *)
  type access = level * int
  type frag = F.frag

  val outermost = TOP

  fun newLevel {parent, formals} =
    let
      (* Add 1 to formals for the static link *)
      val (newFrame, _) = F.newFrame (length formals + 1) R.paramBaseOffset
      val newLvl = LEVEL ({frame=newFrame,
                           sl_offset=R.paramBaseOffset, (* static link is 1st param *)
                           parent=parent}, ref ())
    in
      (newLvl, []) (* 2nd value is ignored *)
    end

  fun allocInFrame lvl =
    (case lvl of
       LEVEL ({frame, sl_offset, parent}, u) =>
         (lvl, F.allocInFrame frame R.localsBaseOffset)
     | _ => Er.impossible "allocInFrame")

  (* Not currently supported *)
  fun allocInRegister () = Er.impossible "allocInRegister"

  (* Add 1 to account for static link *)
  fun allocFormal lvl n = (lvl, R.paramBaseOffset + (n + 1) * F.wordSize)

  (* Convenience function, but must be careful to not call on TOP *)
  fun getFrame (LEVEL ({frame, ...}, _)) = frame
    | getFrame _ = Er.impossible "getFrame"

  val fragmentlist = ref ([] : frag list)
  fun reset () = fragmentlist := []

  datatype gexp = Ex of Tr.exp
                | Nx of Tr.stm
                | Cx of T.label * T.label -> Tr.stm

  (* Helpers *)

  (* Access the memory at l + r *)
  (* memOff : Tr.exp -> Tr.exp -> Tr.exp *)
  fun memOff l r =
    Tr.MEM (Tr.BINOP (Tr.PLUS, l, r), F.wordSize)

  (* The first argument is the current level, u is the unique
     identifier of the level being searched for, fp is the frame pointer
     of the current level *)
  (* followSl : level -> () ref -> Tr.exp *)
  fun followSl (LEVEL ({frame, sl_offset, parent}, u')) u fp =
        if u = u'
          then fp
          else followSl parent u (memOff fp (Tr.CONST sl_offset))

    | followSl _ _ _ = Er.impossible "followSl"

  (* seq : Tr.stm list -> Tr.stm *)
  fun seq [] = Tr.EXP (Tr.CONST 0)
    | seq [s] = s
    | seq (s :: ss) = Tr.SEQ (s, seq ss)

  (* Gexp conversions *)

  (* unEx : gexp -> Tr.exp *)
  fun unEx (Ex e) = e
    | unEx (Nx s) =
        (case s of
           (* Unwrap e *)
           Tr.EXP e => e
           (* Execute s but ignore result *)
         | _ => Tr.ESEQ (s, Tr.CONST 0))
    | unEx (Cx genstm) =
        let
          val r = T.newtemp ()
          val t = T.newlabel ()
          val f = T.newlabel ()
        in
          (* Return 1 if t-branch taken, 0 if f-branch taken *)
          Tr.ESEQ (seq [Tr.MOVE (Tr.TEMP r, Tr.CONST 1),
                        genstm (t, f),
                        Tr.LABEL f,
                        Tr.MOVE (Tr.TEMP r, Tr.CONST 0),
                        Tr.LABEL t],
                   Tr.TEMP r)
        end

  (* unNx : gexp -> Tr.stm *)
  fun unNx (Ex e) = Tr.EXP e (* Wrap e *)
    | unNx (Nx s) = s
    | unNx (Cx genstm) = Tr.EXP (unEx (Cx genstm)) (* Wrap unEx *)

  (* unCx : gexp -> T.label * T.label -> Tr.stm *)
  fun unCx (Ex (Tr.CONST 0)) =
        (* Always take f-branch *)
        (fn (t, f) => Tr.JUMP (Tr.NAME f, [f]))
    | unCx (Ex (Tr.CONST 1)) =
        (* Always take t-branch *)
        (fn (t, f) => Tr.JUMP (Tr.NAME t, [t]))
    | unCx (Ex e) =
        (* Jump to t if e != 0, f otherwise *)
        (fn (t, f) => Tr.CJUMP (Tr.TEST (Tr.NE, e, Tr.CONST 0), t, f))
    | unCx (Cx genstm) = genstm
    | unCx _ = Er.impossible "unCx"

  (* ITree generation *)

  (* First arg holds (level var declared at, offset in frame)
     Second arg holds level var accessed at
     Need to follow the static link of 2nd arg until levels match *)
  fun simpleVar (LEVEL (_, u), off) lvl =
        Ex (memOff (followSl lvl u (Tr.TEMP R.FP)) (Tr.CONST off))
    | simpleVar _ _ = Er.impossible "simpleVar"

  fun fieldVar v idx =
    let
      val off = Tr.CONST (idx * F.wordSize)
    in
      Ex (Tr.MEM (Tr.BINOP (Tr.PLUS, unEx v, off), F.wordSize))
    end

  fun nilExp () = Ex (Tr.CONST 0)

  fun intExp z = Ex (Tr.CONST z)

  (* Add a DATA frag to the list and return the label *)
  (* TODO: could reuse labels if string constant already exists *)
  fun strExp s =
    let
      val lab = T.newlabel ()
      val frag = F.DATA {lab=lab, s=s}
    in
      fragmentlist := frag :: !fragmentlist;
      Ex (Tr.NAME lab)
    end

  (* First arg is level where f is defined, second is where it is called
     Need to follow the static links to find the static link of the level where
     f is defined *)
  fun appExp (LEVEL ({parent=LEVEL (_, u), ...}, _)) lvl f args =
        let
          val sl = followSl lvl u (Tr.TEMP R.FP)
          (* Move args to stack first *)
          val args' = F.pushArgs (sl :: map unEx args) R.SP 0
        in
          (* Update maximum number of outgoing args *)
          F.setOutArgs (getFrame lvl) (length args + 1);
          Ex (Tr.CALL (Tr.NAME f, args'))
        end
    | appExp TOP lvl f args =
         (* Functions defined at TOP are external *)
         Ex (F.externalCall (Symbol.name f) (map unEx args) R.SP (getFrame lvl))
    | appExp _ _ _ _ = Er.impossible "appExp"

  (* Integer arithmetic *)
  fun arithExp oper ge1 ge2 =
    let
      val trOp = case oper of
                   Absyn.PlusOp => Tr.PLUS
                 | Absyn.MinusOp => Tr.MINUS
                 | Absyn.TimesOp => Tr.MUL
                 | Absyn.DivideOp => Tr.DIV
                 | _ => Er.impossible "arithExp"
    in
      Ex (Tr.BINOP (trOp, unEx ge1, unEx ge2))
    end

  (* Integer comparison *)
  fun intCompExp oper ge1 ge2 =
    let
      val trOp = case oper of
                   Absyn.LtOp => Tr.LT
                 | Absyn.LeOp => Tr.LE
                 | Absyn.GtOp => Tr.GT
                 | Absyn.GeOp => Tr.GE
                 | Absyn.EqOp => Tr.EQ
                 | Absyn.NeqOp => Tr.NE
                 | _ => Er.impossible "intCompExp"
    in
      Cx (fn (t, f) => Tr.CJUMP (Tr.TEST (trOp, unEx ge1, unEx ge2), t, f))
    end

  (* String comparison *)
  fun strCompExp Absyn.LtOp ge1 ge2 lvl =
        Ex (F.externalCall "stringLessThan" [unEx ge1, unEx ge2] R.SP (getFrame lvl))
      (* s1 <= s2 === !(s1 > s2) *)
    | strCompExp Absyn.LeOp ge1 ge2 lvl =
        Ex (F.externalCall "not"
                           [unEx (strCompExp Absyn.GtOp ge1 ge2 lvl)]
                           R.SP
                           (getFrame lvl))
      (* s1 > s2 === s2 < s1 *)
    | strCompExp Absyn.GtOp ge1 ge2 lvl = strCompExp Absyn.LtOp ge2 ge1 lvl
      (* s1 >= s2 === s2 <= s1 *)
    | strCompExp Absyn.GeOp ge1 ge2 lvl = strCompExp Absyn.LeOp ge2 ge1 lvl
    | strCompExp Absyn.EqOp ge1 ge2 lvl =
        Ex (F.externalCall "stringEqual"
                           [unEx ge1, unEx ge2]
                           R.SP
                           (getFrame lvl))
      (* s1 != s2 === !(s1 == s2) *)
    | strCompExp Absyn.NeqOp ge1 ge2 lvl =
        Ex (F.externalCall "not"
                           [unEx (strCompExp Absyn.EqOp ge1 ge2 lvl)]
                           R.SP
                           (getFrame lvl))
    | strCompExp _ _ _ _ = Er.impossible "strCompExp"

  (* Call allocRecord, initialize all fields, and return the pointer *)
  fun recExp fs lvl =
    let
      (* Move field values into r + offset *)
      fun initFields _ [] _ = []
        | initFields r (f :: fs) n =
            Tr.MOVE (Tr.MEM
              (Tr.BINOP (Tr.PLUS, Tr.TEMP r, Tr.CONST n), F.wordSize),
               unEx f)
            :: initFields r fs (n + F.wordSize)

      val r = T.newtemp ()
      val sz = (length fs) * F.wordSize
    in
      Ex (Tr.ESEQ
        (Tr.SEQ
          (Tr.MOVE (Tr.TEMP r,
                    F.externalCall "allocRecord" [Tr.CONST sz] R.SP (getFrame lvl)),
           seq (initFields r fs 0)),
         Tr.TEMP r))
    end

  fun seqExp ge1 ge2 = Ex (Tr.ESEQ (unNx ge1, unEx ge2))

  fun asgnExp v e = Nx (Tr.MOVE (unEx v, unEx e))

  fun whileExp tst bdy done =
    let
      val tstLbl = T.newlabel ()
      val loopLbl = T.newlabel ()
    in
      Nx (seq [Tr.LABEL tstLbl,
               unCx tst (loopLbl, done),
               Tr.LABEL loopLbl,
               unNx bdy,
               Tr.JUMP (Tr.NAME tstLbl, [tstLbl]),
               Tr.LABEL done])
    end

  (* Similar to while loop, but assign to v at the top and perform
     range check after body before incrementing v *)
  fun forExp vAcc vLvl lo hi bdy done =
    let
      val loopLbl = T.newlabel ()
      val incLbl = T.newlabel ()
      val v = simpleVar vAcc vLvl
    in
      Nx (seq [unNx (asgnExp v lo),
               unCx (intCompExp Absyn.LeOp v hi) (loopLbl, done),
               Tr.LABEL loopLbl,
               unNx bdy,
               unCx (intCompExp Absyn.LtOp v hi) (incLbl, done),
               Tr.LABEL incLbl,
               Tr.MOVE (unEx v, Tr.BINOP (Tr.PLUS, unEx v, Tr.CONST 1)),
               Tr.JUMP (Tr.NAME loopLbl, [loopLbl]),
               Tr.LABEL done])

    end

  fun breakExp done = Nx (Tr.JUMP (Tr.NAME done, [done]))

  fun ifThenExp tst thn =
    let
      val t = T.newlabel ()
      val f = T.newlabel ()
    in
      Nx (seq [unCx tst (t, f),
               Tr.LABEL t,
               unNx thn,
               Tr.LABEL f])
    end

  fun ifThenElseExp tst thn els =
    let
      val r = T.newtemp ()
      val t = T.newlabel ()
      val f = T.newlabel ()
      val after = T.newlabel ()
    in
      Ex (Tr.ESEQ
        (seq [unCx tst (t, f),
              Tr.LABEL t,
              Tr.MOVE (Tr.TEMP r, unEx thn),
              Tr.JUMP (Tr.NAME after, [after]),
              Tr.LABEL f,
              Tr.MOVE (Tr.TEMP r, unEx els),
              Tr.LABEL after],
         Tr.TEMP r))
    end

  fun letExp decs bdy =
    Ex (Tr.ESEQ (seq (map unNx decs), unEx bdy))

  (* Increase size by 1, call initArray, and store the original size in the
     first slot *)
  fun arrExp sz init lvl =
    let
      val r = T.newtemp ()
      val sz' = Tr.BINOP (Tr.PLUS, unEx sz, Tr.CONST 1)
    in
      Ex (Tr.ESEQ
        (seq [Tr.MOVE (Tr.TEMP r,
                       F.externalCall "initArray"
                                      [sz', unEx init]
                                      R.SP
                                      (getFrame lvl)),
              Tr.MOVE (Tr.MEM (Tr.TEMP r, F.wordSize), unEx sz)],
         Tr.TEMP r))
    end

  (* Create a new PROC frag and add it to the list. Move the result of the
     function into RV at the end *)
  fun funFrag f bdy (LEVEL ({frame, ...}, _)) =
        let
          (* TODO: can skip if no return value? *)
          val bdy' = Tr.MOVE (Tr.TEMP R.RV, unEx bdy)
          val frag = F.PROC {name=f, body=bdy', frame=frame}
        in
          fragmentlist := frag :: !fragmentlist
        end
    | funFrag _ _ _ = Er.impossible "funFrag"

  (* Call print(msg); exit(1) *)
  fun fail msg lvl =
    let
      val msg' = strExp msg
      val print = F.externalCall "print" [unEx msg'] R.SP (getFrame lvl)
      val exit = F.externalCall "exit" [Tr.CONST 1] R.SP (getFrame lvl)
    in
      seq [Tr.EXP print, Tr.EXP exit]
    end

  (* Look up the size at v[0], check that 0 <= idx < sz, and either return
     v[idx + 1] or fail with an error *)
  fun subsVar v idx lvl =
    let
      val low = T.newlabel ()
      val hi = T.newlabel ()
      val err = T.newlabel ()
      val done = T.newlabel ()
      val r = T.newtemp ()

      val idx' = Tr.BINOP (Tr.PLUS, unEx idx, Tr.CONST 1)
      val off = Tr.BINOP (Tr.MUL, idx', Tr.CONST F.wordSize)
      val sz = Tr.MEM (unEx v, F.wordSize)
    in
      Ex (Tr.ESEQ (
        seq [Tr.CJUMP (Tr.TEST (Tr.GE, unEx idx, Tr.CONST 0), low, err),
             Tr.LABEL low,
             Tr.CJUMP (Tr.TEST (Tr.LT, unEx idx, sz), hi, err),
             Tr.LABEL hi,
             Tr.JUMP (Tr.NAME done, [done]),
             Tr.LABEL err,
             fail "Error: out-of-bounds\n" lvl,
             Tr.LABEL done],
        Tr.MEM (Tr.BINOP (Tr.PLUS, unEx v, off), F.wordSize)))
    end

  (* Wrap the whole program in a PROC frag *)
  fun getResult prog lvl =
    (funFrag (Temp.namedlabel "tigermain") prog lvl;
     !fragmentlist)
end
