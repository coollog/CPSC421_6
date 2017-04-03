(* translate.sml *)

signature TRANSLATE =
sig
  type level
  type access
  type frag
  type offset

  (*
   * val outermost : level
   * val newLevel : {parent: level, formals: 'a list} ->
   *                                   (level * (('a * access) list))
   * val allocInFrame : level -> access
   * val allocInRegister : unit -> access
   *)

  val getResult : unit -> frag list
  val outermost: level

  type gexp

  (* ... *)

  val newLevel: {parent: level, name: Temp.label, formals: bool list} -> level
  val formals: level -> offset list

  val unEx: gexp -> Tree.exp
  val unNx: gexp -> Tree.stm
  val unCx: gexp -> (Temp.label * Temp.label -> Tree.stm)

  val letExp: gexp list * gexp -> gexp
  val intExp: int -> gexp

  val procEntryExit: {level: level, body: gexp} -> unit
end (* signature TRANSLATE *)


functor TranslateGen(Register : REGISTER_STD) : TRANSLATE =
struct

  structure F = Frame
  structure Tr = Tree
  structure T = Temp
  structure Er = ErrorMsg

  datatype level = LEVEL of {frame : F.frame,
                             (* sl_offset : int, *) (* wtf is this *)
                             parent : level} * unit ref
                 | TOP

  type access = level * int  (* might needs to be changed later *)
  type frag = F.frag
  type offset = F.offset

  val outermost = TOP

  val fragmentlist = ref ([] : frag list)
  fun getResult () = !fragmentlist

  datatype gexp = Ex of Tr.exp
                | Nx of Tr.stm
                | Cx of T.label * T.label -> Tr.stm

  (* ...... details ....... *)

  fun error s = ErrorMsg.impossible ("ITreeGen: " ^ s)

  fun newLevel {parent, name, formals} =
    LEVEL ({frame = F.newFrame {name = name,
                                formals = true :: formals},
            parent = parent}, ref ())

  fun formals TOP = []
    | formals (l as LEVEL ({frame, parent}, _)) = tl (Frame.formals frame)


  fun seq [] = Tr.EXP (Tr.CONST 0)
    | seq [s] = s
    | seq (h :: t) = Tr.SEQ (h, seq t)

  fun unEx (Ex e) = e
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
    | unEx (Nx s) = Tr.ESEQ (s, Tr.CONST 0)

  fun unNx (Ex e) = Tr.EXP e
    | unNx (Cx genstm) =
      let
          val t = T.newlabel()
          val f = t
      in
          Tr.SEQ (genstm (t, f), Tr.LABEL t)
      end
    | unNx (Nx s) = s

  fun unCx (Ex (Tr.CONST 0)) = (fn (t, f) => Tr.JUMP (Tr.NAME f, [f]))
    | unCx (Ex (Tr.CONST _)) = (fn (t, f) => Tr.JUMP (Tr.NAME t, [t]))
    | unCx (Ex e) = (fn (t, f) => Tr.CJUMP (Tr.TEST (Tr.NE, e, Tr.CONST 0), t, f))
    | unCx (Cx genstm) = genstm
    | unCx (Nx _) = error "calling unCx on Nx"

  fun letExp ([], body) = body
    | letExp (decs, body) = Ex (Tr.ESEQ (seq (map unNx decs), unEx body))

  fun intExp i = Ex (Tr.CONST i)

  fun procEntryExit {level = level, body = exp} =
    let
        val frame = case level of
                        LEVEL ({frame, parent}, _) => frame
                      | TOP => error "Cannot enter top-level frame"
        val body' = Frame.procEntryExit1 (frame, unNx exp)
        val frag = Frame.PROC {body = body', frame = frame, name = F.name frame}
    in
        fragmentlist := frag :: !fragmentlist
    end

end (* functor TranslateGen *)
