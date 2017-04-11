(* regalloc.sml *)

signature REG_ALLOC =
sig
   structure R : REGISTER_STD

   type allocation = Register.register Temp.Table.table

   val color : {interference : Liveness.igraph,
                initial : allocation,
                registers : R.register list} -> allocation

   val printTable : allocation -> unit

end (* signature REG_ALLOC *)

functor RegAllocGen(Register : REGISTER_STD) : REG_ALLOC =
struct
  structure R : REGISTER_STD = Register

  type allocation = R.register Temp.Table.table

  fun printTable(tbl) =
    let
      val tempRegs = Temp.Table.listItemsi(tbl)
      fun printTemp((temp, reg)) = (print (Int.toString temp); print ": "; print reg; print "\n"; ())
    in
      map printTemp tempRegs; ()
    end

  (* The color function talkes an initial allocation table (which assigns
  temporary variables such as FP or SP into certain fixed registers)
  plus an interference graph and a list of registers, and returns
  a new allocation table (mapping from temporaries to registers).

  Notice, you don't need to implement spilling and coalescing.
  Just do the "simplify" and then do the "select".
  *)

  val junkTemp = Temp.newtemp()
  val junkNode = Graph.newNode(Graph.newGraph())
  fun require(SOME(i), _) = i
    | require(NONE, def) = (raise ErrorMsg.Error; def)

  fun temp2node(igraph as Liveness.IGRAPH{graph, tnode, gtemp, moves}, temp) =
        require(Temp.Table.look(tnode, temp), junkNode)
  fun node2temp(igraph as Liveness.IGRAPH{graph, tnode, gtemp, moves}, node) =
        require(Graph.Table.look(gtemp, node), junkTemp)

  (* Given an igraph, returns a Temp-indexed table with the degree of each temp*)
  fun buildDegreeTable(igraph as Liveness.IGRAPH{graph, tnode, gtemp, moves}) =
    let
      val nodes = Graph.nodes(graph)
      fun tempN(n) = node2temp(igraph, n)
      fun degN(n) = length(Graph.adj(n))
    in
      foldl (fn (n, t) => Temp.Table.enter(t, tempN n, degN n))
            (Temp.Table.empty : int Temp.Table.table)
            nodes
    end

  fun setDegree(tbl, temp, d) = Temp.Table.enter(tbl, temp, d)
  fun getDegree(tbl, temp) = require(Temp.Table.look(tbl, temp), 0)

  (* Given an igraph and degree k, returns a dictionary of nodes that had
     degree less than k and nodes that had degree greater than k*)
  fun partitionGraph(igraph as Liveness.IGRAPH{graph, tnode, gtemp, moves}, initial, k) =
    let
      fun pGraph(nil) = {simplifyList=nil, remainder=nil}
        | pGraph (node::t) =
        let
          val temp = node2temp(igraph, node)
          val deg = length(Graph.adj(node))
          val {simplifyList=simplifyList', remainder=remainder'} = pGraph(t)
          val isPreColored = case Temp.Table.look(initial, temp) of
                               SOME(_) => true | NONE => false
        in
          if isPreColored then {simplifyList=simplifyList', remainder=remainder'}
          else (if deg < k then {simplifyList=temp::simplifyList',
                                     remainder=remainder'}
                               else {simplifyList=simplifyList',
                                     remainder=temp::remainder'})
        end
    in
      pGraph(Graph.nodes(graph))
    end

  (*{interference, initial, registers} -> {stack}*)
  fun simplify{interference : Liveness.igraph, initial, registers} =
    let
      val k = length registers
      val degTab = buildDegreeTable(interference)
      val {simplifyList, remainder} = partitionGraph(interference, initial, k)

      (* If the simplifyList is empty and the 'remainder' list is empty, return the stack *)
      fun s(degTab, stack, nil, nil) = stack
      (* If the simplifylist is empty and there are nodes remaining, issue error *)
        | s(degTab, stack, nil, t::tt) = (raise ErrorMsg.Error; nil)
        | s(degTab, stack, h::t, remainder) =
            let
              fun updateRemainder(adjTemp, (degTab, remainder, simplifyList)) =
                let
                  val deg = getDegree(degTab, adjTemp)
                  val degTab' = setDegree(degTab, adjTemp, deg - 1)
                  val clause = (fn (el) => el = adjTemp)
                in
                  case List.find clause remainder of
                    SOME(el) => if deg - 1 < k
                                  then (degTab',
                                        List.filter (fn (n) => not(clause n)) remainder,
                                        el::simplifyList)
                                  else (degTab', remainder, simplifyList)
                  | NONE => (degTab', remainder, simplifyList)
                end
              val adj = map (fn (n) => node2temp(interference, n))
                            (Graph.adj(temp2node(interference, h)))
              val (degTab', remainder', t') = foldl updateRemainder (degTab, remainder, t) adj
            in
              s(degTab', h::stack, t, remainder')
            end
    in
      s(degTab, nil, simplifyList, remainder)
    end

  fun select(igraph, allocation, registers, nil) : allocation = allocation
    | select(igraph, allocation, registers, top::stack) =
        let
          val clause = (fn (n) => case n of SOME(_)=>true | _=> false)
          val adj = map (fn (n) => node2temp(igraph, n))
                        (Graph.adj(temp2node(igraph, top)))
          fun adjColors(nil) = nil
            | adjColors(tmp::t) = case Temp.Table.look(allocation, tmp) of
                                      SOME(x) => x::adjColors(t)
                                    | NONE => adjColors(t)
          val colors = adjColors(adj)
          fun colorAvailable(reg) = case List.find (fn (i) => i=reg) colors of
                                      SOME(_) => false | _ => true
          val availableColors = List.filter colorAvailable registers
        in
          case availableColors of
            nil => (raise ErrorMsg.Error; allocation)
          | x::xs => select(igraph,
                            Temp.Table.enter(allocation, top, x),
                            registers, stack)
        end


  fun color (a as {interference : Liveness.igraph, initial, registers}) =
    let
      val stack = simplify(a)
    in
      select(interference, initial : allocation, registers, stack)
    end

end (* functor RegAllocGen *)

