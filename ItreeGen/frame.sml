(* frame.sml *)

signature FRAME =
sig
  type offset = int
  type frame

  (* Takes the number of formals and returns a new frame with the formals and
     offlst fields populated and the locals and maxargs fields set to 0. Right
     now we assume that all formals escape (i.e., all values in the formals list
     are true). *)
  val newFrame: {name: Temp.label, formals: bool list} -> frame
  (* Takes a frame and allocates stack space for a new local. Increments locals
     by 1 and returns the offset of the new local. *)
  val allocInFrame : frame -> offset
  val procEntryExit1: frame * Tree.stm -> Tree.stm

  val formals: frame -> offset list
  val name: frame -> Temp.label
  datatype frag = PROC of {name : Temp.label, body: Tree.stm, frame: frame}
                | DATA of {lab : Temp.label, s: string}

end (* signature FRAME *)


structure Frame : FRAME =
struct
  type offset = int
  type frame = {name: Temp.label,
                formals : bool list,   (* list of bools representing if the formals escape *)
                offlst : offset list,  (* offset list for formals *)
                locals : int ref,      (* # of local variables so far *)
                maxargs : int ref}     (* max outgoing args for the function *)

  datatype frag = PROC of {name : Temp.label, body: Tree.stm, frame: frame}
                | DATA of {lab : Temp.label, s: string}

  val wordSize = 4 (* 4 bytes *)

  fun newFrame {name, formals} =
    let
        val offlst = List.tabulate (length formals, fn x => ~x * wordSize)
    in
        {name = name,
         formals = formals,
         offlst = offlst,
         locals = ref 0,
         maxargs = ref 0}

    end

  fun allocInFrame (fr: frame) =
    let
        val {locals, ...} = fr
    in
        !locals = !locals + 1;
        ~(!locals) * wordSize
    end

  fun formals (fr: frame) = #offlst fr
  fun name (fr: frame) = #name fr

  fun procEntryExit1 (_, stm) = stm

end (* structure Frame *)
