LABEL L5
MOVE(
 TEMP T139,
 BINOP(PLUS,
  TEMP T120,
  CONST ~104))
MOVE(
 TEMP T138,
 CALL(
  NAME initArray,
   CONST 10,
   CONST 0))
MOVE(
 MEM[4](
  TEMP T139),
 TEMP T138)
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T120,
   CONST ~104)))
MOVE(
 TEMP T119,
 CONST 1)
JUMP(
 NAME L4)
LABEL L4
.globl tigermain
.type tigermain, @function
tigermain:
pushl %ebp
movl %esp, %ebp
subl $104, %esp
pushl %ebx
pushl %edi
pushl %esi
L5:
movl $~104, %ecx							# move constant to register
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %edx # load pseudo-register
movl %ebp, %ecx							# move to register
addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %ecx # load pseudo-register
movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp) # save pseudo-register
pushl %eax
pushl %ecx
pushl %edx
movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %ecx # load pseudo-register
pushl %ecx
movl $10, %ecx							# move constant to register
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %ecx # load pseudo-register
pushl %ecx
call initArray
addl $8, %esp
movl %eax, %ecx
	movl	%ecx, -4(%ebp) # save pseudo-register
popl %edx
popl %ecx
popl %eax
	movl	-4(%ebp), %ecx # load pseudo-register
movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %ecx # load pseudo-register
movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp) # save pseudo-register
movl $~104, %ecx							# move constant to register
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %edx # load pseudo-register
movl %ebp, %ecx							# move to register
addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %ecx # load pseudo-register
movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp) # save pseudo-register
movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp) # save pseudo-register
	movl	-4(%ebp), %ecx # load pseudo-register
movl %ecx, %eax							# move to register
jmp L4							# jump to L4
L4:
popl %esi
popl %edi
popl %ebx
movl %ebp, %esp
popl %ebp
ret
