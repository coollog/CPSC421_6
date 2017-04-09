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

  type gexp

  (* ITree generation *)
  val simpleVar : access -> level -> gexp
  val fieldVar : gexp -> int -> gexp
  val subsVar : gexp -> gexp -> gexp

  val nilExp : unit -> gexp
  val intExp : int -> gexp
  val strExp : string -> gexp
  val appExp : level -> level -> Temp.label -> gexp list -> gexp
  val arithExp : Absyn.oper -> gexp -> gexp -> gexp
  val intCompExp : Absyn.oper -> gexp -> gexp -> gexp
  val strCompExp : Absyn.oper -> gexp -> gexp -> gexp
  val recExp : gexp list -> gexp
  val seqExp : gexp -> gexp -> gexp
  val asgnExp : gexp -> gexp -> gexp
  val ifThenExp : gexp -> gexp -> gexp
  val ifThenElseExp : gexp -> gexp -> gexp -> gexp
  val whileExp : gexp -> gexp -> Temp.label -> gexp
  val forExp : access -> level -> gexp -> gexp -> gexp -> Temp.label -> gexp
  val breakExp : Temp.label -> gexp
  val letExp : gexp list -> gexp -> gexp
  val arrExp : gexp -> gexp -> gexp

  val funFrag : Temp.label -> gexp -> level -> unit

  val getResult : gexp -> frag list

  (* TODO: Delete when done testing *)
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
  type access = level * int (* F.access *)
  type frag = F.frag

  val outermost = TOP

  fun newLevel {parent, formals} =
    let
      val (newFrame, _) = F.newFrame (length formals + 1) R.paramBaseOffset
      val newLvl = LEVEL ({frame=newFrame,
                           sl_offset=0, (* TODO: should we assume this? *)
                           parent=parent}, ref ())
    in
      (newLvl, []) (* TODO: what is the 2nd value *)
    end

  fun allocInFrame lvl =
    (case lvl of
       LEVEL ({frame, sl_offset, parent}, u) =>
         (lvl, F.allocInFrame frame R.localsBaseOffset)
     | _ => Er.impossible "allocInFrame")

  (* Not currently supported *)
  fun allocInRegister () = Er.impossible "allocInRegister"

  val fragmentlist = ref ([] : frag list)

  datatype gexp = Ex of Tr.exp
                | Nx of Tr.stm
                | Cx of T.label * T.label -> Tr.stm

  (* Helpers *)

  fun memOff l r =
    Tr.MEM (Tr.BINOP (Tr.PLUS, l, r), F.wordSize)

  (* TODO: Can we just use R.FP here or does it need to be passed as
           as argument like in the book (pg 156) *)
  fun followSl (LEVEL ({frame, sl_offset, parent}, u')) u off =
        if u = u'
          then memOff (Tr.TEMP R.FP) (Tr.CONST off)
          else memOff (Tr.CONST sl_offset) (followSl parent u off)
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
           Tr.EXP e => e
         | _ => Tr.ESEQ (s, Tr.CONST 0))
    | unEx (Cx genstm) =
        let
          val r = T.newtemp ()
          val t = T.newlabel ()
          val f = T.newlabel ()
        in
          Tr.ESEQ (seq [Tr.MOVE (Tr.TEMP r, Tr.CONST 1),
                        genstm (t, f),
                        Tr.LABEL f,
                        Tr.MOVE (Tr.TEMP r, Tr.CONST 0),
                        Tr.LABEL t],
                   Tr.TEMP r)
        end

  (* unNx : gexp -> Tr.stm *)
  fun unNx (Ex e) = Tr.EXP e
    | unNx (Nx s) = s
    | unNx (Cx genstm) = Tr.EXP (unEx (Cx genstm))

  (* unCx : gexp -> T.label * T.label -> Tr.stm *)
  fun unCx (Ex (Tr.CONST 0)) =
        (fn (t, f) => Tr.JUMP (Tr.NAME f, [f]))
    | unCx (Ex (Tr.CONST 1)) =
        (fn (t, f) => Tr.JUMP (Tr.NAME t, [t]))
    | unCx (Ex e) =
        (fn (t, f) => Tr.CJUMP (Tr.TEST (Tr.NE, e, Tr.CONST 0), t, f))
    | unCx (Cx genstm) = genstm
    | unCx _ = Er.impossible "unCx"

  (* ITree generation *)

  (* First arg holds (level var declared at, offset in frame)
     Second arg holds level var accessed at
     Need to follow the parent of 2nd arg until levels match, each time
     follow the static link. *)
  fun simpleVar (LEVEL (_, u), off) lvl =
        Ex (followSl lvl u off)
    | simpleVar _ _ = Er.impossible "simpleVar"

  fun fieldVar v idx =
    let
      val off = Tr.CONST (idx * F.wordSize)
    in
      Ex (Tr.MEM (Tr.BINOP (Tr.PLUS, unEx v, off), F.wordSize))
    end

  (* TODO: Bounds check? *)
  fun subsVar v idx =
    let
      val off = Tr.BINOP (Tr.MUL, unEx idx, Tr.CONST F.wordSize)
    in
      Ex (Tr.MEM (Tr.BINOP (Tr.PLUS, unEx v, off), F.wordSize))
    end

  fun nilExp () = Ex (Tr.CONST 0)

  fun intExp z = Ex (Tr.CONST z)

  fun strExp s =
    let
      val lab = T.newlabel ()
      val frag = F.DATA {lab=lab, s=s}
    in
      fragmentlist := frag :: !fragmentlist;
      Ex (Tr.NAME lab)
    end

  (* Follow the levels to find the static link of the level where
     f is defined *)
  fun appExp (LEVEL ({sl_offset, parent=LEVEL (_, u), ...}, _)) lvl f args =
        let
          val sl = followSl lvl u sl_offset
          val args' = sl :: map unEx args
        in
          Ex (Tr.CALL (Tr.NAME f, args'))
        end
    | appExp TOP _ f args =
        Ex (F.externalCall (Symbol.name f) (map unEx args))
    | appExp _ _ _ _ = Er.impossible "appExp"

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

  fun strCompExp Absyn.LtOp ge1 ge2 =
        Ex (F.externalCall "stringLessThan" [unEx ge1, unEx ge2])
    | strCompExp Absyn.LeOp ge1 ge2 =
        Ex (F.externalCall "not" [unEx (strCompExp Absyn.GtOp ge1 ge2)])
    | strCompExp Absyn.GtOp ge1 ge2 = strCompExp Absyn.LtOp ge2 ge1
    | strCompExp Absyn.GeOp ge1 ge2 = strCompExp Absyn.LeOp ge2 ge1
    | strCompExp Absyn.EqOp ge1 ge2 =
        Ex (F.externalCall "stringEqual" [unEx ge1, unEx ge2])
    | strCompExp Absyn.NeqOp ge1 ge2 =
        Ex (F.externalCall "not" [unEx (strCompExp Absyn.EqOp ge1 ge2)])
    | strCompExp _ _ _ = Er.impossible "strCompExp"

  fun recExp fs =
    let
      val r = T.newtemp ()
      val sz = (length fs) * F.wordSize
    in
      Ex (Tr.ESEQ
        (Tr.SEQ
          (Tr.MOVE (Tr.TEMP r, F.externalCall "allocRecord" [Tr.CONST sz]),
           seq (initFields r fs 0)),
         Tr.TEMP r))
    end
  and initFields _ [] _ = []
    | initFields r (f :: fs) n =
        Tr.MOVE (Tr.MEM
          (Tr.BINOP (Tr.PLUS, Tr.TEMP r, Tr.CONST n), F.wordSize),
           unEx f)
        :: initFields r fs (n + F.wordSize)

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

  fun arrExp sz init =
    let
      val r = T.newtemp ()
    in
      Ex (Tr.ESEQ
        (Tr.MOVE (Tr.TEMP r, F.externalCall "initArray" [unEx sz, unEx init]),
         Tr.TEMP r))
    end

  fun funFrag f bdy (LEVEL ({frame, ...}, _)) =
        let
          val frag = F.PROC {name=f, body=unNx bdy, frame=frame}
        in
          fragmentlist := frag :: !fragmentlist
        end
    | funFrag _ _ _ = Er.impossible "funFrag"

  (* Wrap the whole program in a PROC frag *)
  fun getResult prog =
    let
      val (frm, _) = F.newFrame 0 R.paramBaseOffset
      val frag = F.PROC {name=Temp.namedlabel "tigermain",
                         body=unNx prog,
                         frame=frm}
    in
      fragmentlist := frag :: !fragmentlist;
      !fragmentlist
    end

  (* TODO: Delete when done testing *)
  fun reset () = fragmentlist := []
end
