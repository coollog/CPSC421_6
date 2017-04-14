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

  fun codegen(stm: T.stm) : A.instr list =
  let val ilist = ref (nil: A.instr list)
    fun emit x = ilist := x :: !ilist
    fun result(gen) = let val t = Temp.newtemp() in gen t; t end

    (* Some functions to make munch code more organized. *)
    fun emitLABEL(lab) = emit(A.LABEL{assem=assLABEL(lab), lab=lab})
    and emitOPER(assem, src, dst, jump) =
      emit(A.OPER{assem=assem,src=src,dst=dst,jump=jump})
    and emitMOVE(assem, src, dst) =
      emit(A.MOVE{assem=assem,src=src,dst=dst})

    and resultOPER(assem, src, dst, jump) =
      result(fn r => emitOPER(assem, src, r::dst, jump))

    and explain(comment) = "\t\t\t\t\t\t\t# " ^ comment ^ "\n"

    and assLABEL(lab) = S.name lab ^ ":\n"
    and assJMP(lab) = "jmp `j0" ^ explain("jump to " ^ S.name lab)
    and assJMPexp() = "jmp `s0" ^ explain("jump to somewhere")
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
        "cmpl `s0, `s1" ^ explain("compare for jump...") ^
        jumpInstr ^ " `j0" ^ explain("if true: jump to " ^ S.name lab1) ^
        "jmp `j1" ^ explain("if false: jump to " ^ S.name lab2)
      end
    and assMOVreg() = "movl `s0, `d0" ^ explain("move to register")
    and assMOVmem() = "movl `s0, (`d0)" ^ explain("move to memory")
    and assMOVfetch() = "movl (`s0), `d0" ^ explain("fetch from memory")
    and assMOVconst(i) = "movl $" ^ Int.toString i ^ ", `d0" ^
                         explain("move constant to register")
    and assMOVlabel(lab) = "mov $" ^ S.name lab ^ ", `d0\n"
    and assADD() = "addl `s1, `d0" ^ explain("add two registers")
    and assSUB() = "subl `s1, `d0" ^ explain("subtract two registers")
    and assIMUL() = "imull `s1, `d0" ^ explain("multiply two registers")
    and assIDIV() = "movl `s0, `d0\t# save %eax\n" ^
                    "movl `s1, `d1\t# save %edx\n" ^
                    "movl `s2, `s0\t# put divisor in %eax\n" ^
                    "idiv `s3\t# divide by register\n" ^
                    "movl `s3, `d0\t# put quotient in result register\n" ^
                    "movl `d0, `s0\t# restore %eax\n" ^
                    "movl `d1, `s1\t# restore %edx\n"
    and assAND() = "andl `s1, `d0" ^ explain("bitwise and two registers")
    and assOR() = "orl `s1, `d0" ^ explain("bitwise or two registers")

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
                   [munchExp e1, munchExp e2], [], SOME[lab1, lab2])

      (* MOVE reg e1 *)
      | munchStm(T.MOVE(T.TEMP t, e1)) =
          emitMOVE(assMOVreg(), munchExp e1, t)

      (* MOVE MEM[e1] e2 *)
      | munchStm(T.MOVE(T.MEM(e1, s1),e2)) =
          let val dst=munchExp e1 val src=munchExp e2 in
            emitMOVE(assMOVmem(), src, dst) end

      | munchStm(T.MOVE _) = ErrorMsg.impossible "CodeGen: INVALID MOV"

      | munchStm(T.EXP e) = (munchExp e; ())

    and
      (* FETCH MEM[i] *)
      munchExp(T.MEM(e1, s1)) =
          resultOPER(assMOVfetch(), [munchExp e1], [], NONE)

      (* ADD *)
      | munchExp(T.BINOP(T.PLUS,e1,e2)) =
          resultOPER(assMOVreg() ^ assADD(),
                     [munchExp e1, munchExp e2], [], NONE)

      (* SUB *)
      | munchExp(T.BINOP(T.MINUS,e1,e2)) =
          resultOPER(assMOVreg() ^ assSUB(),
                     [munchExp e1, munchExp e2], [], NONE)

      (* IMUL *)
      | munchExp(T.BINOP(T.MUL,e1,e2)) =
          resultOPER(assMOVreg() ^ assIMUL(),
                     [munchExp e1, munchExp e2], [], NONE)

      (* IDIV *)
      | munchExp(T.BINOP(T.DIV,e1,e2)) =
          resultOPER(assIDIV(),
                     [R.RV, R.EDX, munchExp e1, munchExp e2],
                     [Temp.newtemp()], NONE)

      (* AND *)
      | munchExp(T.BINOP(T.AND,e1,e2)) =
          resultOPER(assMOVreg() ^ assAND(),
                     [munchExp e1, munchExp e2], [], NONE)

      (* OR *)
      | munchExp(T.BINOP(T.OR,e1,e2)) =
          resultOPER(assMOVreg() ^ assOR(),
                     [munchExp e1, munchExp e2], [], NONE)

      | munchExp(T.BINOP(_)) = ErrorMsg.impossible "CodeGen: INVALID BINOP"

      (* CONST *)
      | munchExp(T.CONST i) = resultOPER(assMOVconst(i), [], [], NONE)

      | munchExp(T.CONSTF _) = ErrorMsg.impossible "CodeGen: INVALID CONSTF"

      | munchExp(T.TEMP t) = t

      | munchExp(T.NAME label) = resultOPER(assMOVlabel(label), [], [], NONE)

      (* CALL *)
      | munchExp(T.CALL(T.NAME lab, args)) =
        result(fn r =>
          let
            val paramSize = 4 * length(args)
            val pushTrueCallerSaves = String.concat(
              map (fn reg => "pushl " ^ reg ^ "\n") R.truecallersaves)
            (* Pushl args onto stack. *)
            val revArgs = rev(args)
            fun pushArgs(args) = app (fn arg => emit(A.OPER{
                  assem="pushl `s0\n",
                  src=[munchExp arg], dst=[], jump=NONE})) revArgs
            val revTrueCallerSaves = rev(R.truecallersaves)
            val popTrueCallerSaves = String.concat(
              map (fn reg => "popl " ^ reg ^ "\n") revTrueCallerSaves)
          in
            (* Pushl caller saves *)
            emit(A.OPER{assem=pushTrueCallerSaves, src=[], dst=[], jump=NONE});
            pushArgs(args);
            emit(A.OPER{assem="call " ^ Symbol.name lab ^ "\n" ^
                              "addl $" ^ Int.toString paramSize ^ ", %esp\n" ^
                              "movl %eax, `d0\n",
                        src=[], dst=[r], jump=NONE});
            (* Popl caller saves *)
            emit(A.OPER{assem=popTrueCallerSaves, src=[], dst=[], jump=NONE})
          end)

      | munchExp(T.ESEQ _ | T.CVTOP _ | T.CALL _) =
          ErrorMsg.impossible "CodeGen: INVALID ITREE EXP"

  in munchStm stm;
     rev(!ilist)
  end

  fun string(label, s) = Symbol.name label ^ ": .ascii \"" ^ s ^ "\"\n"

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
                      "pushl %ebp\n" ^
                      "movl %esp, %ebp\n" ^
                      "subl $" ^ Int.toString localVarSize ^ ", %esp\n",
                src=[],dst=[],jump=NONE})
      ] @ map
            (fn reg => A.OPER({assem="pushl " ^ reg ^ "\n", src=[],dst=[],jump=NONE}))
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
          (fn reg => A.OPER({assem="popl " ^ reg ^ "\n", src=[],dst=[],jump=NONE}))
          (rev(R.calleesaves)) @
        [
          A.OPER({assem="movl %ebp, %esp\n" ^
                        "popl %ebp\n" ^
                        "ret\n", src=[],dst=[],jump=NONE})
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
			      val loadInsn = "\tmovl\t" ^ (regname srcnm) ^ ", " ^ (saytemp mreg) ^ " # load pseudo-register\n"
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
			          ("\tmovl\t`d0, " ^ (regname dstnm) ^ " # save pseudo-register\n", mreg::dsts)
			        else
    			      (* no mapping *)
    			      ("", dst::dsts)
		          end
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
              ("\tmovl\t`d0, " ^ (regname dstnm) ^ " # save pseudo-register\n", R.ECX::dsts)
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
        val (loadinsns, newsrcs) = mapsrcs(srcs, [R.ECX, R.EDX]);
        val (storeinsns, newdsts) = mapdsts(dsts, srcs, newsrcs);
      in
        A.OPER{assem=loadinsns ^ insn ^ storeinsns,
               dst=newdsts, src=newsrcs, jump=jmp}
      end
  in
    map mapInstr insns
  end
end (* structure Codegen *)
