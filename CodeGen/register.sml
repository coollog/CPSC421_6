(* register.sml *)

signature REGISTER =
sig
  include REGISTER_STD

  val EBX : Temp.temp
  val ECX : Temp.temp
  val EDX : Temp.temp
  val ESI : Temp.temp
  val EDI : Temp.temp

 (* we maintain a separate list here of true callersaves, so that
  * CodeGen will not emit code to "save" the pseudo-registers, since
  * they already live on the stack.
  *)
  val truecallersaves : register list (* CodeGen use only! *)

  (* number of pseudo-registers: *)
  val NPSEUDOREGS : int  (* CodeGen use only! *)

  (* if you like, you can add other stuff here *)
  val registers : register list

end (* signature REGISTER *)


structure Register : REGISTER =
struct

  type register = string

  val RV = Temp.newtemp()
  val FP = Temp.newtemp()

  val SP = Temp.newtemp()

  val EBX = Temp.newtemp()
  val ECX = Temp.newtemp()
  val EDX = Temp.newtemp()
  val ESI = Temp.newtemp()
  val EDI = Temp.newtemp()
  val EIP = Temp.newtemp()

  (* of course, none of the following should be empty list *)

  val NPSEUDOREGS = 100 (* change this to the proper value *)
  val localsBaseOffset : int = ~4 * (1 + NPSEUDOREGS) (* change this to the proper value *)
  val paramBaseOffset : int = 8  (* change this to the proper value *)

  val specialregs : (Temp.temp * register) list = [
    (RV, "%eax"),
    (FP, "%ebp"),
    (SP, "%esp"),
    (ECX, "%ecx"),
    (EDX, "%edx"),
    (EIP, "%eip"),
    (EBX, "%ebx"),
    (EDI, "%edi"),
    (ESI, "%esi")]
  val calleesaves : register list = ["%ebx", "%edi", "%esi"]
  val truecallersaves : register list = []
  val callersaves : register list = ["%eax", "%ecx", "%edx"]

  val pseudoregs: register list =
    List.tabulate(NPSEUDOREGS, fn i => "f" ^ Int.toString i)

  val registers: register list = calleesaves @ pseudoregs

end (* structure Register *)

