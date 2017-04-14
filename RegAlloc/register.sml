(* register.sml *)

signature REGISTER =
sig 
  include REGISTER_STD

  val ECX : Temp.temp
  val EDX : Temp.temp

 (* we maintain a separate list here of true callersaves, so that
  * CodeGen will not emit code to "save" the pseudo-registers, since
  * they already live on the stack.
  *)
  val truecallersaves : register list (* CodeGen use only! *)

  (* number of pseudo-registers: *)
  val NPSEUDOREGS : int  (* CodeGen use only! *)

  (* if you like, you can add other stuff here *)

  (* ... *)

end (* signature REGISTER *)


structure Register : REGISTER = 
struct

  type register = string

  val RV = Temp.newtemp()
  val FP = Temp.newtemp()

  val SP = Temp.newtemp()
  val EIP = Temp.newtemp()

  val ECX = Temp.newtemp()
  val EDX = Temp.newtemp()

  (* of course, none of the following should be empty list *)

  val NPSEUDOREGS = 20 (* change this to the proper value *)
  val localsBaseOffset : int = ((~4) * (NPSEUDOREGS + 1)) (* change this to the proper value *)
  val paramBaseOffset : int = 8  (* change this to the proper value *)

  (* esp, ebp *)
  val specialregs : (Temp.temp * register) list = [(EIP, "%eip"), (SP, "%esp"), (FP, "%ebp"), (RV, "%eax"), (ECX, "%ecx"), (EDX, "%edx")]
  val argregs : (Temp.temp * register) list = []
  val calleesaves : register list = ["%ebx", "%esi", "%edi"]
  val truecallersaves : register list = []
  fun preg(index) = "f" ^ Int.toString(index)
  val callersaves : register list = List.tabulate(NPSEUDOREGS, fn x => preg(x))

  (* ... other stuff ... *)


end (* structure Register *)

