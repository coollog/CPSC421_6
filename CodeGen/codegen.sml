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

  (* Appends an assembly comment. *)
  fun explain(assem, comment) =
    let val len = length(List.filter (fn x => x = #"`") (explode assem))
    in assem ^ implode(List.tabulate(30 - size assem - len, fn _ => #" ")) ^
       "# " ^ comment ^ "\n" end

  (* Converts an int to a string with negative "-" *)
  fun int2str(i) = if i < 0 then "-" ^ Int.toString (~i) else Int.toString i

  fun codegen(stm: T.stm) : A.instr list =
  let val ilist = ref (nil: A.instr list)
    fun emit x = ilist := x :: !ilist
    fun result(gen) = let val t = Temp.newtemp() in gen t; t end

    type preInstr =
      {assem: string, reg: Temp.temp list, src: Temp.temp list, nextIdx: int}

    (* Some functions to make munch code more organized. *)
    fun emitLABEL(lab) = emit(A.LABEL{assem=assLABEL(lab), lab=lab})
    and emitOPER(assem, src, dst, jump) =
      emit(A.OPER{assem=assem,src=src,dst=dst,jump=jump})
    and emitMOVE(assem, src, dst) =
      emit(A.MOVE{assem=assem,src=src,dst=dst})

    and resultOPER(assem, src, dst, jump) =
      result(fn r => emitOPER(assem, src, r::dst, jump))

    (* Generates the various assembly instructions. *)
    and assLABEL(lab) = S.name lab ^ ":\n"
    and assPUSH(pSrc) = explain("\tpushl " ^ pSrc, "push onto stack")
    and assJMP(lab) = explain("\tjmp `j0", "jump to " ^ S.name lab)
    and assJMPexp() = explain("\tjmp `s0", "jump to somewhere")
    and assCMP(relop, lab1, lab2) =
      let
        val jumpInstr = case relop of
          T.EQ => "\tje"
        | T.NE => "\tjne"
        | T.GT => "\tjg"
        | T.GE => "\tjge"
        | T.LT => "\tjl"
        | T.LE => "\tjle"
        | _ => ErrorMsg.impossible "CodeGen: INVALID CJUMP"
      in
        explain("\tcmpl `s1, `s0", "compare for jump...") ^
        explain(jumpInstr ^ " `j0", "if true: jump to " ^ S.name lab1) ^
        explain("\tjmp `j1", "if false: jump to " ^ S.name lab2)
      end
    and assMOVreg(pSrc, pDst) =
      explain("\tmovl " ^ pSrc ^ ", " ^ pDst, "move to register")
    and assMOVmem(pSrc, pDst) =
      explain("\tmovl " ^ pSrc ^ ", " ^ pDst, "move to memory")
    and assMOVfetch(pSrc, pDst) =
      explain("\tmovl (" ^ pSrc ^ "), " ^ pDst, "fetch from memory")
    and assMOVconst(i) = explain("\tmovl $" ^ int2str i ^ ", `d0",
                                 "move constant to register")
    and assADD(pSrc, pDst) =
      explain("\taddl " ^ pSrc ^ ", " ^ pDst, "add two registers")
    and assSUB(pSrc, pDst) =
      explain("\tsubl " ^ pSrc ^ ", " ^ pDst, "subtract two registers")
    and assIMUL(pSrc, pDst) =
      explain("\timull " ^ pSrc ^ ", " ^ pDst, "multiply two registers")
    and assAND(pSrc, pDst) =
      explain("\tandl " ^ pSrc ^ ", " ^ pDst, "bitwise and two registers")
    and assOR(pSrc, pDst) =
      explain("\torl " ^ pSrc ^ ", " ^ pDst, "bitwise or two registers")

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

      (* MOVE reg e1 *)
      | munchStm(T.MOVE(T.TEMP t, e1)) =
          let val pDst = patternExp(T.TEMP t, "d", 0)
              val pSrc = patternExp(e1, "s", 0)
          in emitOPER(assMOVreg(#assem pSrc, #assem pDst),
                      #src pSrc, #reg pDst, NONE) end

      (* MOVE MEM[e1] MEM[e2] *)
      | munchStm(T.MOVE(T.MEM(e1, _),T.MEM(e2, _))) =
          let val pDst=patternExp(T.MEM(e1, 4), "d", 0)
          in emitOPER(assMOVmem("`s0", #assem pDst),
                      [munchExp(T.MEM(e2, 4))] @ #src pDst, #reg pDst, NONE) end

      (* MOVE MEM[e1] e2 *)
      | munchStm(T.MOVE(T.MEM(e1, _),e2)) =
          let val pDst=patternExp(T.MEM(e1, 4), "d", 0)
              val pSrc=patternExp(e2, "s", 0)
              val srcs = #src pSrc @ #src pDst
          in emitOPER(assMOVmem(#assem pSrc, #assem pDst),
                      srcs, #reg pDst, NONE) end

      | munchStm(T.MOVE _) = ErrorMsg.impossible "CodeGen: INVALID MOV"

      | munchStm(T.EXP e) = (munchExp e; ())

    and
      (* Operands of assembly instructions could be registers or expressions for
       * memory addresses, so this helps to process these.
       *
       * eval(exp):
       * assem - the inline assembly code
       * reg - any registers used
       * src - any registers to add to the src list
       * nextIdx - further inline assembly expressions should start with this
       *           index for temps
       *
       * patternExp: helps to pattern match for eval(exp)
       *)

        patternExp(T.NAME lab, _, startIdx) = evalLABEL(lab, startIdx)
      | patternExp(T.CONST k, _, startIdx) = evalCONST(k, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.CONST k), _), prefix, startIdx) =
          evalMEMOFFSET(e1, k, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, T.CONST k, e1), _), prefix, startIdx) =
          evalMEMOFFSET(e1, k, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.BINOP(T.MUL, T.CONST 2, e2)), _),
                   prefix, startIdx) = evalMEMEXP(e1, e2, 2, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.BINOP(T.MUL, e2, T.CONST 2)), _),
                   prefix, startIdx) = evalMEMEXP(e1, e2, 2, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.BINOP(T.MUL, T.CONST 4, e2)), _),
                   prefix, startIdx) = evalMEMEXP(e1, e2, 4, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.BINOP(T.MUL, e2, T.CONST 4)), _),
                   prefix, startIdx) = evalMEMEXP(e1, e2, 4, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.BINOP(T.MUL, T.CONST 8, e2)), _),
                   prefix, startIdx) = evalMEMEXP(e1, e2, 8, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, T.BINOP(T.MUL, e2, T.CONST 8)), _),
                   prefix, startIdx) = evalMEMEXP(e1, e2, 8, prefix, startIdx)
      | patternExp(T.MEM(T.BINOP(T.PLUS, e1, e2), _), prefix, startIdx) =
          evalMEMEXP(e1, e2, 1, prefix, startIdx)
      | patternExp(T.MEM(e1, _), prefix, startIdx) =
          evalMEM(e1, prefix, startIdx)
      | patternExp(exp, prefix, startIdx) = evalEXP(exp, prefix, startIdx)

        (* like $Hello *)
    and evalLABEL(lab, startIdx):preInstr =
          {assem="$" ^ S.name lab, reg=[], src=[], nextIdx=startIdx}

        (* like $4 *)
    and evalCONST(k, startIdx):preInstr =
          {assem="$" ^ int2str k, reg=[], src=[], nextIdx=startIdx}

        (* like -4(%eax) *)
    and evalMEMOFFSET(e1, k, prefix, startIdx):preInstr =
          let val t = munchExp e1
          in {assem=int2str k ^ "(`" ^ prefix ^ int2str startIdx ^ ")",
              reg=[t], src=[t], nextIdx=startIdx + 1} end

        (* like (%eax, %ebx, 4) *)
    and evalMEMEXP(e1, e2, k, prefix, startIdx):preInstr =
          let val t1 = munchExp e1
              val t2 = munchExp e2
          in {assem="(`" ^ prefix ^ int2str startIdx ^ ", `" ^
                    prefix ^ int2str(startIdx + 1) ^ ", " ^ int2str k ^ ")",
              reg=[t1, t2], src=[t1, t2], nextIdx=startIdx + 2} end

        (* like (%eax) *)
    and evalMEM(e1, prefix, startIdx):preInstr =
          let val t = munchExp e1
          in {assem="(`" ^ prefix ^ int2str startIdx ^ ")",
              reg=[t], src=[t], nextIdx=startIdx + 1} end

        (* like %eax *)
    and evalEXP(exp, prefix, startIdx):preInstr =
          let val t = munchExp exp
          in {assem="`" ^ prefix ^ int2str startIdx,
              reg=[t], src=[t], nextIdx=startIdx + 1} end

    and
      (* FETCH MEM[i] *)
      munchExp(T.MEM(e1, s1)) =
          let val pSrc = patternExp(e1, "s", 0)
          in resultOPER(assMOVfetch(#assem pSrc, "`d0"), #reg pSrc, [], NONE)
          end

      (* ADD *)
      | munchExp(T.BINOP(T.PLUS,e1,e2)) =
          result(fn r => (
            emitOPER(assMOVreg("`s0", "`d0"), [munchExp e1], [r], NONE);
            emitOPER(assADD("`s0", "`s1"), [munchExp e2, r], [r], NONE)))

      (* SUB *)
      | munchExp(T.BINOP(T.MINUS,e1,e2)) =
          result(fn r => (
            emitOPER(assMOVreg("`s0", "`d0"), [munchExp e1], [r], NONE);
            emitOPER(assSUB("`s0", "`s1"), [munchExp e2, r], [r], NONE)))

      (* IMUL *)
      | munchExp(T.BINOP(T.MUL,e1,e2)) =
          result(fn r => (
            emitOPER(assMOVreg("`s0", "`d0"), [munchExp e1], [r], NONE);
            emitOPER(assIMUL("`s0", "`s1"), [munchExp e2, r], [r], NONE)))

      (* IDIV *)
      | munchExp(T.BINOP(T.DIV,e1,e2)) =
          let
            val r = Temp.newtemp()
            val t1 = Temp.newtemp()
            val t2 = Temp.newtemp()
            val pSrc1 = patternExp(e1, "s", 0)
          in
            emitOPER(explain("\tmovl %eax, `d0", "save %eax"),
                     [], [t1], NONE);
            emitOPER(explain("\tmovl %edx, `d0", "save %edx"),
                     [], [t2], NONE);
            emitOPER(explain("\tmovl $0, %edx", "put 0 in %edx\n"),
                     [], [], NONE);
            emitOPER(explain("\tmovl " ^ #assem pSrc1 ^ ", %eax",
                             "put divisor in %eax"),
                     #src pSrc1, [], NONE);
            emitOPER(explain("\tidiv `s0", "divide by register"),
                     [munchExp e2], [], NONE);
            emitOPER(explain("\tmovl %eax, `d0",
                             "put quotient in result register"),
                     [], [r], NONE);
            emitOPER(explain("\tmovl `s0, %eax", "restore %eax"),
                     [t1], [], NONE);
            emitOPER(explain("\tmovl `s0, %edx", "restore %edx"),
                     [t2], [], NONE);
            r
          end

      (* AND *)
      | munchExp(T.BINOP(T.AND,e1,e2)) =
          result(fn r => (
            emitOPER(assMOVreg("`s0", "`d0"), [munchExp e1], [r], NONE);
            emitOPER(assAND("`s0", "`s1"), [munchExp e2, r], [r], NONE)))

      (* OR *)
      | munchExp(T.BINOP(T.OR,e1,e2)) =
          result(fn r => (
            emitOPER(assMOVreg("`s0", "`d0"), [munchExp e1], [r], NONE);
            emitOPER(assOR("`s0", "`s1"), [munchExp e2, r], [r], NONE)))

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
              map (fn reg => explain("\tpushl " ^ reg, "save caller save"))
                  R.truecallersaves)
            (* Pushl args onto stack. *)
            val revArgs = rev(args)
            fun pushArg(arg) =
              let val pSrc = patternExp(arg, "s", 0)
              in emitOPER(assPUSH(#assem pSrc), #reg pSrc, [], NONE) end
            fun pushArgs(args) = app pushArg revArgs
            val revTrueCallerSaves = rev(R.truecallersaves)
            val popTrueCallerSaves = String.concat(
              map (fn reg => explain("\tpopl " ^ reg, "restore caller save"))
                  revTrueCallerSaves)
          in
            (* Pushl caller saves *)
            emitOPER(pushTrueCallerSaves, [], [], NONE);
            pushArgs(args);
            emitOPER("\tcall " ^ Symbol.name lab ^ "\n" ^
                     explain("\taddl $" ^ int2str paramSize ^ ", `s0",
                             "pop arguments") ^
                     explain("\tmovl `s1, `d0", "get return value"),
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
      val ordList = map (fn c => int2str(ord(c))) charList
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
                      explain("\tpushl %ebp", "save base pointer") ^
                      explain("\tmovl %esp, %ebp",
                              "base pointer <- stack pointer") ^
                      explain("\tsubl $" ^ int2str localVarSize ^ ", %esp",
                              "allocate space for local variables"),
                src=[],dst=[],jump=NONE})
      ] @ map
            (fn reg => A.OPER({assem=explain("\tpushl " ^ reg,
                                             "push callee save"),
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
          (fn reg => A.OPER({assem=explain("\tpopl " ^ reg, "pop callee save"),
                             src=[],dst=[],jump=NONE}))
          (rev(R.calleesaves)) @
        [
          A.OPER({assem=explain("\tmovl %ebp, %esp", "deallocate frame") ^
                        explain("\tpopl %ebp", "restore base pointer") ^
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
			      val loadInsn = explain("\tmovl\t" ^ (regname srcnm) ^ ", " ^ (saytemp mreg), "load pseudo-register")
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
			          (explain("\tmovl\t`d0, " ^ (regname dstnm), "save pseudo-register"), mreg::dsts)
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
              (explain("\tmovl\t`d0, " ^ (regname dstnm), "save pseudo-register\n"), R.ECX::dsts)
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
        (*val _ = print("#src=" ^ int2str(length srcs) ^ " | " ^ insn)*)

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
