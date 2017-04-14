(* main.sml *)

signature MAIN =
sig
  val compile : string -> unit
end (* signature MAIN *)

structure Main : MAIN =
struct
  structure Semant = SemantGen(Register)
  structure RegAlloc = RegAllocGen(Register)

  structure A = Assem
  structure C = Codegen
  structure F = C.F
  structure R = Register

  fun emitproc out (F.DATA {lab, s}) = TextIO.output(out, C.string(lab,s))

    | emitproc out (F.PROC{name, body, frame}) =
        let (*val _ = print ("Emit " ^ Symbol.name name ^ "\n\n")*)
            (*val _ = Printtree.printtree(out,body);*)

            val stms = Canon.linearize body
            val stms' = Canon.traceSchedule(Canon.basicBlocks stms)

            (*val _ =
              let
                fun printstms(stm::stms) =
                      (Printtree.printtree(out, stm); printstms(stms))
                  | printstms([]) = ()
              in
                printstms(stms')
              end*)

            val instrs = List.concat(map C.codegen stms')

            (* IG1 and RA1 *)

            (*
             * Once the RegAlloc module is ready, you can get
             * (1) a new list of body instrs together with its live
             *     temporaries: (Assem.instr * Temp.temp list) list
             *
             * (2) a register allocation table
             *
             * These information then can be fed into the C.procEntryExit
             * function to generate the proper function calling sequence,
             * procedure entry/exit sequences etc.
             *
             *)

            (* convert assembly instructions to flowgraph and list of nodes *)
            val (flowgraph, nodes) = MakeGraph.instrs2graph(instrs)

            (* convert flowgraph to interference graph and liveout mapping *)
            val (igraph, liveout_mapping) = Liveness.interferenceGraph(flowgraph)

            val initial =
              let
                val initial = Temp.Table.empty

                fun addToTable(cur,
                               reg::regs : (Temp.temp * Register.register) list)
                      = addToTable(Temp.Table.enter(cur, #1 reg, #2 reg), regs)
                  | addToTable(cur, []) = cur
              in
                addToTable(initial, Register.specialregs)
              end

            (* graph coloring to allocate registers for all temporaries *)
            val allocation = RegAlloc.color{
              interference=igraph,
              initial=initial,
              registers=R.registers
            }

            val body =
              let
                fun pairWithTemps(instr) =
                  case instr of
                    A.OPER{dst, src, ...} => (instr, dst @ src)
                  | A.LABEL _ => (instr, [])
                  | A.MOVE{dst, src, ...} => (instr, [dst, src])
              in
                map pairWithTemps instrs
              end

            val instrs' = C.procEntryExit({
              name=name,
              body=body,
              allocation=allocation,
              formals=[],
              frame=frame
            })

            val format0 = Assem.format (fn t => "t" ^ Temp.makestring t)
            val format1 = Assem.format(fn t => (valOf(Temp.Table.look(allocation, t))))

         in app (fn i => TextIO.output(out,format1 i)) instrs'
        end

  fun withOpenFile fname f =
        let val out = TextIO.openOut fname
         in (f out before TextIO.closeOut out)
               handle e => (TextIO.closeOut out; raise e)
        end

  fun compile filename =
        let val frags = Semant.transprog(Parse.parse filename)
         in withOpenFile (filename ^ ".s")
                 (fn out => (app (emitproc out) frags))
        end

end (* structure Main *)


