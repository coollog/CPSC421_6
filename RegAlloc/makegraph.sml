(* makegraph.sml *)

signature MAKEGRAPH =
sig

   val instrs2graph : Assem.instr list -> Flow.flowgraph * Flow.Graph.node list


end

structure MakeGraph : MAKEGRAPH =
struct

(* The "instrs2graph" function takes a list of assembly instructions,
   and constructs its flowgraph and also returns the list of nodes in
   the flowgraph. The instructions exactly correspond to the nodes in
   the graph. If instruction m can be followed by instruction n (either
   by a jump or by falling through), there should be an edge from m to n
   in the graph.

   The flowgraph also maintains several attributes for each node in the
   graph, i.e., the "def" set, the "use" set, and the "ismove" flag

 *)

    fun findLabel(nil, lbl : Temp.label) = NONE
      | findLabel((label, node)::t, lbl) = if lbl = label then SOME(node)
                                         else findLabel(t, lbl)
(* THE PROBLEM: is probably that we create new graph nodes for labels
   when addlabels runs, and then those nodes don't get used in pInstrs *)
    fun instrs2graph(instrs) = (
      let val control = Graph.newGraph()
          val def = Graph.Table.empty
          val use = Graph.Table.empty
          val ismove = Graph.Table.empty

          fun addLabels(m, nil) = m
            | addLabels(m, Assem.OPER{...}::t) = addLabels(m, t)
            | addLabels(m, Assem.MOVE{...}::t) = addLabels(m, t)
            | addLabels(m, Assem.LABEL{assem=_, lab=lab}::t) =
                addLabels((lab, Graph.newNode(control))::m, t)
          val labelMap = addLabels(nil, instrs)

          fun maybeMakeLink(prevNode, node) =
            case prevNode of
              SOME(pNode) => Graph.mk_edge{from=pNode, to=node}
            | NONE => ()

          (* Now that map exists for labels, we can walk through the assembly
             instructions, keeping track of the previous instruction
             and the next instruction. Upon reaching a jump, we
             can query the 'labelMap' table to get the node(s) to build
             edges to from the current label *)
          val (def', use', ismove') =
            let val e = Graph.Table.enter
                fun pInstrs(prevNode, nil, def, use, ismove) = (def, use, ismove)
                  | pInstrs(prevNode, Assem.OPER{assem, dst, src, jump=SOME(jumps)}::t, def, use, ismove) =
                      let
                        val node = Graph.newNode(control)
                        val def' = e(def, node, dst)
                        val use' = e(use, node, src)
                        val ismove' = e(ismove, node, false)
                        fun processJumps(nil) = ()
                          | processJumps(lbl::t) =
                              (case findLabel(labelMap, lbl) of
                                 SOME(n) => (Graph.mk_edge{from=node, to=n};
                                             processJumps(t))
                               | NONE => raise ErrorMsg.Error; processJumps(t))
                        val _ = processJumps(jumps)
                        val _ = maybeMakeLink(prevNode, node)
                      in
                        pInstrs(NONE, t, def', use', ismove')
                      end
                  | pInstrs(prevNode, Assem.OPER{assem, dst, src, jump=NONE}::t, def, use, ismove) =
                      let
                        val node = Graph.newNode(control)
                        val def' = e(def, node, dst)
                        val use' = e(use, node, src)
                        val ismove' = e(ismove, node, false)
                        val _ = maybeMakeLink(prevNode, node)
                      in
                        pInstrs(SOME(node), t, def', use', ismove')
                      end
                  | pInstrs(prevNode, Assem.LABEL{assem, lab}::t, def, use, ismove) =
                      let
                        val node = case findLabel(labelMap, lab) of
                                     SOME(n) => n
                                   | NONE => (raise ErrorMsg.Error; Graph.newNode(control))
                        val def' = e(def, node, nil)
                        val use' = e(use, node, nil)
                        val ismove' = e(ismove, node, false)
                        val _ = maybeMakeLink(prevNode, node)
                      in
                        pInstrs(SOME(node), t, def', use', ismove')
                      end
                  | pInstrs(prevNode, Assem.MOVE{assem, dst, src}::t, def, use, ismove) =
                      (let
                         val node = Graph.newNode(control)
                         val def' = e(def, node, dst::nil)
                         val use' = e(use, node, src::nil)
                         val ismove' = e(ismove, node, true)
                         val _ = maybeMakeLink(prevNode, node)
                       in
                         pInstrs(SOME(node), t, def', use', ismove')
                       end)
            in pInstrs(NONE, instrs, def, use, ismove)
            end
      in (Flow.FGRAPH{control=control,
                      def=def',
                      use=use',
                      ismove=ismove'},
                      Graph.nodes(control))
      end
    )

end
