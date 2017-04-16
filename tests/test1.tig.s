LABEL L20
MOVE(
 TEMP T152,
 BINOP(PLUS,
  TEMP T101,
  CONST ~404))
MOVE(
 TEMP T151,
 CALL(
  NAME initArray,
   CONST 10,
   CONST 0))
MOVE(
 MEM[4](
  TEMP T152),
 TEMP T151)
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)))
EXP(
 CALL(
  NAME print,
   NAME L18))
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L19)
LABEL L19
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L20:
	movl %ebp, %ebx							# move to register
	addl $~404, %ebx							# add two registers
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl $10							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl $~404, %ebx							# move constant to register
	movl %ebp, %edi							# move to register
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L18							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl $1, %eax							# move to register
	jmp L19							# jump to L19
L19:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L18:
	.long 4
	.byte 98, 111, 98, 10, 0
