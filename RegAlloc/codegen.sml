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

 val ilist = ref (nil: A.instr list)
 fun emit x = ilist := x :: !ilist
 fun result(gen) = let val t = Temp.newtemp() in gen t; t end
 fun int(i) = if i < 0 then "-"^Int.toString(~i) else Int.toString(i)

 fun comment(s) = "\t\t\t\t\t# " ^ s ^ "\n"

 fun temps(nil)=""
    | temps(t::ts) = temp(t)^","^temps(ts)
 and temp(t) = "t"^Temp.makestring(t)

 fun cJump(T.EQ) = "je"
   | cJump(T.NE) = "jne"
   | cJump(T.LT) = "jl"
   | cJump(T.LE) = "jle"
   | cJump(T.GT) = "jg"
   | cJump(T.GE) = "jge"
   | cJump(_) = (ErrorMsg.impossible("Unrecognized relop"); "jmp")

 fun munchStm(T.SEQ(a,b)) = (munchStm a; munchStm b)
   | munchStm(T.MOVE(e1, e2)) = let
        (* avoid memory-memory moves *)
        val mem1 = isMem(e2)
        val (inline1, regs1) = inlineExp("`s", 0, true, e2)
        val mem2 = isMem(e1)
        val (inline2, regs2) = inlineExp("`d", if mem2 then List.length(regs1) else 0, not mem1, e1)
        val src = regs1 @ (if mem2 then regs2 else nil)
        val dst = if mem2 then nil else regs2
      in emit(A.OPER{assem="\tmovl\t"^inline1^", " ^ inline2 ^ comment("run MOVE statement with src:"^temps(src)^" dst:"^temps(dst)),
            src=src, dst=dst, jump=NONE})
      end
   | munchStm(T.LABEL lab) =
      emit(A.LABEL{assem=Symbol.name(lab) ^ ":\n", lab=lab})
   | munchStm(T.EXP(e)) =
      (munchExp(e);())
    (* jump to the result of expression.
    To be safe (assembly has abysmal documentation), don't allow something like jmp 3(%eax) *)
   | munchStm(T.JUMP(e, togo)) =
      let val (inline, regs) = inlineExp("`s", 0, false, e)
      in
        emit(A.OPER{assem="\tjmp\t" ^ inline ^ "\n",
        src=regs, dst=nil, jump=SOME(togo)}) (* TODO: ask stan if this jump thing is necessary *)
      end
   | munchStm(T.CJUMP(T.TEST(cmp, x, y), l1, l2)) = let
      (* Avoid memory-memory comparison *)
      (* TODO: check if constants must be compared in a special manner *)
      val (inline1, regs1) = inlineExp("`s", 0, true, x)
      val (inline2, regs2) = inlineExp("`s", List.length(regs1), true, y)
    in emit(A.OPER{assem="\tcmpl\t"^inline1^", "^inline2^
        comment("compare before conditional jump with src1:"^temps(regs1)^" src2:"^temps(regs2)),
        src=regs1 @ regs2, dst=nil, jump=NONE});
      emit(A.OPER{assem="\t"^cJump(cmp)^"\t"^Symbol.name(l1)^"\n", src=nil, dst=nil, jump=SOME([l1])});
      emit(A.OPER{assem="\tjmp\t"^Symbol.name(l2)^"\n", src=nil, dst=nil, jump=SOME([l2])})
    end

 (* check to see if it would be inlined as a mem operation *)
 and isMem(T.MEM(_)) = true
  | isMem(_) = false

 (* takes expression, which could maybe be evaluated implicitly, and string for replacement.
  returns string to use for expression and list containing register it uses, if any.
    bool arg is whether it may be inlined as a memory exp. *)
 and inlineExp(_, idx, true, T.MEM(T.BINOP(T.PLUS,T.CONST i,e1), _)): string * (Temp.temp list) =
      (int(i)^"(`s"^int(idx)^")", [munchExp e1])
    | inlineExp(_, idx, true, T.MEM(T.BINOP(T.PLUS,e1,T.CONST i), _)) =
      (int(i)^"(`s"^int(idx)^")", [munchExp e1])
    | inlineExp(_, idx, true, T.MEM(e1, _)) =
      ("(`s"^int(idx)^")", [munchExp e1])
    | inlineExp(_, _, _, T.CONST i) =
      (* TODO: not every constant can be inline, like the second arg of mov,
      or the second argument of cmp.
      Check with Jack to see if any of these cases ever happen *)
      ("$"^int(i), nil)
    | inlineExp(s, idx, _, T.TEMP t) =
      (s^int(idx), [t])
    | inlineExp(_, _, _, T.NAME(lab)) =
      (Symbol.name(lab), nil)
    | inlineExp(s, idx, _, e) =
      (s^int(idx), [munchExp e])

 and munchExp(mem as T.MEM(_)): Temp.temp =
      let val (inline, regs) = inlineExp("`s", 0, true, mem)
      in
        result(fn r => emit(A.OPER{assem="\tmovl\t"^inline^", `d0"^comment("evaluate MEM expression src:"^temps(regs)^" dst:"^temp(r)),
        src=regs, dst=[r], jump=NONE}))
      end
   | munchExp(T.CONST(i)) =
      result(fn r => emit(A.OPER{assem="\tmovl\t$" ^ int i ^ ", `d0"^comment("evaluate CONST expression to "^temp(r)),
      src=nil, dst=[r], jump=NONE}))
   | munchExp(T.TEMP t) = t
   | munchExp(T.BINOP(T.PLUS, e1, e2)) =
      result(fn r => (munchStm(T.MOVE(T.TEMP(r), e1)); let
          val (inline, regs) = inlineExp("`s", 0, true, e2)
        in
          emit(A.OPER{assem="\taddl\t"^inline^", `d0"^comment("evaluate PLUS expression src:"^temps(regs)^" dst:"^temp(r)),
          src=regs, dst=[r], jump=NONE})
        end))
   | munchExp(T.BINOP(T.MINUS, e1, e2)) =
      result(fn r => (munchStm(T.MOVE(T.TEMP(r), e1)); let
          val (inline, regs) = inlineExp("`s", 0, true, e2)
        in
          emit(A.OPER{assem="\tsubl\t"^inline^", `d0"^comment("evaluate MINUS expression src:"^temps(regs)^" dst:"^temp(r)),
          src=regs, dst=[r], jump=NONE})
        end))
   | munchExp(T.BINOP(T.MUL, e1, e2)) =
      result(fn r => (munchStm(T.MOVE(T.TEMP(r), e1)); let
          val (inline, regs) = inlineExp("`s", 0, true, e2)
        in
          emit(A.OPER{assem="\tmull\t"^inline^", `d0"^comment("evaluate MUL expression src:"^temps(regs)^" dst:"^temp(r)),
          src=regs, dst=[r], jump=NONE})
        end))
   | munchExp(T.BINOP(T.DIV, e1, e2)) =
      (* dividend is in EAX *)
      result(fn r => (munchStm(T.MOVE(T.TEMP(R.RV), e1)); let
          (* "The source operand can be a general-purpose register or a memory location" *)
          val (inline, regs) = inlineExp("`s", 0, true, e2)
        in
          emit(A.OPER{assem="\tidiv\t"^inline^
                  comment("divide this from EAX, result goes in EAX with remainder in EDX (src:"^temps(regs)^")")
                  ^ "\tmovl\t`d1, `d2"^comment("move result from EAX to new register:"^temp(r)),
          src=regs, dst=[R.EDX, R.RV, r], jump=NONE})
        end))
   | munchExp(T.BINOP(_)) = (ErrorMsg.impossible("Unrecognized BINOP"); Temp.newtemp())
   | munchExp(T.CALL(callee, args)) = let
      val (inline, regs) = inlineExp("`s", 0, false, callee)
      val _ = pushArgs(args)
      val jmp = (*case callee of T.NAME(lab) => SOME([lab]) | _ =>*) NONE
    in
      result(fn r => emit(A.OPER{assem="\tcall\t" ^ inline ^ "\n" ^
        "\tmovl\t`d0, `d1"^comment("move result of call to desired register:"^temp(r)),
      src=regs, dst=[R.RV, r], jump=jmp}))
    end
   | munchExp(T.NAME(lab)) = (ErrorMsg.impossible("Dangling T.NAME "^Symbol.name(lab)); Temp.newtemp())
   | munchExp(T.ESEQ(_)) = (ErrorMsg.impossible("Unexpected ESEQ"); Temp.newtemp())
   | munchExp(T.CONSTF(_)) = (ErrorMsg.impossible("Unexpected CONSTF"); Temp.newtemp())
   | munchExp(T.CVTOP(_)) = (ErrorMsg.impossible("Unexpected CVTOP"); Temp.newtemp())

 and pushArgs(nil) = ()
   | pushArgs(exp::xs) =
      let val _ = pushArgs(xs)
        val (inline, regs) = inlineExp("`s", 0, true, exp)
        val push = emit(A.OPER{assem="\tpushl\t"^inline^comment("argument for call from src:"^temps(regs)),
          src=regs, dst=nil, jump=NONE})
      in () end


 fun codegen(tree: T.stm): A.instr list = (
    munchStm(tree);
    (* Uncomment the following to tell where one tree ends and the next begins *)
    (* emit(A.OPER{assem="Parsed one tree\n", src=nil, dst=nil, jump=NONE}); *)
    let val instructions = List.rev (!ilist)
    in
    ilist := nil;
    instructions
    end
 )

 fun string(lab: Temp.label, s: string): string =
    Symbol.name(lab) ^ ":\n\t.string \""^s^"\"\n"

 (* assume all are caller save, no callee save *)
 fun prologue(name: Temp.label, {formals : int,        (* number of formal parameters *)
                offlst : F.offset list, (* offset list for formals *)
                locals : int ref,     (* # of local variables so far *)
                maxargs : int ref}): A.instr list
  = let
    val countlocals = 4 * (R.NPSEUDOREGS + !locals)
    val procname = Symbol.name(name)
    val makeLinkable = A.OPER{assem=".globl\t" ^ procname ^ comment("make linkable"),
        src=nil, dst=nil, jump=NONE}
    val identifyType = A.OPER{assem="\t.type\t" ^ procname ^ ", @function"
        ^ comment("identify it as a function (for linking)"),
        src=nil, dst=nil, jump=NONE}
    val procLabel = A.LABEL{assem=procname ^ ":" ^ comment("entry point for function"), lab=name}
    val saveFrame = A.OPER{assem="\tpushl\t`s0"^comment("save previous frame pointer"),
      src=[R.FP], dst=nil, jump=NONE}
    val updateFrame = A.OPER{assem="\tmovl\t`s0, `d0"^comment("set new frame pointer"),
      src=[R.SP], dst=[R.FP], jump=NONE}
    val makeSpaceForLocals = A.OPER{assem="\tsubl\t$" ^ int(countlocals) ^ ", %esp" ^
        comment("make room for "^int(!locals)^" locals and "^int(R.NPSEUDOREGS)^" pseudoregs"),
        src=nil, dst=nil, jump=NONE}
    fun saveReg(reg) = A.OPER{assem="\tpushl\t" ^ reg ^ comment("callee-save register"),
      src=nil, dst=nil, jump=NONE}
    val saveCalleeRegs = map saveReg R.calleesaves
  in
    [makeLinkable, identifyType, procLabel, saveFrame, updateFrame, makeSpaceForLocals] @ saveCalleeRegs
  end

  fun cleanup(name: Temp.label, {formals : int,        (* number of formal parameters *)
                offlst : F.offset list, (* offset list for formals *)
                locals : int ref,     (* # of local variables so far *)
                maxargs : int ref}): A.instr list
  = let
    val countLocals = 4 * (R.NPSEUDOREGS + !locals)
    val deallocStackFrame = A.OPER{assem="\tmovl\t`s0, `d0"^comment("dealloc stack frame"),
        src=[R.FP], dst=[R.SP], jump=NONE}
    val restoreFP = A.OPER{assem="\tpopl\t`d0"^comment("restore previous frame pointer"),
        src=nil, dst=[R.FP], jump=NONE}
    fun restoreReg(reg) = A.OPER{assem="\tpopl\t" ^ reg ^ comment("restore callee-saved register"),
        src=nil, dst=nil, jump=NONE}
    val restoreCalleeRegs = map restoreReg (rev R.calleesaves)
    val return = A.OPER{assem="\tret" ^ comment("return from function "^Symbol.name(name)),
        src=nil, dst=nil, jump=NONE}
  in
    restoreCalleeRegs @ [deallocStackFrame, restoreFP, return]
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
*)

  (* regname -- produce an assembly language name for the given machine
   * register or psuedo-register.
   * psuedo-registers are mapped to an expression for psuedo-register's
   * location in stack frame.
   *)
  (* regname : R.register -> string *)
  fun regname reg =
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
 fun genSpills (insns,saytemp) =
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
	    | mapsrcs (src::srcs,mreg::mregs) =
              let
                  val (loadInsn, src') = loadit(src,mreg)
                  val (loadRest, srcs') = mapsrcs(srcs,mregs)
              in
                  (loadInsn ^ loadRest, src'::srcs')
              end
      | mapsrcs(_) = ErrorMsg.impossible("Bad argument to mapsrcs")
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
			      ("\tmovl\t`d0, " ^ (regname dstnm) ^ comment("save pseudo-register "^dstnm), mreg::dsts)
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
                          ("\tmovl\t`d0, " ^ (regname dstnm) ^ comment("save pseudo-register "^dstnm), R.ECX::dsts)
                      else
                          (* no mapping *)
                          ("", dst::dsts)
	      end

	  fun mapInstr(A.OPER{assem=insn, dst=dsts, src=srcs, jump=jmp}) = 
	      let
		  val (loadinsns, newsrcs) = mapsrcs(srcs, [R.ECX, R.EDX]);
                      val (storeinsns, newdsts) = mapdsts(dsts, srcs, newsrcs); 
	      in
		  A.OPER{assem=loadinsns ^ insn ^ storeinsns,
			 dst=newdsts, src=newsrcs, jump=jmp}
	      end
	    | mapInstr(instr as A.LABEL _) = instr
	    | mapInstr(instr) =
	      (* we never generate these! *)
              ErrorMsg.impossible ("CodeGen: unexpected instruction type in mapInstr!")
     in
         map mapInstr insns
     end

    fun translateInstrs(instrs: Assem.instr list, regs: R.register Temp.Table.table): A.instr list =
    let
      fun regForTemp(tmp: A.temp): R.register = (case Temp.Table.look(regs, tmp) of
        SOME(reg) => reg
        | NONE => (ErrorMsg.error 0 ("Temp unregistered: "^Temp.makestring(tmp)); Temp.makestring(tmp))
      )
      (* replace all pseudoregs with memory references using ECX and EDX *)
      val noPseudoregs = genSpills(instrs, regForTemp)
      (* replace all reg temporaries with actual register names *)
      val regFormat = A.format(regForTemp)
      fun replaceRegs(instr): A.instr = A.OPER{assem=regFormat instr, src=nil, dst=nil, jump=NONE}

      val noRegs = map replaceRegs noPseudoregs
    in
      noRegs
    end

  (* procEntryExit sequence + function calling sequence tune-up 
   * + mapping pseudo-registers to memory load/store instructions 
   * and actual registers.
   * This is a post-pass, to be done after register allocation.
   *)
 fun procEntryExit({name=name,
                    body=body, (* list of (Assem.instr, list of temps) *)
                    allocation=regTable, (* table mapping Temp.temp to R.register *)
                    formals=formals, (* ? *)
                    frame=frame}): A.instr list =
    let
      fun color(instrs: A.instr list): A.instr list = translateInstrs(instrs, regTable)
      val preface = color(prologue(name, frame))
      val instructions = (map (fn (i, t) => i) body)
      val newBody = color(instructions)
      val epilogue = color(cleanup(name, frame))
    in preface @ newBody @ epilogue end

end (* structure Codegen *)
