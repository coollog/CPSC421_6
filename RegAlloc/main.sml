(* main.sml *)

signature MAIN = 
sig 
  val compile : string -> unit
end (* signature MAIN *)

structure Main : MAIN = 
struct
  structure Semant = SemantGen(Register)
  structure RegAlloc = RegAllocGen(Register)

  structure C = Codegen
  structure F = C.F

  fun withOpenFile fname f = 
        let val out = TextIO.openOut fname
         in (f out before TextIO.closeOut out) 
               handle e => (TextIO.closeOut out; raise e)
        end 

  fun emitproc out (F.DATA {lab, s}) = TextIO.output(out,s)
                      (*** should really be output(out,C.string(lab,s)) ***)

    | emitproc out (F.PROC{name, body, frame}) =
        let 
            val _ = print ("Emit " ^ (Symbol.name name) ^ "\n")
            val _ = Printtree.printtree(out,body);

            val stms = Canon.linearize body
            val stms' = Canon.traceSchedule(Canon.basicBlocks stms)

            (* TODO: as long as C.codegen produces dummy output,
            * let's only call it once *)
            (* val instrs = List.concat(map C.codegen stms') *)
            val instrs = C.codegen (List.hd stms')

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

            (* dump interference graph to igraph.gv *)
            val _ = withOpenFile "igraph.gv" (fn (out) => Liveness.show(out, igraph))

            (* TODO: currently just a dummy list of 32 registers named reg1, ... reg32 *)
            val registers = (
                let fun gen (0) = []
                      | gen (x) = ("reg-" ^ (Int.toString x)) :: gen(x - 1)
                in
                  List.rev(gen(32))
                end
            )

            (* TODO: an empty Temp -> Register mapping *)
            val initial = Temp.Table.empty

            (* graph coloring to allocate registers for all temporaries *)
            val allocation = RegAlloc.color{
                interference=igraph,
                initial=initial,
                registers=registers
            }

            (* HACK : get a list of all temps in the program *)
            val Flow.FGRAPH{control, def, use, ismove} = flowgraph
            val temps = (
              List.foldr
              (fn (node, s) =>
                LiveSet.union(s,
                  LiveSet.construct(
                    (valOf (Graph.Table.look(def, node)))
                    @ (valOf (Graph.Table.look(use, node)))
                  )
                )
              )
              LiveSet.empty
              nodes
            )

            (* print out register allocation *)
            val _ = (
              List.app
              (fn (tmp) => (print
                ((Temp.makestring tmp) ^ " -> "
                ^ (valOf (Temp.Table.look(allocation, tmp))) ^ "\n")
              ))
              (LiveSet.members(temps))
            )

            (* TODO: C.procEntryExit *)

            val format0 = Assem.format (fn t => "t" ^ Temp.makestring t)

         in app (fn i => TextIO.output(out,format0 i)) instrs
        end

  fun compile filename = 
        let val frags = Semant.transprog(Parse.parse filename)
         in withOpenFile (filename ^ ".s") 
                 (fn out => (app (emitproc out) frags))
        end

end (* structure Main *)


