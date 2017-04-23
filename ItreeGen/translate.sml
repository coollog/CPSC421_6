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
  val allocInRegister : unit -> access

  val getResult : unit -> frag list

  type gexp

  (* ... *)

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

  local exception NotImplemented in
    fun allocInRegister _ = raise NotImplemented
  end

end (* functor TranslateGen *)






