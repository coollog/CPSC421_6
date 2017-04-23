(* translate.sml *)

signature TRANSLATE =
sig
  type level
  type access
  type frag

  val outermost : level

  val newLevel : {parent: level, formals: 'a list} ->
                 level * ('a * access) list

  val allocInFrame : level -> access

  val getResult : unit -> frag list

  type gexp

  val unEx : gexp -> Tree.exp
  val unNx : gexp -> Tree.stm
  val unCx : gexp -> (Temp.label * Temp.label -> Tree.stm)

end (* signature TRANSLATE *)


functor TranslateGen(Register : REGISTER_STD) : TRANSLATE =
struct

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
  fun getResult () = !fragmentlist

  datatype gexp = Ex of Tr.exp
                | Nx of Tr.stm
                | Cx of T.label * T.label -> Tr.stm

  fun newLevel({parent, formals}) =
    let
      val numParams = length formals + 1 (* +1 for static link *)
      val (frame, offsets) = F.newFrame numParams

      val level = LEVEL({frame=frame,
                         sl_offset=R.paramBaseOffset,
                         parent=parent}, ref())

      val formalsOffsets = ListPair.zip(formals, tl offsets)
      val accesses = map (fn fo => (#1 fo, (level, #2 fo))) formalsOffsets
    in
      (level, accesses)
    end

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
      | _ => Tr.CJUMP(Tr.TEST(Tr.NE, e, Tr.CONST 0), t, f))
    | unCx(Cx genstm) = genstm
    | unCx(Nx s) = ErrorMsg.impossible "turning statement into conditional jump"

end (* functor TranslateGen *)






