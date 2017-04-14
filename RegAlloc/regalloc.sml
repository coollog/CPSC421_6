(* regalloc.sml *)

signature REG_ALLOC =
sig
   structure R : REGISTER_STD
   
   type allocation = Register.register Temp.Table.table

   (* The color function takes an initial allocation table (which assigns
    *  temporary variables such as FP or SP into certain fixed registers)
    *  plus an interference graph and a list of registers, and returns
    *  a new allocation table (mapping from temporaries to registers).
    *)
   val color : {interference : Liveness.igraph,
                initial : allocation,
                registers : R.register list} -> allocation

end (* signature REG_ALLOC *)

functor RegAllocGen(Register : REGISTER_STD) : REG_ALLOC =
struct
   structure R : REGISTER_STD = Register

   type allocation = R.register Temp.Table.table

  (* The following few functions are just utility functions meant to 
   * make code more readable and easier to follow.
   *)

  (* Graph.adj returns a list of nodes that are adjacent to a node. However, the
   * list does not contain unique values. This function gets rid of duplicated
   * values. This does not seem like a big deal since we are not implementing
   * spilling, but in generality the algorithm chooses nodes of insignificant
   * degree so we musn't count directed edges double.
   *)
  fun removeDuplicatesFromAdjList(nil) = nil
    | removeDuplicatesFromAdjList(x::xs) = 
      x::(
        removeDuplicatesFromAdjList(
          List.filter (fn y => 
            Graph.nodename(x) <> Graph.nodename(y)) xs))
    
  (*
   *  listContains -> returns true if "list" contains "elt" and false
   *  otherwise
   *)
   fun listContains(list, elt) =
     List.exists (fn(e) => (e = elt)) list

   (*
    * Returns true if table[key] exists and false otherwise
    *)
   fun tempTableContains(table, key) =
     let
       val value = Temp.Table.look(table, key)
     in
       case value 
         of SOME (x) => true
          | NONE => false
     end

   (*
    * Returns table[key] or raises  exception if that does not exist
    *) 
   fun getFromGraphTable(table, key) =
     let
       val value = Graph.Table.look(table, key)
     in
       case value
         of SOME (x) => x
          | NONE =>
              ErrorMsg.impossible ("node not found in table")
     end

   (*
    * Returns table[key] or raises  exception if that does not exist
    *) 
   fun getFromTempTable(table, key) =
     let
       val value = Temp.Table.look(table, key)
     in
       case value
         of SOME (x) => x
          | NONE =>
              ErrorMsg.impossible ("temp not found in table")
     end

   fun color {
     interference = Liveness.IGRAPH{graph, tnode, gtemp, moves}, 
     initial,
     registers } = 
    let
      (* Syntactic sugar to make it easier to get the number of registers *)
      val regNum = length(registers)  
      (* A mapping providing the current degree of the tmpNode. Notice that
       * those values change as we simplify nodes. 
       *)
      val nodeOrderMap = 
        foldr 
        (fn(n, map) => 
          Graph.Table.enter(map, n, length(removeDuplicatesFromAdjList(Graph.adj(n)))))
        Graph.Table.empty
        (Graph.nodes(graph))

      (* A node may be simplified if it is not a part of the pre-allocation
      * and if it has low enough degree (insignificant degree) *)
      fun nodeMayBeSimplified(tempNode) =
        not(
          tempTableContains(initial, getFromGraphTable(gtemp, tempNode)))
        andalso
          getFromGraphTable(nodeOrderMap, tempNode) < regNum

      (* Simplification of a node means decrease in the degree of all 
      * its neighbors. This function does the decreasing. *)
      fun simplifyNode(tempNode) = 
        let
          fun decrementForNode (adjNode) =
            let
              val currVal = getFromGraphTable(nodeOrderMap, adjNode)
            in
              Graph.Table.enter(nodeOrderMap, adjNode, currVal - 1)
            end
        in
          map decrementForNode (Graph.adj(tempNode))
        end

      (* simplifyRound simplifies a node within a round. A round of
       * simplification is just the foldr of this function across
       * the pair (leftNodes, simplifiedNodes)
       *)
      fun simplifyRound(tempNode, (leftNodes, simplifiedNodes)) =
        if 
          nodeMayBeSimplified(tempNode)
        then
          (simplifyNode(tempNode);
           (leftNodes, tempNode :: simplifiedNodes))
        else
          (tempNode::leftNodes, simplifiedNodes)
        
      (* Applies simplifyRound to nodes within simplified until
      * all of the nodes have been simplified. Notice that some
      * nodes MAY be marked for "spilling," even though we don't support
      * spilling. When actual spilling in the select phase happens 
      * we raise an exception 
      *
      * NOTE: the unsimplified array SHOULD NOT contain nodes that 
      * have been assigned a register (are within initial). That is because
      * it does not make sense to attempt to assign a new register to them.
      * *)
      fun simplify(unsimplified, simplified) =
        let
          val (unsimplified, simplified) = 
            foldr
              simplifyRound
              ([], [])
              unsimplified

          fun existsUnsimplifiedLeft (tempNodes) =
            List.exists 
              (fn(node) => nodeMayBeSimplified(node)) 
              tempNodes
        in
          (* Continue until there are no nodes that may be simplified
          * without "picking for spillin"*)
          if existsUnsimplifiedLeft (unsimplified)
          then
            simplify(unsimplified, simplified)
          else 
            (* We pick for spilling if we have something to pick from *)
            if (length(unsimplified) > 0)
            then
              (simplifyNode(hd(unsimplified));
               simplify(tl(unsimplified), hd(unsimplified)::simplified))
            else
              (* Otherwise we are done *)
              (unsimplified, simplified)
        end
    
      (* Get an unused color to color a node *)
      fun getUnusedColor(tempNode, assignment) =
        let
          val adjNodes = Graph.adj(tempNode)
          fun removeFromList(list, elt) = 
            List.filter (fn(n) => elt <> n) list

          val unusedColors = 
            foldr
              (fn(node, remColors) =>
                let
                  val temp = getFromGraphTable(gtemp, node)
                in
                  if tempTableContains(assignment, temp)
                  then
                    removeFromList(
                      remColors, 
                      getFromTempTable(assignment, temp))
                  else
                    remColors
                end)
              registers
              adjNodes

        in
          if length(unusedColors) < 1
          then
            ErrorMsg.impossible("Not enough colors!")
          else
            List.nth(unusedColors, 0)
        end

      (* The select part is simple: assign colors one by one until 
      * all nodes have been colored.*)
      fun select(nodesToColor) =
        let
          fun colorNode(node, assignment) =
            let
              val colorToUse = getUnusedColor(node, assignment)
              val temp = getFromGraphTable(gtemp, node)
              val assignment = Temp.Table.enter(assignment, temp, colorToUse) 
            in
              assignment
            end
        in
          foldr colorNode initial nodesToColor
        end

      (* Nodes to consider are those NOT within the initial mapping. *)
      val nodesToConsider = 
        List.filter
          (fn(node) => 
            (not(tempTableContains(
              initial, getFromGraphTable(gtemp, node))))) 
          (Graph.nodes(graph))

      val (_, simplified) = simplify(nodesToConsider, [])
    in
      select(simplified)
    end

end (* functor RegAllocGen *)
