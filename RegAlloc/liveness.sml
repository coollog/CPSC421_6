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

  structure A = Assem
  structure F = Flow
  structure G = Graph

  type liveout = Temp.temp list G.Table.table

  datatype igraph = 
      IGRAPH of {graph : Graph.graph,
                 tnode : Graph.node Temp.Table.table,
                 gtemp : Temp.temp Graph.Table.table,
                 moves : (Graph.node * Graph.node) list}

  (* To construct the interference graph, it is convenient to
     construct a liveness map at each node in the FlowGraph first.
     For each node in the flowgraph, i.e., for each assembly 
     instruction, we want to easily lookup up the set S of live 
     temporaries. 
   *)

  (* for the definition of LiveSet.liveSet see liveset.sml *)
  type liveSet = LiveSet.liveSet
  type livenessMap = liveSet Flow.Graph.Table.table

  (* initialize empty liveness map *)
  fun empty(nodes) = (
    List.foldr
    (fn (node, t) => F.Graph.Table.enter(t, node, LiveSet.empty))
    F.Graph.Table.empty
    nodes
  )

  (* lookup node within F.Graph.Table *)
  fun lookup(table, node, msg, empty) = (
    case F.Graph.Table.look(table, node)
      of SOME(set) => set
       | _ => (ErrorMsg.impossible ("table lookup failed " ^ msg); empty)
  )

  (* Algorithm 10.4: compute liveness map by iteration *)
  fun computeLiveness(F.FGRAPH{control, def, use, ismove}) =
  let

    val nodes = G.nodes(control)

    (* liveness maps : maintain liveness for each node *)
    val livein = ref(empty(nodes))
    val liveout = ref(empty(nodes))

    fun f (node) =
    let 

      (* lookup current livein[n], liveout[n] *)
      val livein_n = lookup(!livein, node, "live-in", LiveSet.empty)
      val liveout_n = lookup(!liveout, node, "live-out", LiveSet.empty)

      (* lookup current def[n], use[n] and convert them to sets *)
      val def_n = LiveSet.construct(lookup(def, node, "def", []))
      val use_n = LiveSet.construct(lookup(use, node, "use", []))

      (* livein[n] = use[n] U (out[n] - def[n]) *)
      val livein_n' = LiveSet.union(use_n, LiveSet.diff(liveout_n, def_n))

      (* liveout[n] = union in[s] for s in succ[n] *)
      val succ_n = (List.map (fn x => lookup(!livein, x, "live-in", LiveSet.empty)) (G.succ(node)))
      val liveout_n' = (List.foldr LiveSet.union LiveSet.empty succ_n)
    in

      (* update live-in, live-out for this node *)
      livein := F.Graph.Table.enter(!livein, node, livein_n');
      liveout := F.Graph.Table.enter(!liveout, node, liveout_n');

      (* return true when no changes are made *)
      (LiveSet.eq(livein_n, livein_n') andalso LiveSet.eq(liveout_n, liveout_n'))

    end

    (* evaluate function over all nodes,
    * then return whether all were true *)
    fun all (nodes) = (
      List.all
      (fn (x) => x)
      (List.map f nodes)
    )
  in
    (* iterate until finding a fixed point *)
    while (not (all nodes)) do ();

    (* return the livein, liveout maps *)
    (!livein, !liveout)
  end



  (* after constructing the livenessMap, it is quite easy to
     construct the interference graph, just scan each node in
     the Flow Graph, add interference edges properly ... 
   *)



  fun interferenceGraph(fgraph) =
  let

    (* compute liveness maps using function above *)
    val (livein, liveout) = computeLiveness(fgraph)

    (* parse fgraph *)
    val F.FGRAPH{control, def, use, ismove} = fgraph

    val graph = G.newGraph()
    val tnode = ref Temp.Table.empty
    val gtemp = ref G.Table.empty
    val moves = ref []

    (* find a node in the interference graph using tnode table
    * if not present, add it + record in both gtemp + tnode *)
    fun get_inode (temp) = (
      case Temp.Table.look(!tnode, temp)
        of SOME(inode) => inode
         | _ => (
            let
              val inode = G.newNode(graph)
            in
              tnode := Temp.Table.enter(!tnode, temp, inode);
              gtemp := G.Table.enter(!gtemp, inode, temp);
              inode
            end
         )
    )

    (* process a control flow node (an assembly instruction) *)
    fun process_node (node) =
    let
      (* lookup temps defined + used at this node *)
      val def_n = lookup(def, node, "def", [])
      val use_n = lookup(use, node, "use", [])

	  (* grab liveout[n] set *)
	  val liveout_n = lookup(liveout, node, "live-out", LiveSet.empty)

	  (* all newly defined temporaries are considered live-out, even if they
	  * are never used. see explanation on p225-226. *)

	  (* hence, we take liveout_n = def_n U liveout_n *)
	  val def_n' = LiveSet.construct (lookup(def, node, "def", []))
	  val liveout_n = LiveSet.members(LiveSet.union(liveout_n, def_n'))

      (* is this a move instruction ? *)
      val ismove_n = (
        case Graph.Table.look(ismove, node)
          of SOME(x) => x
           | _ => false 
      )
    in

      (* if this is a move instruction, add all |def| * |use| node pairs to moves *)
      if ismove_n then moves := (
        List.foldr
        (fn (u, lst) => ((List.map (fn (d) => (get_inode(d), get_inode(u))) def_n) @ lst))
        []
        use_n
      ) @ !moves else ();

      (* add edges : "at flow node n where there is a newly defined temporary
      * d \in def[n], and where temporaries t1, t2, ... are in the liveMap, we
      * just add interference edges (d, t1), (d, t2), ..." -- Appel 225 *)
      (List.app
      (fn (d) =>
        List.app
		(fn (t) => (
          let 
            val d' = get_inode(d)
            val t' = get_inode(t)
          in
            (* don't add self-loops! *)
            if G.eq(d', t') then ()

            (* add the edge from d -> t *)
            else (
                G.mk_edge({from=d', to=t'})
            )
          end
        ))
        liveout_n)
      def_n);

      ()
    end
  in

    (* iterate through nodes + add edges *)
    (List.app process_node (G.nodes(control)));

    (* return igraph + liveout mapping *)
    (
      IGRAPH{
        graph=graph,
        tnode=(!tnode),
        gtemp=(!gtemp),
        moves=(!moves)
      },
      fn (key) => LiveSet.members(lookup(liveout, key, "live-out", LiveSet.empty))
    )
  end

  (* use DOT to display an interference graph *)
  fun show (outstream, IGRAPH{graph, tnode, gtemp, moves}) =
    DotGraph.dot(outstream, graph,
      fn(n) => Temp.makestring(valOf(G.Table.look(gtemp, n)))
    )

end (* structure Liveness *)
