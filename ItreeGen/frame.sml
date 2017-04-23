(* frame.sml *)

signature FRAME =
sig
  type offset = int
  type frame

  val newFrame : int -> frame * offset list
  val allocInFrame : frame -> offset

  datatype frag = PROC of {name : Temp.label, body: Tree.stm, frame: frame}
                | DATA of {lab : Temp.label, s: string}

end (* signature FRAME *)


structure Frame : FRAME =
struct

  structure R = Register

  type offset = int
  type frame = {formals : int,         (* number of formal parameters *)
                offlst : offset list,  (* offset list for formals *)
                locals : int ref,      (* # of local variables so far *)
                maxargs : int ref}     (* max outgoing args for the function *)

  datatype frag = PROC of {name : Temp.label, body: Tree.stm, frame: frame}
                | DATA of {lab : Temp.label, s: string}

  fun newFrame numParams =
    let
      (* Each param is a word *)
      val offlst = List.tabulate(numParams, fn i => R.paramBaseOffset + i * 4)
    in
      ({formals=numParams,
        offlst=offlst,
        locals=ref 0,
        maxargs=ref 0}, offlst)
    end

  fun allocInFrame({locals,...}:frame) =
    (* Each local is a word *)
    (locals := !locals + 1; R.localsBaseOffset - !locals * 4)

end (* structure Frame *)

