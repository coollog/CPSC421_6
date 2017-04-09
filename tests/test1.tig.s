LABEL L2
MOVE(
 TEMP T109,
 BINOP(PLUS,
  TEMP T101,
  CONST ~404))
MOVE(
 TEMP T108,
 CALL(
  NAME initArray,
   CONST 10,
   CONST 0))
MOVE(
 MEM[4](
  TEMP T109),
 TEMP T108)
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)))
JUMP(
 NAME L1)
LABEL L1
L2:
mov $~404, %t111
mov %t101, %t110
add %t111, %t110
mov %t110, %t109
push %eax
push %ecx
push %edx
mov $0, %t112
push %t112
mov $10, %t113
push %t113
call initArray
add $8, %esp
pop %edx
pop %ecx
pop %eax
mov %t100, %t108
mov %t108, (%t109)
lea ~404(%t101), %t114
jmp L1
L1:
