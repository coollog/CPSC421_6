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

      (* Prints an interference graph as a list of 'temp: interfering temps' *)
      val show : igraph -> unit


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


  fun show(IGRAPH{graph, gtemp, ...}) =
    let
      val nodes = Graph.nodes(graph)
      fun toTemp(node) = case Graph.Table.look(gtemp, node) of
                            SOME(tmp) => "temp " ^ Int.toString(tmp)
                          | NONE => "'no temp found'"
      fun printNode(node) =
        let
          val adj = map toTemp (Graph.adj(node))
          val node' = toTemp node
        in
          (print node'; print ": ";
           map (fn (n) => (print n; print ", "; ())) adj;
           print "\n";
           ())
        end
    in
      map printNode nodes; ()
    end

  type liveSet = unit Temp.Table.table * Temp.temp list
  val emptyLS = (Temp.Table.empty, nil) : liveSet
  fun printLiveSet((tbl, tlist): liveSet) =
    let
      fun printTemp(t) = (print (Int.toString t); print ", "; ())
    in
      (map printTemp tlist; print "\n"; ())
    end

  type livenessMap = liveSet Flow.Graph.Table.table
  fun printLivenessMap(lnMap : livenessMap) =
    let
      val entries = Flow.Graph.Table.listItemsi(lnMap)
      fun printEntry(key, liveset) =
        let
          val key' = Int.toString key
        in
          print key'; print ": "; printLiveSet(liveset); print "\n"
        end
    in
      map printEntry entries
    end

  (* Utility function, used in table queries (Table.look) where we expect a lookup to
     but must provide a value anyway if it fails. Similar to an assert stmt. *)
  fun require(SOME(i), _) = i
    | require(NONE, def) = (raise ErrorMsg.Error; def)

  (* Takes a 'Temp.temp list' and returns a 'liveSet' *)
  fun populateLS(nil) = emptyLS
    | populateLS((th : Temp.temp)::tt) =
        let
          val (tbl, lst) = populateLS(tt)
        in
          (Temp.Table.enter(tbl, th, ()), th::lst)
        end

  (* Similar to 'require' *)
  fun populateLS'(SOME(lst)) = populateLS(lst)
    | populateLS'(NONE) = (raise ErrorMsg.Error; emptyLS)

  (* Returns a livenessMap populated with empty liveSets, each liveSet
     corresponding to a node *)
  fun populateLNMap(nil) = Flow.Graph.Table.empty : livenessMap
    | populateLNMap(node::nodes) =
        Flow.Graph.Table.enter(populateLNMap(nodes), node, emptyLS)

  (* Removes item i from a list if it exists *)
  fun remove(nil, i) = nil
    | remove(h::t, i) = if h = i then remove(t, i) else h::remove(t, i)

  (* Returns the union of two liveSets *)
  fun union(a : liveSet, (btab, nil) : liveSet) = a
    | union((a as (atab, alist)) : liveSet, (btab, blh::blt) : liveSet) =
      case Temp.Table.look(atab, blh) of
          SOME(_) => union(a, (btab, blt))
        | NONE => union ((Temp.Table.enter(atab, blh, ()), blh::alist),
                         (btab, blt))

  (* Returns the union of a list of liveSets of any length *)
  fun unionList(lst) = foldl union emptyLS lst

  (* Subtracts the second liveSet from the first *)
  fun subtract(ls, (btab, nil)) = ls
    | subtract((atab, alist) : liveSet, (btab, blh::blt) : liveSet) =
      case Temp.Table.look(atab, blh) of
          SOME (()) => subtract((Temp.Table.remove(atab, blh), remove(alist, blh)),
                                (btab, blt))
        | NONE => subtract((atab, alist), (btab, blt))

  fun liveness(Flow.FGRAPH{control, def, use, ismove}) =
    let
      val nodes = Graph.nodes(control)
      val inn =  ref(populateLNMap nodes)
      val out =  ref(populateLNMap nodes)
      val inn' = ref(populateLNMap nodes)
      val out' = ref(populateLNMap nodes)
      val repeat = ref true
      fun updateSets(node) =
          let
            fun findSucc(node) = case Graph.Table.look(!inn, node) of
                                     SOME(ls) => ls
                                   | NONE => (raise ErrorMsg.Error; emptyLS)

            (* use[n] *)
            val useN = populateLS'(Graph.Table.look(use, node))
            (* def[n] *)
            val defN = populateLS'(Graph.Table.look(def, node))
            (* out[n] *)
            val outN = case Flow.Graph.Table.look(!out, node) of
                         SOME(n) => n | NONE => (raise ErrorMsg.Error; emptyLS)
            (* succ[n] *)
            val succN = Graph.succ(node)

            (* in[n] <- use[n] U (out[n] - def[n]) *)
            val inN = union(useN, subtract(outN, defN))

            (* out[n] <- U of in[s] for all successor nodes *)
            val outN = unionList(map findSucc succN)
          in
            (inn := Graph.Table.enter(!inn, node, inN);
             out := Graph.Table.enter(!out, node, outN);
             ())
          end
      fun l(lm) =
        let
          val liveSets = Flow.Graph.Table.listItems(lm)
          fun lsToList((lsT, lsL) : liveSet) = map #1 (Temp.Table.listItemsi lsT)
        in
          map lsToList liveSets
        end
    in
      while !repeat do (
        (*printLivenessMap(!out);*)
        inn' := !inn;
        out' := !out;
        map updateSets nodes;
        (if (l(!inn)) = (l(!inn')) andalso (l(!out)) = (l(!out'))
                then (repeat := false; ())
                else ())
      );
      {inn=inn, out=out}
    end


  fun interferenceGraph(fgraph as Flow.FGRAPH{control, def, use, ismove}) =
        let
          val nodes = Graph.nodes(control)

          (* 'inn' and 'out' are liveMaps representing live-in and live-out
             for every node *)
          val {inn, out} = liveness(fgraph)
          val _ = print "printing out:\n";
          val _ = printLivenessMap(!out);
          val _ = print "\n";

          (* Junk values used in 'require' calls *)
          val junkNode = Graph.newNode(Graph.newGraph())
          val junkTemp = Temp.newtemp()

          (* Given a list of nodes, returns a set of all temps
             used or defined by the instruction corresponding to each node*)
          fun allTemps(nil) = emptyLS
            | allTemps(node::nodes) =
                let
                  val defs = populateLS(require(Graph.Table.look(def, node), nil))
                  val uses = populateLS(require(Graph.Table.look(use, node), nil))
                in
                  union(union(defs, uses), allTemps(nodes))
                end

          (* Given a list of temps, returns a graph with no edges, and two
             tables mapping temps->nodes and nodes->temps *)
          fun populateIGraph((_, nil) : liveSet) = (Graph.newGraph(),
                                                    Temp.Table.empty,
                                                    Graph.Table.empty)
            | populateIGraph((tbl, hdTmp::tlTmp) : liveSet) =
                let
                  val (graph, tnode, gtemp) = populateIGraph(tbl, tlTmp)
                  val newNode = Graph.newNode(graph)
                  val tnode' = Temp.Table.enter(tnode, hdTmp, newNode)
                  val gtemp' = Graph.Table.enter(gtemp, newNode, hdTmp)
                in
                  (graph, tnode', gtemp')
                end

          val (igraph, tnode, gtemp) = populateIGraph(allTemps nodes)

          (* Builds the list of moves *)
          fun buildMoves(nil) = nil
            | buildMoves(node::nodes) =
                let
                  fun to() = hd(require(Graph.Table.look(def, node), junkTemp::nil))
                  fun from() = hd(require(Graph.Table.look(use, node), junkTemp::nil))
                  fun convToNode(tmp) = require(Temp.Table.look(tnode, tmp), junkNode)
                in
                  case require(Graph.Table.look(ismove, node), false) of
                    true => (convToNode(from()), convToNode(to()))
                            :: buildMoves(nodes)
                  | false => buildMoves(nodes)
                end

          val moves = buildMoves(nodes)

          (* Given variable a and all live-out edges bs, adds edges *)
          fun addRule1Edges(a, nil) = ()
            | addRule1Edges(a, b::bt) =
                let
                  val aNode = require(Temp.Table.look(tnode, a), junkNode)
                  val bNode = require(Temp.Table.look(tnode, b), junkNode)
                  (*val _ = print ("Rule 1: Adding edge between " ^ Int.toString(a) ^" and "^Int.toString(b)^".\n")*)
                  (*val _ = if a = b then ignore (print "Rule 1: same nodes!\n") else ()*)
                in
                  (if a <> b then Graph.mk_edge{from=aNode, to=bNode} else ());
                  addRule1Edges(a, bt)
                end

          fun addRule2Edges(a, c, nil) = ()
            | addRule2Edges(a, c, b::bt) =
                let
                  val aNode = require(Temp.Table.look(tnode, a), junkNode)
                  val bNode = require(Temp.Table.look(tnode, b), junkNode)
                  (*val _ = print ("Rule 2: Adding edge between " ^ Int.toString(b) ^" and "^Int.toString(c)^".\n")*)
                in
                  if b <> c
                    then (Graph.mk_edge{from=aNode, to=bNode}; addRule2Edges(a, c, bt))
                    else addRule2Edges(a, c, bt)
                end

          fun buildIGraph(nil) = ()
            | buildIGraph(node::nodes) =
                let
                  val defs = require(Graph.Table.look(def, node), junkTemp::nil)
                  val uses = require(Graph.Table.look(use, node), junkTemp::nil)
                  val ismove = require(Graph.Table.look(ismove, node), false)
                  val outs = #2(require(Graph.Table.look(!out, node), emptyLS))
                in
                  if not ismove
                    then (ignore(map (fn (def) => addRule1Edges(def, outs)) defs);
                          buildIGraph(nodes))
                    else (ignore(addRule2Edges(hd defs, hd uses, outs));
                          buildIGraph(nodes))
                end

          val build = buildIGraph(nodes)

          fun nodeToLiveOut(node) =
                #2(require(Graph.Table.look(!out, node), emptyLS))
        in
          (IGRAPH{graph=igraph, tnode=tnode, gtemp=gtemp, moves=moves},
           nodeToLiveOut)
        end
  (* after constructing the livenessMap, it is quite easy to
     construct the interference graph, just scan each node in
     the Flow Graph, add interference edges properly ...
   *)




end (* structure Liveness *)




