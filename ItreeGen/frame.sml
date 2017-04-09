(*
 * Assignment 6
 * CS 521 Spring 2017
 * Wolf Honore
 *)

signature FRAME =
sig
  type offset = int
  type frame

  val wordSize : int

  val newFrame : int -> int -> frame * offset list
  val allocInFrame : frame -> int -> offset

  datatype frag = PROC of {name : Temp.label, body : Tree.stm, frame : frame}
                | DATA of {lab : Temp.label, s : string}

  val externalCall : string -> Tree.exp list -> Tree.exp
end

structure Frame : FRAME =
struct
  type offset = int
  type frame = {formals : int,        (* number of formal parameters *)
                offlst : offset list, (* offset list for formals *)
                locals : int ref,     (* # of local variables so far *)
                maxargs : int ref}    (* max outgoing args for the function *)

  val wordSize = 4

  (* Assumes all args are passed in stack *)
  fun newFrame nforms paramOff =
    let
      val offs = List.tabulate (nforms, (fn n => paramOff + n * wordSize))
    in
      ({formals=nforms,
        offlst=offs,
        locals=ref 0,
        maxargs=ref 0}, offs) (* TODO: what is this? *)
    end

  (* Returns an offset after the formals and all local vars *)
  fun allocInFrame {formals, offlst, locals, maxargs} localOff =
    let
      val off = localOff + !locals * wordSize
    in
      locals := !locals + 1; off
    end

  datatype frag = PROC of {name : Temp.label, body : Tree.stm, frame : frame}
                | DATA of {lab : Temp.label, s : string}

  fun externalCall f args =
    Tree.CALL (Tree.NAME (Temp.namedlabel f), args)
end
