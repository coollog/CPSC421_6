.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L1:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
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
	movl %ebp, %edi							# move to register
	movl $-404, %ebx							# move constant to register
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $1, %eax							# move to register
	jmp L0							# jump to L0
L0:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
