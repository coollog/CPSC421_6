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
   
 structure A = Assem
 structure F = Flow
 structure G = Graph

  fun instrs2graph (instrs) = 
  let

    (*
    * The instrs2graph function is divided into two passes:
    * (1) add_nodes() builds a flowgraph with only nodes by
    *   a. adding nodes for each instruction
    *   b. filling the def, use, ismove tables
    * (2) add_edges() adds edges to the flowgraph built in (1) by
    *   a. connecting instructions to those that *immediately* follow
    *   b. resolving jumps
    *)

    (* used to track labels resolve in add_nodes that will be used
    * to resolve jumps in add_edges *)
    val labels = ref Symbol.empty

    (* base case : create empty graph / tables *)
    fun add_nodes ([]) =
        (
          F.FGRAPH{
            control=G.newGraph(),
            use=G.Table.empty,
            def=G.Table.empty,
            ismove=G.Table.empty
          },
          []
        )

      (* recursive case : parse instr to add node to graph *)
      | add_nodes (instr :: instrs) = 
        let

          (* recursive call to add_nodes *)
          val (F.FGRAPH{control, def, use, ismove}, nodes) = add_nodes (instrs)

          (* add the new node to the control graph *)
          val node = G.newNode(control)

         (* parse def, use, ismove from instr *)
          val (def', use', ismove') = (
            case instr
              of A.OPER{assem, dst, src, jump} => (dst, src, false)
               | A.LABEL{assem, lab} => ([], [], false)
               | A.MOVE{assem, dst, src} => ([dst], [src], true))
        in

          (* if a label, add to labels table *)
          labels := (
            case instr
              of A.LABEL{assem, lab} => Symbol.enter(!labels, lab, node)
               | _ => !labels
           );

          (* return the augmented flowgraph structure and list of nodes *)
          (F.FGRAPH{
              control=control,
              def=G.Table.enter(def, node, def'),
              use=G.Table.enter(use, node, use'),
              ismove=G.Table.enter(ismove, node, ismove')
          }, node :: nodes)
        end

    (* base case : do nothing *)
    fun add_edges([], []) = ()

      (* the two error cases : somehow we have different length instrs and nodes *)
      | add_edges(_ :: instrs, []) = ErrorMsg.impossible "# of instrs should equal # of nodes in flowgraph"
      | add_edges([], _ :: nodes) = ErrorMsg.impossible "# of instrs should equal # of nodes in flowgraph"

      (* recursive case : add edges + resolve jumps for this instr, node pair *)
      | add_edges (instr :: instrs, node :: nodes) = (
        let

          (* connect node to the labels specified in jump *)
          fun resolve_jumps (A.OPER{assem=_, dst=_, src=_, jump=SOME(jump_to_labels)}) = (
              List.app
              (fn (to_label) =>
                case Symbol.look(!labels, to_label)
                  of SOME(to_node) => G.mk_edge({from=node, to=to_node})
                   | _ => ErrorMsg.impossible ("cannot jump to " ^ Symbol.name to_label))
              jump_to_labels
            )

            (* no jumps, nothing to do *)
            | resolve_jumps (_) = ()
        in
          (* if instr involves jump(s), resolve the jump(s)... *)
          resolve_jumps (instr);

          (* connect this node to the node following it *)
          if List.null nodes then ()
          else G.mk_edge({from=node, to=List.hd nodes});

          (* recursively add edges *)
          add_edges (instrs, nodes)
        end
      )

    (* add nodes to the fgraph *)
    val (fgraph, nodes) = add_nodes (instrs)
  in

    (* add edges, resolving all jumps *)
    add_edges(instrs, nodes);

    (fgraph, nodes)
  end

end
