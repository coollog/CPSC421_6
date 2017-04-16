(* codegen.sml *)

signature CODEGEN =
sig
  structure F : FRAME
  structure R : REGISTER

  (* translate each canonical tree into a list of assembly instructions *)
  val codegen : Tree.stm -> Assem.instr list

  (* converting a string fragment into the actual assembly code *)
  val string : Temp.label * string -> string

  (* procEntryExit sequence + function calling sequence tune-up
   * + mapping pseudo-registers to memory load/store instructions
   * and actual registers.
   * This is a post-pass, to be done after register allocation.
   *)
  val procEntryExit : {name : Temp.label,
                       body : (Assem.instr * Temp.temp list) list,
                       allocation : R.register Temp.Table.table,
                       formals : Temp.temp list,
                       frame : Frame.frame} -> Assem.instr list


end (* signature CODEGEN *)

structure Codegen : CODEGEN =
struct

  structure T = Tree
  structure A = Assem
  structure Er = ErrorMsg
  structure F = Frame
  structure R = Register
  structure S = Symbol

  (* Builds an assembly comment. *)
  fun explain(comment) = "\t\t\t\t\t\t\t# " ^ comment ^ "\n"

  fun codegen(stm: T.stm) : A.instr list =
  let val ilist = ref (nil: A.instr list)
    fun emit x = ilist := x :: !ilist
    fun result(gen) = let val t = Temp.newtemp() in gen t; t end

    type preInstr = {assem: string, reg: Temp.temp list, nextIdx: int}

    (* Some functions to make munch code more organized. *)
    fun emitLABEL(lab) = emit(A.LABEL{assem=assLABEL(lab), lab=lab})
    and emitOPER(assem, src, dst, jump) =
      emit(A.OPER{assem=assem,src=src,dst=dst,jump=jump})
    and emitMOVE(assem, src, dst) =
      emit(A.MOVE{assem=assem,src=src,dst=dst})

    and resultOPER(assem, src, dst, jump) =
      result(fn r => emitOPER(assem, src, r::dst, jump))
    and resultOPERsrcAsDst(assem, src, jump) =
      result(fn r => emitOPER(assem, src @ [r], [r], jump))

    (* Generates the various assembly instructions. *)
    and assLABEL(lab) = S.name lab ^ ":\n"
    and assPUSH(pSrc) = "\tpushl " ^ pSrc ^ explain("push onto stack")
    and assJMP(lab) = "\tjmp `j0" ^ explain("jump to " ^ S.name lab)
    and assJMPexp() = "\tjmp `s0" ^ explain("jump to somewhere")
    and assCMP(relop, lab1, lab2) =
      let
        val jumpInstr = case relop of
          T.EQ => "je"
        | T.NE => "jne"
        | T.GT => "jg"
        | T.GE => "jge"
        | T.LT => "jl"
        | T.LE => "jle"
        | _ => ErrorMsg.impossible "CodeGen: INVALID CJUMP"
      in
        "\tcmpl `s0, `s1" ^ explain("compare for jump...") ^
        jumpInstr ^ " `j0" ^ explain("if true: jump to " ^ S.name lab1) ^
        "\tjmp `j1" ^ explain("if false: jump to " ^ S.name lab2)
      end
    and assMOVreg(pSrc, pDst) =
      "\tmovl " ^ pSrc ^ ", " ^ pDst ^ explain("move to register")
    and assMOVmem(pSrc, pDst) =
      "\tmovl " ^ pSrc ^ ", " ^ pDst ^ explain("move to memory")
    and assMOVfetch() = "\tmovl (`s0), `d0" ^ explain("fetch from memory")
    and assMOVconst(i) = "\tmovl $" ^ Int.toString i ^ ", `d0" ^
                         explain("move constant to register")
    and assADD(pSrc, pDst) =
      "\taddl " ^ pSrc ^ ", " ^ pDst ^ explain("add two registers")
    and assSUB(pSrc, pDst) =
      "\tsubl " ^ pSrc ^ ", " ^ pDst ^ explain("subtract two registers")
    and assIMUL(pSrc, pDst) =
      "\timull " ^ pSrc ^ ", " ^ pDst ^ explain("multiply two registers")
    and assIDIV() = "\tmovl `s0, `d1\t# save %eax\n" ^
                    "\tmovl `s1, `d2\t# save %edx\n" ^
                    "\tmovl `s2, `s0\t# put divisor in %eax\n" ^
                    "\tmovl $0, `s1\t# put 0 in %edx\n" ^
                    "\tidiv `s3\t# divide by register\n" ^
                    "\tmovl `s3, `d0\t# put quotient in result register\n" ^
                    "\tmovl `d1, `s0\t# restore %eax\n" ^
                    "\tmovl `d2, `s1\t# restore %edx\n"
    and assAND(pSrc, pDst) =
      "\tandl " ^ pSrc ^ ", " ^ pDst ^ explain("bitwise and two registers")
    and assOR(pSrc, pDst) =
      "\torl " ^ pSrc ^ ", " ^ pDst ^ explain("bitwise or two registers")

    fun munchStm(T.SEQ(a,b)) = (munchStm a; munchStm b)

      (* label *)
      | munchStm(T.LABEL lab) = emitLABEL(lab)

      (* jump *)
      | munchStm(T.JUMP(T.NAME lab, _)) =
          emitOPER(assJMP lab, [], [], SOME[lab])

      | munchStm(T.JUMP(e, labels)) =
          emitOPER(assJMPexp(), [munchExp e], [], SOME labels)

      (* cjump *)
      | munchStm(T.CJUMP(T.TEST(relop, e1, e2), lab1, lab2)) =
          emitOPER(assCMP(relop, lab1, lab2),
                   [munchExp e1, munchExp e2], [R.EBX], SOME[lab1, lab2])

      (* MOVE reg BINOP *)
      | munchStm(T.MOVE(T.TEMP t, exp as T.BINOP(_))) =
          let val pDst = evalExp(T.TEMP t, "d", 0)
          in munchExpWithDst(exp, pDst) end

      (* MOVE mem BINOP *)
      | munchStm(T.MOVE(T.MEM(e1, _), exp as T.BINOP(_))) =
          let val pDst = evalExp(T.MEM(e1, 4), "d", 0)
          in munchExpWithDst(exp, pDst) end

      (* MOVE reg e1 *)
      | munchStm(T.MOVE(T.TEMP t, e1)) =
          let val pDst = evalExp(T.TEMP t, "d", 0)
              val pSrc = evalExp(e1, "s", 0)
          in emitOPER(assMOVreg(#assem pSrc, #assem pDst),
                      #reg pSrc, #reg pDst, NONE) end

      (* MOVE MEM[e1] e2 *)
      | munchStm(T.MOVE(T.MEM(e1, _),e2)) =
          let val pDst=evalExp(T.MEM(e1, 4), "d", 0)
              val pSrc=evalExp(e2, "s", 0)
          in emitOPER(assMOVmem(#assem pSrc, #assem pDst),
                      #reg pSrc, #reg pDst, NONE) end

      | munchStm(T.MOVE _) = ErrorMsg.impossible "CodeGen: INVALID MOV"

      | munchStm(T.EXP e) = (munchExp e; ())

    and
      (* Operands of assembly instructions could be registers or expressions for
       * memory addresses, so this helps to process these.
       *)
        (* like %eax *)
        evalExp(T.TEMP t, prefix, startIdx):preInstr =
          {assem="`" ^ prefix ^ Int.toString startIdx,
           reg=[t], nextIdx=startIdx + 1}

        (* like $Hello *)
      | evalExp(T.NAME lab, _, startIdx):preInstr =
          {assem="$" ^ S.name lab, reg=[], nextIdx=startIdx}

        (* like $4 *)
      | evalExp(T.CONST k, _, startIdx):preInstr =
          {assem="$" ^ Int.toString k, reg=[], nextIdx=startIdx}

        (* like (%eax) *)
      | evalExp(T.MEM(T.TEMP t, _), prefix, startIdx):preInstr =
          {assem="(`" ^ prefix ^ Int.toString startIdx ^ ")",
           reg=[t], nextIdx=startIdx + 1}

        (* like -4(%eax) *)
      | evalExp(T.MEM(T.BINOP(T.PLUS, T.TEMP t, T.CONST k), _),
                prefix, startIdx):preInstr =
          {assem=Int.toString k ^ "(`" ^ prefix ^ Int.toString startIdx ^ ")",
           reg=[t], nextIdx=startIdx + 1}

        (* like -4(%eax) *)
      | evalExp(T.MEM(T.BINOP(T.PLUS, T.CONST k, T.TEMP t), _),
                prefix, startIdx):preInstr =
          {assem=Int.toString k ^ "(`" ^ prefix ^ Int.toString startIdx ^ ")",
           reg=[t], nextIdx=startIdx + 1}

        (* like (%eax, %ebx, 1) *)
      | evalExp(T.MEM(T.BINOP(T.PLUS, T.TEMP t1, T.TEMP t2), _),
                prefix, startIdx):preInstr =
          {assem="(`" ^ prefix ^ Int.toString startIdx ^
                 ", `" ^ prefix ^ Int.toString(startIdx + 1) ^ ", 1)",
           reg=[t1, t2], nextIdx=startIdx + 2}

      | evalExp(exp, prefix, startIdx):preInstr =
          {assem="`" ^ prefix ^ Int.toString startIdx,
           reg=[munchExp exp], nextIdx=startIdx + 1}

    and
      (* Munching to a dst register for encapsulated subexpressions. *)
      munchExpWithDst(T.BINOP(T.PLUS,e1,e2), pDst) =
          let val pSrc1 = evalExp(e1, "s", 0)
              val pSrc2 = evalExp(e2, "s", #nextIdx pSrc1)
          in emitOPER(assMOVreg(#assem pSrc1, #assem pDst) ^
                      assADD(#assem pSrc2, #assem pDst),
                      #reg pSrc1 @ #reg pSrc2 @ #reg pDst, #reg pDst, NONE) end

    | munchExpWithDst(_) = ErrorMsg.impossible "CodeGen: INVALID BINOP"


    and
      (* FETCH MEM[i] *)
      munchExp(T.MEM(e1, s1)) =
          resultOPER(assMOVfetch(), [munchExp e1], [], NONE)

      (* ADD *)
      | munchExp(T.BINOP(T.PLUS,e1,e2)) =
          resultOPERsrcAsDst(assMOVreg("`s0", "`s2") ^ assADD("`s1", "`s2"),
                             [munchExp e1, munchExp e2], NONE)

      (* SUB *)
      | munchExp(T.BINOP(T.MINUS,e1,e2)) =
          resultOPERsrcAsDst(assMOVreg("`s0", "`s2") ^ assSUB("`s1", "`s2"),
                             [munchExp e1, munchExp e2], NONE)

      (* IMUL *)
      | munchExp(T.BINOP(T.MUL,e1,e2)) =
          resultOPERsrcAsDst(assMOVreg("`s0", "`s2") ^ assIMUL("`s1", "`s2"),
                             [munchExp e1, munchExp e2], NONE)

      (* IDIV *)
      | munchExp(T.BINOP(T.DIV,e1,e2)) =
          resultOPER(assIDIV(),
                    [R.RV, R.EDX, munchExp e1, munchExp e2],
                    [Temp.newtemp(), Temp.newtemp()], NONE)

      (* AND *)
      | munchExp(T.BINOP(T.AND,e1,e2)) =
          resultOPERsrcAsDst(assMOVreg("`s0", "`s2") ^ assAND("`s1", "`s2"),
                             [munchExp e1, munchExp e2], NONE)

      (* OR *)
      | munchExp(T.BINOP(T.OR,e1,e2)) =
          resultOPERsrcAsDst(assMOVreg("`s0", "`s2") ^ assOR("`s1", "`s2"),
                             [munchExp e1, munchExp e2], NONE)

      | munchExp(T.BINOP(_)) = ErrorMsg.impossible "CodeGen: INVALID BINOP"

      (* CONST *)
      | munchExp(T.CONST k) = resultOPER(assMOVconst(k), [], [], NONE)

      | munchExp(T.CONSTF _) = ErrorMsg.impossible "CodeGen: INVALID CONSTF"

      | munchExp(T.TEMP t) = t

      | munchExp(T.NAME _) =
          ErrorMsg.impossible "CodeGen: INVALID TOP LEVEL NAME"

      (* CALL *)
      | munchExp(T.CALL(T.NAME lab, args)) =
        result(fn r =>
          let
            val paramSize = 4 * length(args)
            val pushTrueCallerSaves = String.concat(
              map (fn reg => "\tpushl " ^ reg ^ explain("save caller save"))
                  R.truecallersaves)
            (* Pushl args onto stack. *)
            val revArgs = rev(args)
            fun pushArg(arg) =
              let val pSrc = evalExp(arg, "s", 0)
              in emitOPER(assPUSH(#assem pSrc), #reg pSrc, [], NONE) end
            fun pushArgs(args) = app pushArg revArgs
            val revTrueCallerSaves = rev(R.truecallersaves)
            val popTrueCallerSaves = String.concat(
              map (fn reg => "\tpopl " ^ reg ^ explain("restore caller save"))
                  revTrueCallerSaves)
          in
            (* Pushl caller saves *)
            emitOPER(pushTrueCallerSaves, [], [], NONE);
            pushArgs(args);
            emitOPER("\tcall " ^ Symbol.name lab ^ "\n" ^
                     "\taddl $" ^ Int.toString paramSize ^ ", `s0" ^
                     explain("pop arguments") ^
                     "\tmovl `s1, `d0" ^ explain("get return value"),
                     [R.SP, R.RV], [r], NONE);
            (* Popl caller saves *)
            emitOPER(popTrueCallerSaves, [], [], NONE)
          end)

      | munchExp(T.ESEQ _ | T.CVTOP _ | T.CALL _) =
          ErrorMsg.impossible "CodeGen: INVALID ITREE EXP"

  in munchStm stm;
     rev(!ilist)
  end

  (* Turns a string into an assembly section with a length and a sequence of
   * byte codes.
   *)
  fun string(label, s) =
    let
      val charList = explode(s)
      val ordList = map (fn c => Int.toString(ord(c))) charList
      val byteSeq = foldr (fn (s1, s2) => s1 ^ ", " ^ s2) "0" ordList
    in
      S.name label ^ ":\n" ^
      "\t.long " ^ Int.toString(size s) ^ "\n" ^
      "\t.byte " ^ byteSeq ^ "\n"
    end

  (* procEntryExit sequence + function calling sequence tune-up
   * + mapping pseudo-registers to memory load/store instructions
   * and actual registers.
   * This is a post-pass, to be done after register allocation.
   *)

  (*fun procEntryExit2(frame, body) =
    body @
    [A.OPER{assem="",
            src=[R.ZERO,R.RA,R.SP]@R.calleesaves,
            dst=[],jump=SOME[]}]*)
  (*fun procEntryExit3(FRAME(name, params, locals), body) =
    (prolog = "PROCEDURE " ^ Symbol.name name ^ "\n",
     body = body,
     epilog = "END " ^ Symbol.name name ^ "\n")*)

  fun procEntryExit({name : Temp.label,
                     body : (Assem.instr * Temp.temp list) list,
                     allocation : R.register Temp.Table.table,
                     formals : Temp.temp list,
                     frame : Frame.frame}) =
    let
      val localVarSize = 4 * (!(#locals frame) + R.NPSEUDOREGS)
      (*
        /* Subroutine Prologue */
        pushl %ebp      /* Save the old base pointer value. */
        movl %esp, %ebp /* Set the new base pointer value. */
        subl $4, %esp   /* Make room for one 4-byte local variable. */
        pushl %edi      /* Save the values of registers that the function */
        pushl %esi      /* will modify. This function uses EDI and ESI. */
        /* (no need to save EBX, EBP, or ESP) */
      *)
      val prologue = [
        A.OPER({assem=".globl " ^ Symbol.name name ^ "\n" ^
                      ".type " ^ Symbol.name name ^ ", @function\n" ^
                      Symbol.name name ^ ":\n" ^
                      "\tpushl %ebp" ^ explain("save base pointer") ^
                      "\tmovl %esp, %ebp" ^
                      explain("base pointer <- stack pointer") ^
                      "\tsubl $" ^ Int.toString localVarSize ^ ", %esp" ^
                      explain("allocate space for local variables"),
                src=[],dst=[],jump=NONE})
      ] @ map
            (fn reg => A.OPER({assem="\tpushl " ^ reg ^
                                     explain("push callee save"),
                               src=[],dst=[],jump=NONE}))
            R.calleesaves

      (*
        /* Subroutine Epilogue */
        popl %esi       /* Recover register values. */
        popl %edi
        movl %ebp, %esp /* Deallocate the local variable. */
        popl %ebp       /* Restore the caller's base pointer value. */
        ret
      *)
      val epilogue =
        map
          (fn reg => A.OPER({assem="\tpopl " ^ reg ^ explain("pop callee save"),
                             src=[],dst=[],jump=NONE}))
          (rev(R.calleesaves)) @
        [
          A.OPER({assem="\tmovl %ebp, %esp" ^ explain("deallocate frame") ^
                        "\tpopl %ebp" ^ explain("restore base pointer") ^
                        "\tret\n", src=[],dst=[],jump=NONE})
        ]

      val newBody = prologue @ map (#1) body @ epilogue
    in
      genSpills(newBody, fn t => valOf(Temp.Table.look(allocation, t)))
    end

(************************************************************
  The following is an example implementation of mapping pseudo-registers
  to memory load/store instructions and actual registers.  It is done
  in a single pass.  It assumes that pseudo-register names start with
  the letter "f".  It uses the actual registers ECX and EDX as temporaries
  when a pseudo-register is an operand of an instruction.

  There is a special case that this function does NOT handle, but you MUST!
  The DIV instruction has special requirements.  Its dividend must be in EAX,
  its divisor in a general-purpose register.  It returns both the quotient,
  in EAX, and the remainder, in EDX regardless where the original divisor was!
  So be careful that a divide instruction does not trash something useful
  in EDX, and that you retrieve the correct resulut from the divide instruction.
***************************************************)

  (* regname -- produce an assembly language name for the given machine
   * register or psuedo-register.
   * psuedo-registers are mapped to an expression for psuedo-register's
   * location in stack frame.
   *)
  (* regname : R.register -> string *)
  and regname reg =
    if (String.isPrefix "f" reg) then
  	  (* it's a psuedo-register *)
  	  let
  	      val (SOME prNum) = Int.fromString (String.extract(reg,1,NONE));
  	      val offset = (prNum + 1) * 4
  	  in
  	      "-" ^ Int.toString(offset) ^ "(%ebp)"
  	  end
    else
	   reg

  (* genSpills -- do our "poor man's spilling".  Maps all pseudo-register
   * references to actual registers, by inserting instructions to load/store
   * the pseudo-register to/from a real register
   *)
  and genSpills (insns,saytemp) =
    let
	  (* doload() -- given name of a source register src, and a true
	   * machine register mreg, will return a load instruction (if needed)
	   * and a machine register.
	   *)
	  (* loadit: Temp.temp * Temp.temp -> string * Temp.temp *)
	  fun loadit (src,mreg) =
      let
		    val srcnm = (saytemp src)
	    in
		    if (String.isPrefix "f" srcnm) then
		      (* it's a fake register: *)
		      let
			      val _ = print ("loadit(): mapping pseudo-register `" ^ srcnm ^ "' to machine reg. `" ^ (saytemp mreg) ^"'\n");
			      val loadInsn = "\tmovl\t" ^ (regname srcnm) ^ ", " ^ (saytemp mreg) ^ explain("load pseudo-register")
		      in
			      (loadInsn, mreg)
		      end
		    else
		      (* no mapping needed *)
		      ("", src)
	     end
	  (* mapsrcs : produce a sequence of instructions to load
	   * pseudo-registers into real registers, and produce a list
	   * of sources which reflects the real registers.
	   *)
	  (* mapsrcs : Temp.temp list * Temp.temp list -> string * Temp.temp list *)
	  fun mapsrcs ([],_) = ("",[])
      | mapsrcs (_,[]) = ("",[])
	    | mapsrcs (src::srcs,mreg::mregs) =
        let
          val (loadInsn, src') = loadit(src,mreg)
          val (loadRest, srcs') = mapsrcs(srcs,mregs)
        in
          (loadInsn ^ loadRest, src'::srcs')
        end
	  (* findit -- like List.find, but returns SOME i, where i is index
	   * of element, if found
	   *)
    fun findit f l =
	    let
		    fun dosrch([],f,_) = NONE
		      | dosrch(el::els,f,idx) =
		        if f(el) then
			        SOME idx
		        else
			        dosrch(els,f,idx+1)
	    in
		    dosrch(l,f,0)
	    end

	  (* mapdsts -- after we have mapped sources to real machine
	   * registers, iterate through dsts.
	   * If dst is a pseudo-register then
	   *    if dst was also a src,
	   *         replace dst with machine register to which src is already
	   *         mapped
	   *    else
	   *         map dst to its own machine register (just use %ecx)
	   *    generate a store insn for dst to save result
	   *)
    (* mapdsts : Temp.temp list * Temp.temp list * Temp.temp list ->
	   *           string * Temp.temp list
	   *)
    (* N.B.!  This only works for dst of length 0 or 1 !! *)
    (* pre: length(dsts) <= 1 *)
	  fun mapdsts([],_,_) = ("",[])
	    | mapdsts(dst::dsts,srcs,newsrcs) =
	      let
		      val found = findit (fn e => e=dst) srcs
		      val dstnm = (saytemp dst)
	      in
		      if (isSome(found)) then
  		      (* this dst is also a source *)
  		      let
      			  val idx=valOf(found)
      			  val src=List.nth (srcs,idx)
      			  val mreg=List.nth (newsrcs,idx)
		        in
			        if (src <> mreg) then
			          ("\tmovl\t`d0, " ^ (regname dstnm) ^ explain("save pseudo-register"), mreg::dsts)
			        else
    			      (* no mapping *)
    			      ("", dst::dsts)
		          end
              handle e => raise e
		      else
		        (* this dst isn't a source, but it might be a pseudo-register *)
            if (String.isPrefix "f" dstnm) then
              (* it's a fake register: *)
              (* we can safely just replace this destination with
               * %ecx, and then write out %ecx to the pseudo-register
               * location.  Even if %ecx was used to hold a different
               * source pseudo-register, we won't end up clobbering
               * it until after the source has been used...
               *)
              ("\tmovl\t`d0, " ^ (regname dstnm) ^ explain("save pseudo-register\n"), R.ECX::dsts)
            else
              (* no mapping *)
              ("", dst::dsts)
	        end

	  fun mapInstr(A.OPER{assem=insn, dst=dsts, src=srcs, jump=jmp}) =
	        mapInstrInternal(insn, srcs, dsts, jmp)
	    | mapInstr(instr as A.LABEL _) = instr
	    | mapInstr(A.MOVE{assem=insn, dst=dst, src=src}) =
          mapInstrInternal(insn, [src], [dst], NONE)
    and mapInstrInternal(insn, srcs, dsts, jmp) =
      let
        val (loadinsns, newsrcs) = mapsrcs(srcs, [R.ECX, R.EDX, Temp.newtemp()]);
        val (storeinsns, newdsts) = mapdsts(dsts, srcs, newsrcs);
      in
        A.OPER{assem=loadinsns ^ insn ^ storeinsns,
               dst=newdsts, src=newsrcs, jump=jmp}
      end
  in
    map mapInstr insns
  end
end (* structure Codegen *)
