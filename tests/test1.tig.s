#LABEL L39
#MOVE(
##TEMP T284,
##BINOP(PLUS,
###TEMP T256,
###CONST 404))
#MOVE(
##TEMP T281,
##BINOP(PLUS,
###CONST 10,
###CONST 1))
#MOVE(
##TEMP T282,
##CONST 0)
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T257,
####CONST 4)),
##TEMP T282)
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T257,
####CONST 0)),
##TEMP T281)
#MOVE(
##TEMP T280,
##CALL(
###NAME initArray,
####CONST 0,
####CONST 0,
####CONST 0,
####CONST 0))
#MOVE(
##MEM[4](
###TEMP T280),
##CONST 10)
#MOVE(
##MEM[4](
###TEMP T284),
##TEMP T280)
#EXP(
##MEM[4](
###BINOP(PLUS,
####TEMP T256,
####CONST 404)))
#MOVE(
##TEMP T283,
##NAME L37)
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T257,
####CONST 0)),
##TEMP T283)
#EXP(
##CALL(
###NAME print,
####CONST 0,
####CONST 0))
#MOVE(
##TEMP T255,
##CONST 1)
#JUMP(
##NAME L38)
#LABEL L38
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp
	movl %esp, %ebp
	subl $404, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L39:
	movl %ebp, %ebx							# move to register
	addl $404, %ebx							# add two registers
	movl $10, %ebx							# move to register
	addl $1, %ebx							# add two registers
	movl $0, %edi							# move to register
	movl %edi, 4(%esp)							# move to memory
	movl %ebx, 0(%esp)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call initArray
	addl $16, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
	movl %ebx, %ebx							# move to register
	movl $10, (%ebx)							# move to memory
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $L37, %ebx							# move to register
	movl %ebx, 0(%esp)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call print
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
	movl $1, %eax							# move to register
	jmp L38							# jump to L38
L38:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
L37:
	.long 4
	.byte 98, 111, 98, 10, 0
