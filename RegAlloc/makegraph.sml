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
  fun instrs2graph(x) = 
    let
      val controlGraph = Graph.newGraph()
   
      (* Adds a single assembly instruction to a few tables:
      *   1) nodeTable: Assem.instr Graph.Table.table
      *     Maps Assem.instr to the corresponding nodes within the graph.
      *
      *     Used when edges of control graph are created to keep track
      *     of which labels to jump to. Notice that this is necessary since
      *     we need to operate on labels and nodes at once.
      *
      *   2) labelTable: node Symbol.table
      *     Maps labels to nodes. Note that this table will only ever contain
      *     nodes that are created from Assem.LABEL.
      *
      *     This is necessary when creating the 
      *     edges within controlGraph to find the nodes corresponding
      *     to labels that we are supposed to jump to.
      *
      *   3) defTable: Temp.temp list Graph.Table.table
      *     We need this to construct Flow.flowgraph. 
      *
      *     Returns the temps that a node in the flow graph defines.
      *
      *   4) useTable: Temp.temp list Graph.Table.table
      *     We need this to construct Flow.flowgraph
      *
      *     Returns the temps that a node in the flow graph uses.
      *
      *   5) ismoveTable: bool Graph.Table.table
      *     We need this to construct Flow.flowgraph
      *
      *     Returns true if a node in the graph corresponds to a move
      *     instruction and false otherwise.
      *)   
      fun addToTables (
        assInstr,         (* Assembly instruction *)
        ( nodeTable,      (* Assem.instr Graph.Table.table *)
          labelTable,     (* node Symbol.table *)
          defTable,       (* Temp.temp list Graph.Table.table *)
          useTable,       (* Temp.temp list Graph.Table.table *)
          ismoveTable)) = (* bool Graph.Table.table *)
        let
          val node = Graph.newNode(controlGraph)

          val newNodeTable = Graph.Table.enter(nodeTable, node, assInstr)

          val newLabelTable = case assInstr
            of Assem.LABEL {assem, lab} => 
              Symbol.enter(labelTable, lab, node)
             | _ => 
               labelTable

          val newDefTable = case assInstr
            of Assem.OPER info => 
              Graph.Table.enter(defTable, node, #dst(info))
             | Assem.MOVE info =>
              Graph.Table.enter(defTable, node, [#dst(info)])
             | _ => 
              Graph.Table.enter(defTable, node, [])

          val newUseTable = case assInstr
            of Assem.OPER info => 
              Graph.Table.enter(useTable, node, #src(info))
             | Assem.MOVE info =>
              Graph.Table.enter(useTable, node, [#src(info)])
             | _ => 
              Graph.Table.enter(useTable, node, [])

          val newIsmoveTable = case assInstr
            of Assem.MOVE info =>
              Graph.Table.enter(ismoveTable, node, true)
             | _ =>
              Graph.Table.enter(ismoveTable, node, false)
        in
          (newNodeTable, newLabelTable, newDefTable, newUseTable, newIsmoveTable)
        end

      (* Construct the tables by executing on all of the instructions in x *)
      val (nodeTable, labelTable, defTable, useTable, ismoveTable) =
        foldl 
          addToTables 
          (Graph.Table.empty, Symbol.empty, Graph.Table.empty,
           Graph.Table.empty, Graph.Table.empty) 
          x

      (* Add an edge from node to the node corresponding to label. 
      *
      * This is where we require the usage of the labelTable. This will also
      * throw whenever a particular label is not known to reg alloc.
      * *)
      fun addEdgeFromLabel node label =
        let
          val labelNode = Symbol.look(labelTable, label)
        in
          case labelNode
            of NONE => 
              ErrorMsg.impossible ("addEdge::addEdgeFromLabel: not found")
             | SOME(n) =>
              (Graph.mk_edge {from=node, to=n}; ())
        end

      (* Add all edges for node *)
      fun addEdge(node, nextNode) =
        let
          val instruction = Graph.Table.look(nodeTable, node)
       in
          case instruction
            of NONE => 
              ErrorMsg.impossible ("MakeGraph::addEdge: instruction not found.")
             | SOME(Assem.OPER{assem, dst, src, jump = NONE}) =>
              (Graph.mk_edge {from=node, to=nextNode}; 
               ())
             | SOME(Assem.OPER{assem, dst, src, jump = SOME(x::xs)}) =>
              (List.map (addEdgeFromLabel node) (x::xs);
               ())
            (* This is a dead-end in the code -- we allow it if the compiler
            * stack above us does. *)
             | SOME(Assem.OPER{assem, dst, src, jump = SOME(nil)}) =>
              ()
             | SOME(_) =>
              (Graph.mk_edge {from=node, to=nextNode}; 
               ())
        end

      (* Add all edges within the graph. Notice that this is done using
      * by-effects so the return value will be ignored later on *)
      fun addEdges(nil) = () (* Base case *)
        | addEdges([x]) = (* This gets hit for the last instruction *)
          let
            val instruction = Graph.Table.look(nodeTable, x)
          in
            case instruction
              of NONE =>
                ErrorMsg.impossible("MakeGraph::addEdges: instruction not found.")
               | SOME(Assem.OPER{assem, dst, src, jump = NONE}) =>
                ErrorMsg.impossible("MakeGraph::addEdges: last elt without jump!")
               | SOME(Assem.OPER{assem, dst, src, jump = SOME(z::zs)}) =>
                (List.map (addEdgeFromLabel x) (z::zs); ())
               | SOME(_) =>
                () (* We allow the last instruction to be a dead end if the
                stack above is OK with passing us such a graph.*)
          end
        | addEdges(node::nextNode::xs) = (* Your regular recursive step *)
          (addEdge(node, nextNode); addEdges(nextNode::xs))
    in
      (* Add edges and return the required entities *)
      (addEdges(Graph.nodes controlGraph);
        (Flow.FGRAPH{
          control = controlGraph,
          def = defTable,
          use = useTable,
          ismove = ismoveTable},
         Graph.nodes(controlGraph)))
    end
end
