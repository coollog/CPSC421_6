(* liveness.sml *)

signature LIVENESS =
sig

  datatype igraph = 
      IGRAPH of {graph : Graph.graph,
                 tnode : Graph.node Temp.Table.table,
                 gtemp : Temp.temp Graph.Table.table,
                 moves : (Graph.node * Graph.node) list}

 
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

  (* To construct the interference graph, it is convenient to
     construct a liveness map at each node in the FlowGraph first.
     For each node in the flowgraph, i.e., for each assembly 
     instruction, we want to easily look up the set S of live 
     temporaries. 
   *)
  type liveSet = unit Temp.Table.table * Temp.temp list
  type livenessMap = liveSet Flow.Graph.Table.table

  (* Extract the value for key from table with safety check *)
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

  (* Extract the value for key from table with safety check *)
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
  * *)
  structure tmpSet = ListSetFn(struct
    type ord_key = Temp.temp
    val compare = Int.compare
  end)
 
  fun interferenceGraph (Flow.FGRAPH{control, def, use, ismove}) =
    let
      val nodes = Graph.nodes(control)

      (* Do a single iteration of the set-finding algorithm 
      *
      * list Flow.Graph.node * 
      *   (tmpSet Flow.Graph.Table.table * 
      *    tmpSet Flow.Graph.Table.table) 
      *  ->
      * (tmpSet Flow.Graph.Table.table * 
      *  tmpSet Flow.Graph.Table.table) 
      *)
      fun computeInOutIter (node :: nodes, (iniMap, outMap)) = 
        (* There is a single node to consider. Use that to update the map *)
        let
          (* Get the updated version of the maps *)
          val (iniMap, outMap) = computeInOutIter(nodes, (iniMap, outMap))

          (* Convert the result of table[key] into set, provided that it
          * exists and returns a list of tmps *)
          fun getSet(table, key) = 
            let
              val lst = getFromGraphTable(table, key)
            in
              tmpSet.addList(tmpSet.empty, lst)
            end

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
          fun makeOutSet (node::nodes) =
            tmpSet.union(
              makeOutSet(nodes),
              getFromGraphTable(iniMap, node))
            | makeOutSet(nil) = tmpSet.empty 

          val out' = makeOutSet(succNodesList)
        in
          (* insert the new values into ini and out maps and return them!*)
          (Flow.Graph.Table.enter(iniMap, node, in'),
           Flow.Graph.Table.enter(outMap, node, out'))
        end
        | computeInOutIter (nil, (iniMap, outMap)) = (iniMap, outMap)

      (* Function that computes the in and out maps for all of the nodes 
      *
      * unit ->
      *   (tmpSet.set Flow.Graph.Table.table * 
      *    tmpSet.set Flow.Graph.Table.table) 
      *)
      fun computeInOutMaps() = 
        let
          fun initMap() = 
            foldr
              (fn(n, map) => Flow.Graph.Table.enter(map, n, tmpSet.empty))
              Flow.Graph.Table.empty
              nodes
          
          val initInMap = initMap() 
          val initOutMap = initMap()
          
          (* The function that does all of the actual computation *)
          fun computeMaps(inMap, outMap) =
            let
              (* Do an iteration and stop if lists didn't change. Otherwise
              * continue*)
              val (inMap', outMap') = computeInOutIter(nodes, (inMap, outMap))

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
          computeMaps(initInMap, initOutMap)
        end

      (* Get the values for in and out maps using the former functions *)
      val (inMap, outMap) = computeInOutMaps()
      fun getAllTmps(node, allTmpSet) =
        tmpSet.union(
          allTmpSet,
          tmpSet.union(
            tmpSet.addList(tmpSet.empty, getFromGraphTable(def, node)),
            tmpSet.addList(tmpSet.empty, getFromGraphTable(use, node))))

      val allTmps = foldr getAllTmps tmpSet.empty nodes

      val graph = Graph.newGraph()
      (* Insert nodes into igraph and create maps *)
      fun addNodeToGraph(tmp, (tnodeTable, gtempTable)) =
        let
          val node = Graph.newNode(graph)
          
          val newTnodeTable = Temp.Table.enter(tnodeTable, tmp, node)
          val newGtempTable = Graph.Table.enter(gtempTable, node, tmp)
        in
          (newTnodeTable, newGtempTable)
        end

      (* construct tnode and gtemp *)
      val (tnode, gtemp) = 
        foldr 
          addNodeToGraph 
          (Temp.Table.empty, Graph.Table.empty)
          (tmpSet.listItems(allTmps))

      fun addEdgesAndMoves(flowNode, movesList) = 
        let
          val isMove = Graph.Table.look(ismove, flowNode)
          val defList = getFromGraphTable(def, flowNode)
          val useList = getFromGraphTable(use, flowNode) 
          val outList = tmpSet.listItems(getFromGraphTable(outMap, flowNode))

          fun assertCorrectMove(defList, useList) =
            if length(defList) <> 1 orelse length(useList) <> 1
            then
              ErrorMsg.impossible ("addToMoves: move node with illegal list size")
            else
              ()

          fun handleMoves() =
            let
              val defNode = getFromTempTable tnode (List.nth(defList, 0))
              val useNode = getFromTempTable tnode (List.nth(useList, 0))
            in
              case isMove
                of SOME(true) =>
                   (assertCorrectMove(defList, useList);
                    (defNode, useNode) :: movesList)
                 | SOME(false) => 
                    movesList
                 | NONE =>
                    ErrorMsg.impossible ("addToMoves: node not found")
            end

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
        graph = graph,
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
        | printNodeList(nil) = ()
      fun printAllForNode(node) = 
        (TextIO.output(outStream, Graph.nodename(node) ^ "-->");
        printNodeList(Graph.adj(node)))
    in
      (map printAllForNode nodes; ()) 
    end

end (* structure Liveness *)
