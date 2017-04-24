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

  val unit : gexp
  val simpleVar : access * level -> gexp
  val subscriptVar : gexp * gexp -> gexp
  val arrayExp : gexp * gexp -> gexp
  val recordExp : gexp list -> gexp

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


  val unit = Ex(Tr.CONST 0)

  fun simpleVar(access, level) =
    let
      fun findVariableSL(access as (LEVEL(_, accessLevel), offset),
                         LEVEL({frame,sl_offset,parent}, curLevel),
                         curTree) =
        if accessLevel = curLevel then
          Ex(Tr.MEM(Tr.BINOP(Tr.PLUS, curTree, Tr.CONST offset), 4))
        else
          let val curTree' =
            Tr.MEM(Tr.BINOP(Tr.PLUS, curTree, Tr.CONST sl_offset), 4)
          in findVariableSL(access, parent, curTree') end

        | findVariableSL(_, TOP, _) =
            ErrorMsg.impossible "cannot find variable"

    in findVariableSL(access, level, Tr.TEMP R.FP) end

  fun subscriptVar(varExp, idxExp) =
    let val varTree = unEx varExp
        val idxTree = unEx idxExp
    in Ex(Tr.MEM(
        Tr.BINOP(Tr.PLUS, varTree,
                          Tr.BINOP(Tr.MUL, idxTree, Tr.CONST 4)), 4)) end

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

end (* functor TranslateGen *)






