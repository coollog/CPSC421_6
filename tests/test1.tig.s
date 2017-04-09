LABEL L56
MOVE(
 TEMP T204,
 BINOP(PLUS,
  TEMP T101,
  CONST ~404))
MOVE(
 TEMP T203,
 CALL(
  NAME initArray,
   CONST 10,
   CONST 0))
MOVE(
 MEM[4](
  TEMP T204),
 TEMP T203)
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)))
JUMP(
 NAME L55)
LABEL L55
L56:
mov $~404, %t206
mov %t101, %t205
add %t206, %t205
mov %t205, %t204
push %eax
push %ecx
push %edx
mov $0, %t207
push %t207
mov $10, %t208
push %t208
call initArray
add $8, %esp
pop %edx
pop %ecx
pop %eax
mov %t100, %t203
mov (%t204), %t203
lea ~404(%t101), %t209
jmp L55
L55:
