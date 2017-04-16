.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L24:
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
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	call chr
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl %ebx							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L22							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl $1, %eax							# move to register
	jmp L23							# jump to L23
L23:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L22:
	.long 1
	.byte 10, 0
L21:
	.long 1
	.byte 48, 0
