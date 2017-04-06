(* frame.sml *)
(* Christopher Chute *)
(* April 2, 2017 *)
(* CPSC 421 - Zhong Shao *)

signature FRAME =
sig 
  type offset = int
  type frame
  
  val newFrame: int -> frame * offset list
  val allocInFrame: frame -> offset
  val wordSize: int
  val getOffsetForParam: int -> offset
  val externalCall: string * Tree.exp list -> Tree.exp
  val nLocals: frame -> int

  (**
   * A code fragment in the intermediate code tree. Either a procedure (PROC)
   * or a data fragment (DATA).
   *)
  datatype frag = PROC of {name: Temp.label, body: Tree.stm, frame: frame} 
                | DATA of {lab: Temp.label, s: string}

end (* signature FRAME *)


structure Frame: FRAME = 
struct
  structure R: REGISTER_STD = Register
  structure T = Tree

  type offset = int          (* Used to refer to words within a frame *)
  type frame = {
    nParams: int,            (* Number of incoming formal parameters *)
    offsetList: offset list, (* List for offsets for incoming formal parameters *)
    nLocals: int ref,        (* # of local variables so far *)
    maxArgs: int ref         (* Max outgoing args for the function *)
  }

  datatype frag = PROC of {name : Temp.label, body: Tree.stm, frame: frame} 
                | DATA of {lab : Temp.label, s: string}

  (**
   * Size of a word (in bytes) assumed by our architecture.
   *)
  val wordSize = 4 (* bytes *)

  (**
   * Get the offset for the n-th local variable (indexed starting from 1)
   * If l = R.localsBaseOffset, we use offsets {l, l-4, ..., l-4(n-1)}.
   * Assumes the value of n will not violate the enclosing frame's bounds.
   *)
  fun getOffsetForLocal(n: int): offset = R.localsBaseOffset - wordSize * (n-1);

  (**
   * Get the offset for the n-th function parameter (indexed starting from 1)
   * If p = R.paramBaseOffset, we use offsets {p+4, p+8, ..., p+4n}.
   * We start at p+4 to make room for the static link (see p. 127 of Appel).
   * Assumes the value of n will not violate any frame's bounds.
   *)
  fun getOffsetForParam(n: int): offset = R.paramBaseOffset + wordSize * n;

  (**
   * Get a new frame for a function invocation with nParams incoming formal parameters.
   *)
  fun newFrame(nParams: int): (frame * offset list) =
    let
      (**
       * Get the list of formal parameter offsets.
       * They will be returned in reverse order (high -> low address).
       *)
      fun getOffsets(nLeft): offset list =
        if nLeft = 0 then nil
        else (getOffsetForParam(nLeft)::getOffsets(nLeft - 1))
      val offsetList = List.rev(getOffsets(nParams))
      val frame: frame = {
        nParams = nParams,       (* Number of incoming formal parameters *)
        offsetList = offsetList, (* List of offsets for incoming formal parameters *)
        nLocals = ref 0,         (* 0 local variables seen so far *)
        maxArgs = ref 0          (* 0 max outgoing parameters so far *)
      } 
    in
      (frame, offsetList)
    end

  (**
   * Allocate space for a local variable in the frame
   * Return the offset of the newly allocated space within the frame
   *)
  fun allocInFrame(f: frame): offset =
    let
      val nLocals = !(#nLocals f)
    in
      ((#nLocals f) := nLocals + 1;
      getOffsetForLocal(nLocals)) (* New local var is at index `old nLocals` *)
    end

  (**
   * Make a call to a runtime library function (see page 165 in Appel).
   * s: The name of the runtime function to call.
   * args: List of Tree.exp's to be passed to the function.
   *)
  fun externalCall(s, args) = T.CALL(T.NAME(Temp.namedlabel(s)), args)

  (**
   * Get the number of local variables allocated so far in this frame.
   *)
  fun nLocals(f: frame): int = (!(#nLocals f))

end (* structure Frame *)
