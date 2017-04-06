(* register.sml *)

signature REGISTER =
sig
  include REGISTER_STD

  val ECX : Temp.temp
  val EDX : Temp.temp

  val ZERO : Temp.temp
  val RA : Temp.temp

 (* we maintain a separate list here of true callersaves, so that
  * CodeGen will not emit code to "save" the pseudo-registers, since
  * they already live on the stack.
  *)
  val truecallersaves : register list (* CodeGen use only! *)
  val argregs : (Temp.temp * register) list

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

  val ECX = Temp.newtemp()
  val EDX = Temp.newtemp()

  val ZERO = Temp.newtemp()
  val RA = Temp.newtemp()

  (* of course, none of the following should be empty list *)

  val NPSEUDOREGS = 0 (* change this to the proper value *)
  val localsBaseOffset : int = 0 (* change this to the proper value *)
  val paramBaseOffset : int = 0  (* change this to the proper value *)

  val specialregs : (Temp.temp * register) list = [
    (RV, "r??"),
    (FP, "r??"),
    (SP, "r??"),
    (ECX, "ecx"),
    (EDX, "edx"),
    (RA, ""),
    (ZERO, "")]
  val argregs : (Temp.temp * register) list = []
  val calleesaves : register list = ["ebx", "edi", "esi"]
  val truecallersaves : register list = ["eax", "ecx", "edx"]
  val callersaves : register list = ["eax", "ecx", "edx"]

  (* ... other stuff ... *)


end (* structure Register *)

