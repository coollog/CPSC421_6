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

  val setOutArgs : frame -> int -> unit

  datatype frag = PROC of {name : Temp.label, body : Tree.stm, frame : frame}
                | DATA of {lab : Temp.label, s : string}

  val pushArgs : Tree.exp list -> Temp.temp -> int -> Tree.exp list
  val externalCall : string -> Tree.exp list -> Temp.temp -> frame -> Tree.exp
end

structure Frame : FRAME =
struct
  structure Tr = Tree

  type offset = int
  type frame = {formals : int,        (* number of formal parameters *)
                offlst : offset list, (* offset list for formals *)
                locals : int ref,     (* # of local variables so far *)
                maxargs : int ref}    (* max outgoing args for the function *)

  val wordSize = 4

  (* iPush = true  : IG will put arguments on stack before call
     iPush = false : CG will put arguments on stack before call *)
  val iPush = true

  (* localsOffsetNeg = false : localsOffset in register.sml is a positive value
                               and will be negated by IG
     localsOffsetNeg = true  : localsOffset in register.sml is a negative value
                               and will be unchanged by IG *)
  val localsOffsetNeg = false

  (* Assumes all args are passed on the stack *)
  fun newFrame nforms paramOff =
    let
      val offs = List.tabulate (nforms, (fn n => paramOff + n * wordSize))
    in
      ({formals=nforms,
        offlst=offs,
        locals=ref 0,
        maxargs=ref 0}, offs)
    end

  (* Returns an offset after all local vars. Assumes localOff is positive, but
     variables are stored at negative offset from FP *)
  fun allocInFrame {formals, offlst, locals, maxargs} localOff =
    let
      val off =
        if localsOffsetNeg
          then localOff - !locals * wordSize
          else ~(localOff + !locals * wordSize)
    in
      locals := !locals + 1; off
    end

  (* Update maxargs if nargs > maxargs *)
  fun setOutArgs {formals, offlst, locals, maxargs} nargs =
    maxargs := Int.max (!maxargs, nargs)

  datatype frag = PROC of {name : Temp.label, body : Tree.stm, frame : frame}
                | DATA of {lab : Temp.label, s : string}

  (* Move each argument to a new temporary, then move the temporaries to the
     appropriate offset from SP. The two sets of moves is needed so arguments
     are pushed in the right order when there is something like f(x, g(y)) *)
  fun pushArgs' [] _ _ = []
    | pushArgs' (a :: as') sp n =
        let
          val tmp = Temp.newtemp ()
          val mem = Tr.MEM (Tr.BINOP (Tr.PLUS, Tr.TEMP sp, Tr.CONST (n * wordSize)), wordSize)
        in
          Tr.ESEQ (Tr.MOVE (Tr.TEMP tmp, a), Tr.CONST 0)
          :: pushArgs' as' sp (n + 1)
          @ [Tr.ESEQ (Tr.MOVE (mem, Tr.TEMP tmp), Tr.CONST 0)]
        end

  fun pushArgs args sp n =
    if iPush then pushArgs' args sp n else args

  (* Call an external function. Makes no special assumptions except that it
     does not take a static link *)
  fun externalCall f args sp frame =
    (setOutArgs frame (length args);
     Tree.CALL (Tree.NAME (Temp.namedlabel f), pushArgs args sp 0))
end
