(* tree.sml *)

signature TREE = sig

type size

datatype stm = SEQ of stm * stm
             | LABEL of Temp.label
             | JUMP of exp * Temp.label list
             | CJUMP of test * Temp.label * Temp.label
	           | MOVE of exp * exp
             | EXP of exp

     and exp = BINOP of binop * exp * exp
             | MEM of exp * size
             | TEMP of Temp.temp
             | ESEQ of stm * exp
             | NAME of Temp.label
             | CONST of int
	           | CALL of exp * exp list

     and test = TEST of relop * exp * exp

     and binop = PLUS | MINUS | MUL | DIV

     and relop = EQ | NE | LT | GT | LE | GE

val notRel : relop -> relop
val commute: relop -> relop

end (* signature TREE *)



structure Tree : TREE = struct

type label = Temp.label
type temp = Temp.temp
type size = int

datatype stm = SEQ of stm * stm
             | LABEL of label
             | JUMP of exp * label list
             | CJUMP of test * label * label
	           | MOVE of exp * exp
             | EXP of exp

     and exp = BINOP of binop * exp * exp
             | MEM of exp * size
             | TEMP of temp
             | ESEQ of stm * exp
             | NAME of label
             | CONST of int
	           | CALL of exp * exp list

     and test = TEST of relop * exp * exp

     and binop = PLUS | MINUS | MUL | DIV

     and relop = EQ | NE | LT | GT | LE | GE

fun notRel EQ = NE
  | notRel NE = EQ
  | notRel LT = GE
  | notRel GE = LT
  | notRel GT = LE
  | notRel LE =  GT

fun commute EQ = EQ
  | commute NE = NE
  | commute LT = GT
  | commute GE = LE
  | commute GT = LT
  | commute LE =  GE

end (* structure Tree *)

