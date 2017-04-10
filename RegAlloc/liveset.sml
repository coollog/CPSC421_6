signature LIVESET =
sig
  type liveSet

  (* construct a live set from a temp list *)
  val construct : (Temp.temp list) -> liveSet

  (* empty set *)
  val empty : liveSet

  (* are two sets equal? *)
  val eq : (liveSet * liveSet) -> bool

  (* is temp a member ? *)
  val member : (Temp.temp * liveSet) -> bool

  (* return list of set members *)
  val members : (liveSet) -> Temp.temp list

  (* insert temp into set *)
  val insert : (Temp.temp * liveSet) -> liveSet

  (* set union *)
  val union : (liveSet * liveSet) -> liveSet

  (* set difference *)
  val diff : (liveSet * liveSet) -> liveSet

  (* simple test routine *)
  val test : unit -> bool
end

structure LiveSet : LIVESET =
struct
  type liveSet = unit Temp.Table.table * Temp.temp list

  val empty = (Temp.Table.empty, [])

  fun eq ((_, a) : liveSet, (_, b) : liveSet) =
  let 
    val a = ListMergeSort.sort (fn (x, y) => x > y) a
    val b = ListMergeSort.sort (fn (x, y) => x > y) b
  in
    (a = b)
  end

  fun member (temp, (t, lst)) = (
    case Temp.Table.look(t, temp)
      of SOME(x) => true
       | _ => false)

  fun members (_, lst) = lst

  fun insert (temp, (t, lst)) = (
    if member(temp, (t, lst)) then (t, lst)
    else (Temp.Table.enter(t, temp, ()), temp :: lst)
  )

  fun union (s, (t, lst)) = List.foldr insert s lst

  fun diff ((_, lst), b) = (
    List.foldr
    (fn (temp, s) =>
    if member(temp, b) then s
    else insert(temp, s))
    empty
    lst
  )

  fun construct (lst) = List.foldr insert empty lst

  (*
  * .test() should return true, as via
  *
  * - CM.make("sources.cm");
  * - LiveSet.test();
  * val it = true : bool
  *
  *)
  fun test () =
  let 
    val temps = [Temp.newtemp(), Temp.newtemp(), Temp.newtemp()]
    val tests = []

    (* test insert + member *)
    val s = List.foldr insert empty temps
    val tests = (List.all (fn x => member(x, s)) temps) :: tests
    val tests = (members(s) = temps) :: tests

    (* test equality operator *)
    val s' = List.foldl insert empty temps
    val tests = (eq(s, s')) :: tests

    (* test union + construct operations *)
    val moretemps = [Temp.newtemp(), Temp.newtemp()]
    val s = union(s, construct(moretemps))

    val tests = (List.all (fn x => member(x, s)) (temps @ moretemps)) :: tests
    val tests = (List.length(members(s)) = List.length(temps @ moretemps)) :: tests

    (* remove the first temps *)
    val s = diff(s, construct(temps))
    val tests = (List.all (fn x => member(x, s)) moretemps) :: tests
    val tests = (List.length(members(s)) = List.length(moretemps)) :: tests
  in
    List.all (fn x => x) tests
  end

end (* structure LiveSet *)

