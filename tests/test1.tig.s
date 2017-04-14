LABEL L17
MOVE(
 TEMP T197,
 BINOP(PLUS,
  TEMP T101,
  CONST ~104))
MOVE(
 TEMP T196,
 CALL(
  NAME initArray,
   CONST 10,
   CONST 0))
MOVE(
 MEM[4](
  TEMP T197),
 TEMP T196)
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~104)))
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L16)
LABEL L16
.globl tigermain
.type tigermain, @function
tigermain:
pushl %ebp
movl %esp, %ebp
subl $104, %esp
pushl %ebx
pushl %edi
pushl %esi
L17:
movl $~104, %ebx							# move constant to register
movl %ebp, %ebx							# move to register
addl %ebx, %ebx							# add two registers
movl %ebx, %ebx							# move to register
pushl %eax
pushl %ecx
pushl %edx
movl $0, %ebx							# move constant to register
pushl %ebx
movl $10, %ebx							# move constant to register
pushl %ebx
call initArray
addl $8, %esp
movl %eax, %ebx
popl %edx
popl %ecx
popl %eax
movl %ebx, %ebx							# move to register
movl %ebx, (%ebx)							# move to memory
movl $~104, %ebx							# move constant to register
movl %ebp, %ebx							# move to register
addl %ebx, %ebx							# add two registers
movl (%ebx), %ebx							# fetch from memory
movl $1, %ebx							# move constant to register
movl %ebx, %eax							# move to register
jmp L16							# jump to L16
L16:
popl %esi
popl %edi
popl %ebx
movl %ebp, %esp
popl %ebp
ret
