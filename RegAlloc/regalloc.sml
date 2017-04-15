(* regalloc.sml *)

signature REG_ALLOC =
sig
   structure R : REGISTER_STD
   
   type allocation = Register.register Temp.Table.table

   val color : {interference : Liveness.igraph,
                initial : allocation,
                registers : R.register list} -> allocation

end (* signature REG_ALLOC *)

functor RegAllocGen(Register : REGISTER_STD) : REG_ALLOC =
struct
   structure R : REGISTER_STD = Register

   type allocation = R.register Temp.Table.table

   (* The color function talkes an initial allocation table (which assigns
      temporary variables such as FP or SP into certain fixed registers)
      plus an interference graph and a list of registers, and returns
      a new allocation table (mapping from temporaries to registers).

      Notice, you don't need to implement spilling and coalescing. 
      Just do the "simplify" and then do the "select".
    *)

    structure G = Graph
    structure L = Liveness

    (* a set of nodes *)
    type nodeset = unit Graph.Table.table * Graph.node list

    (* a modified graph : we store which nodes are "in" the graph *)
    datatype rgraph = RGRAPH of {graph:Graph.graph, nodes:nodeset}

    (* is a node currently "in" the graph *)
    fun member (node, RGRAPH{graph=_, nodes=(t, _)}) = (
      case G.Table.look(t, node)
        of SOME(_) => true
         | _ => false
    )

    (* remove a node from the graph by reconstructing the set + lst
    * nodeset, albeit simple, does not provide O(1) delete, so this take O(n),
    * where n is the number of nodes *)
    fun remove (node, RGRAPH{graph, nodes=(t, lst)}) =
    let
      (* filter out other nodes *)
      val lst' = (
        List.filter
        (fn (x) => not(G.eq(x, node)))
        lst
      )

      (* re-construct the table *)
      val t' = List.foldr (fn (x, t) => G.Table.enter(t, x, ())) G.Table.empty lst'
    in
      (* construct the new RGRAPH *)
      RGRAPH{
        graph=graph,
        nodes=(t', lst')
      }
    end

  (* degree of a node within a given graph *)
   fun degree (node, rgraph) = List.length(

     (* find nodes that are adjacent AND in the rgraph *)
     List.filter
     (fn (x) => member(x, rgraph))
     (G.adj(node))
   )

   (* argmin of f(x) applied to a list of elements *)
   fun argmin f lst = #1 (
    List.foldl
    (fn (elem, (min_elem, min_val)) =>
      let 
        (* apply function to element *)
        val x = f(elem)
      in
        (* new min found *)
        if x < min_val then (elem, x)

        (* keep old min *)
        else (min_elem, min_val)
      end
    )
    (* start at the head of the list *)
    ((List.hd lst), f (List.hd lst))
    lst
   )

   (* find temporary corresponding to a graph node *)
   fun find_temp (gtemp, node) = (
      case G.Table.look(gtemp, node)
        of SOME(temp) => temp
         | _ => (ErrorMsg.impossible ("table lookup failed"); Temp.newtemp())
   )

   (* node (not pre-colored) with lowest degree in a graph *)
   fun lowest_degree (rgraph, initial, gtemp) =
   let 
     val RGRAPH{graph, nodes=(t, lst)} = rgraph

     (* remove the pre-colored nodes from consideration *)
     val lst' = (
        List.filter
        (fn (node) => (
            case Temp.Table.look(initial, find_temp(gtemp, node))
              of NONE => true
               | _ => false
             )
        )
        lst
     )
   in 
     if List.null(lst') then NONE
     else SOME(argmin (fn (x) => degree(x, rgraph)) lst')
   end

   (* simplify *)
   fun simplify (RGRAPH{graph, nodes=(t, [])}, k, initial, gtemp, stack) = stack
     | simplify (rgraph, k, initial, gtemp, stack) =
     let
       (* find the node with the lowest degree -- that is not precolored *)
         val node = lowest_degree(rgraph, initial, gtemp)

         (* parse the reduced graph *)
         val RGRAPH{graph=_, nodes=(_, lst)} = rgraph
     in
       case node 

         (* only pre-colored nodes are left at this point *)
         of NONE => stack @ lst

         (* non pre-colored nodes still left *)
          | SOME(node) => (
            (* it better have degree less than k for this to work *)
            if (degree(node, rgraph) < k)
            then (
              (* push onto stack and recursively simplify *)
              simplify (
                 remove(node, rgraph),
                 k,
                 initial,
                 gtemp,
                 node :: stack
              )
            ) else (
              (* simplify - select algorithm fails in this case *)
              ErrorMsg.impossible "failed to color interference graph";
              []
            )
          )
     end

   fun find_color (gtemp, node, alloc, registers) = (

     (* has this node already been allocated? *)
     case Temp.Table.look(alloc, find_temp(gtemp, node))
       of SOME(temp) => temp

       (* nope => find it a color *)
        | _ => (
           let
             (* which registers are taken *)
             val taken = (
               List.mapPartial
               (fn (adj_node) => Temp.Table.look(alloc, find_temp(gtemp, adj_node)))
               (G.adj(node))
             )

             (* O(N) search -- is this register taken? *)
             fun istaken (register, taken) = (
               case (List.find (fn (t) => (t = register)) taken)
                 of SOME(_) => true
                  | _ => false
             )
           in
             (* make sure we succeeded to find a color *)
             case (List.find (fn (r) => not(istaken(r, taken))) registers)
               of SOME(register) => register
                | _ => ErrorMsg.impossible ("failed to find color for register")
           end
       )
     )

   fun color {interference=L.IGRAPH{graph, tnode, gtemp, moves}, initial, registers} = 
     let

       (* k = # of registers *)
       val k = List.length registers

       (* create table of nodes ( used as set ) *)
       val nodes = List.foldr (fn (x, t) => G.Table.enter(t, x, ())) G.Table.empty (G.nodes(graph))

       (* simplify *)
       val stack = simplify(RGRAPH{graph=graph, nodes=(nodes, G.nodes(graph))}, k, initial, gtemp, [])

       (* select *)
       fun select ([], alloc) = alloc
         | select (node :: stack, alloc) =
           let
             
             (* find a color for this register *)
             val register = find_color(gtemp, node, alloc, registers)

             (* find the corresponding temporary *)
             val temp = find_temp(gtemp, node)

             (* update allocation table *)
             val alloc' = Temp.Table.enter(alloc, temp, register)

             (* val _ = print("RegAlloc: alloc " ^ (Temp.makestring temp) ^ " to " ^ register ^ "\n") *)
           in
             (* assign registers in the rest of the stack *)
             select(stack, alloc')
           end
     in
       select(stack, initial)
     end

end (* functor RegAllocGen *)
