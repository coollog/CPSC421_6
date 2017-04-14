(* liveness.sml *)

signature LIVENESS =
sig

  datatype igraph = 
      IGRAPH of {graph : Graph.graph,
                 tnode : Graph.node Temp.Table.table,
                 gtemp : Temp.temp Graph.Table.table,
                 moves : (Graph.node * Graph.node) list}

 
  (* interference Graph
   * 
   *  interference Graph takes in the glow graph and constructs the interference
   *  graph from it. The interference graph contains information about
   *  temporaries and their respective collisions (interferences). The second
   *  element of the output contains debugging information and should be
   *  disregarded in the grand scheme of the compiler. 
   *  
   *  The debugging information is a map between the nodes within the
   *  interference graph (which correspond to temporaries) and the out sets of
   *  said nodes.
   *)
  val interferenceGraph : 
        Flow.flowgraph -> igraph * (Flow.Graph.node -> Temp.temp list)
 
  val show : TextIO.outstream * igraph -> unit

end (* signature LIVENESS *)

structure Liveness : LIVENESS = 
struct

  datatype igraph = 
      IGRAPH of {graph : Graph.graph,
                 tnode : Graph.node Temp.Table.table,
                 gtemp : Temp.temp Graph.Table.table,
                 moves : (Graph.node * Graph.node) list}

  type liveSet = unit Temp.Table.table * Temp.temp list
  type livenessMap = liveSet Flow.Graph.Table.table

  (* Extract the value for key from table with safety check 
  *
  * This function throws if there is no value found. 
  *)
  fun getFromGraphTable(table, key) =
    let
      val value = Graph.Table.look(table, key)
    in
      case value 
        of SOME(x) => 
             x
         | NONE => 
             ErrorMsg.impossible 
              ("getFromGraphTable: node does not exist")
    end

  (* Extract the value for key from table with safety check 
   *
   * This function throws if there is no value found. 
   *)
  fun getFromTempTable table key =
    let
      val value = Temp.Table.look(table, key)
    in
      case value 
        of SOME(x) => 
             x
         | NONE => 
             ErrorMsg.impossible 
              ("getFromTempTable: temp does not exist")
    end

  (* Just a much cleaner representation of sets 
   *
   * Solid discussion of these may be found in the Cornell
   * lecture notes:
   * http://www.cs.cornell.edu/courses/cs312/2007fa/recitations/rec09.html
   *
   * We use it to represent the in and out sets for every node. It makes our
   * code for finding them in iterative manner much cleaner and more readable
   * than the alternative code using lists.
   *)
  structure tmpSet = ListSetFn(struct
    type ord_key = Temp.temp
    val compare = Int.compare
  end)
 
  fun interferenceGraph (Flow.FGRAPH{control, def, use, ismove}) =
    let
      (* Convert the result of table[key] into a set, provided that it
       * exists and returns a list of tmps. This is just a convenience
       * function.
       *)
     fun getSet(table, key) = 
       let
         val lst = getFromGraphTable(table, key)
       in
         tmpSet.addList(tmpSet.empty, lst)
       end

     val nodes = Graph.nodes(control)

      (* Update the in and out maps for a single node. A whole iteration of the
       * set-finding algorithm described in the book would be done by running
       * this funciton on all of the nodes within the graph.  
       *
       * inMap and outMaps are just the in and out sets indexed on the node
       * within the flow graph. This makes it very convenient for usage with the
       * iterative algorithm.
       *
       * list Flow.Graph.node * 
       *   (tmpSet Flow.Graph.Table.table * 
       *    tmpSet Flow.Graph.Table.table) 
       *  ->
       * (tmpSet Flow.Graph.Table.table * 
       *  tmpSet Flow.Graph.Table.table) 
       *)
      fun computeInOutIter (node, (inMap, outMap)) = 
        let
          (* Retrieve the use and def sets for node *)
          val defSet = getSet(def, node) 
          val useSet = getSet(use, node) 

          (* Compute the new in set. Done by using the formula of
           *
           * in[n] = use[n] + (out[n] - def[n])
           *)
          val in' = tmpSet.union(
            useSet,
            tmpSet.difference(
              getFromGraphTable(outMap, node), 
              defSet))

          val succNodesList = Graph.succ(node) 
          (* Function computing the out. Done using the formula of
           *
           * out[n] = Sum_{n \in succNodesList} in[n]
           *)
          val out' = foldr 
            (fn(node, set) => tmpSet.union(set, getFromGraphTable(inMap, node)))
            tmpSet.empty
            succNodesList
        in
          (* insert the new values into ini and out maps and return them!*)
          (Flow.Graph.Table.enter(inMap, node, in'),
           Flow.Graph.Table.enter(outMap, node, out'))
        end

      (* Function that computes the in and out maps for all of the nodes 
       * 
       *  This basicaly runs the iterative algorithm described within the book
       *  by using the above function and detecting the end condition.
       *
       * unit ->
       *   (tmpSet.set Flow.Graph.Table.table * 
       *    tmpSet.set Flow.Graph.Table.table) 
       *)
      fun computeInOutMaps() = 
        let
          (* Produces an empty map of the correct format for in/out maps *)
          fun initMap() = 
            foldr
              (fn(n, map) => Flow.Graph.Table.enter(map, n, tmpSet.empty))
              Flow.Graph.Table.empty
              nodes
          
          (* The function that does all of the actual computation *)
          fun computeMaps(inMap, outMap) =
            let
              (* Do an iteration and stop if sets didn't change. Otherwise
              * continue *)
              val (inMap', outMap') = foldr computeInOutIter (inMap, outMap) nodes

              (* Returns true if the maps m1 and m2 are equal and false
               * otherwise. Maps are equal if the sets contained within
               * them  are all equal for all nodes within the flow graph
               *)
              fun mapsAreEqual(m1, m2) =
                List.all
                (fn (n) => tmpSet.equal(
                  getFromGraphTable(m1, n),
                  getFromGraphTable(m2, n)))
                nodes
            in
              if 
                mapsAreEqual(inMap', inMap) andalso 
                mapsAreEqual(outMap', outMap)
              then
                (inMap', outMap')
              else
                computeMaps(inMap', outMap')
            end
        in
          computeMaps(initMap(), initMap())
        end

      (* Get the values for in and out maps using the former functions *)
      val (inMap, outMap) = computeInOutMaps()

      (* Collect all of the temporaries within the flow graph as a set *)
      fun getAllTmps(node, allTmpSet) =
        tmpSet.union(
          allTmpSet,
          tmpSet.union(getSet(def, node), getSet(use, node)));

      val allTmps = foldr getAllTmps tmpSet.empty nodes

      val interference_graph = Graph.newGraph()
      (* Construct the interference graph by adding nodes for every temporary
       * within the flow graph and creating the tnode and gnode tables. The
       * function below only adds a single temporary and so it must be used in
       * concert with foldr. 
       *)
      fun addNodeToGraph(tmp, (tnodeTable, gtempTable)) =
        let
          val node = Graph.newNode(interference_graph)
          val newTnodeTable = Temp.Table.enter(tnodeTable, tmp, node)
          val newGtempTable = Graph.Table.enter(gtempTable, node, tmp)
        in
          (newTnodeTable, newGtempTable)
        end

      val (tnode, gtemp) = 
        foldr 
          addNodeToGraph 
          (Temp.Table.empty, Graph.Table.empty)
          (tmpSet.listItems(allTmps))

      (* At this point we have all of the nodes within the interference graph,
       * all of the maps tnode and gtemp and all of the in/out sets computed.
       * Now, we must use this infomation to add edges to the graph and fill in
       * the ismove table.
       *
       * addEdgesAndMoves does just that for a single node within the flow
       * graph.
       *)
      fun addEdgesAndMoves(flowNode, movesList) = 
        let
          val isMove = Graph.Table.look(ismove, flowNode)
          val defList = getFromGraphTable(def, flowNode)
          val useList = getFromGraphTable(use, flowNode) 
          val outList = tmpSet.listItems(getFromGraphTable(outMap, flowNode))

          (* Convenience function that catches any potential bugs in
           * move-related nodes from former parts of reg alloc. 
           *)
          fun assertCorrectMove(defList, useList) =
            if length(defList) <> 1 orelse length(useList) <> 1
            then
              ErrorMsg.impossible ("addToMoves: move node with illegal list size")
            else
              ()

          fun handleMoves() =
            case isMove
              of SOME(true) =>
                let
                  val defNode = getFromTempTable tnode (List.nth(defList, 0))
                  val useNode = getFromTempTable tnode (List.nth(useList, 0))
                in
                   (assertCorrectMove(defList, useList);
                    (defNode, useNode) :: movesList)
                end
               | SOME(false) => 
                  movesList
               | NONE =>
                  ErrorMsg.impossible ("addToMoves: node not found")

          fun addEdges() = 
            let
              val defTmpNodes = map (getFromTempTable tnode) defList
              val outNodesList = map (getFromTempTable tnode) outList

              fun handleSingleDef (defTmpNode) = 
                map 
                  (fn (outNode) => 
                    Graph.mk_edge {from=defTmpNode, to=outNode})
                  outNodesList
            in
              map handleSingleDef defTmpNodes
            end
        in
          (addEdges();
           handleMoves()) 
        end

      val movesList = foldr addEdgesAndMoves [] nodes
    in
      (IGRAPH{
        graph = interference_graph,
        tnode = tnode,
        gtemp = gtemp,
        moves = movesList},
        fn(n) => tmpSet.listItems(getFromGraphTable(outMap, n))
      ) 
    end

  fun show (outStream, IGRAPH{graph, tnode, gtemp, moves}) =
    let
      val nodes = Graph.nodes(graph);

      fun printNodeList([node]) =
          TextIO.output(outStream, Graph.nodename(node)^"\n")
        | printNodeList(node::nodes) =
          (TextIO.output(outStream, Graph.nodename(node)^",");
           printNodeList(nodes))
        | printNodeList(nil) = 
          TextIO.output(outStream, "\n");
      fun printAllForNode(node) = 
        (TextIO.output(
          outStream, 
          (Graph.nodename(node) ^ 
            "(" ^ Temp.makestring(getFromGraphTable(gtemp, node)) ^ ")" ^ 
            "-->"));
        printNodeList(Graph.succ(node)))
    in
      (print ("IGRAPH SHOW\n"); map printAllForNode nodes; ()) 
    end

end (* structure Liveness *)
