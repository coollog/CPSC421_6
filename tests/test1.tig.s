.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L9:
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
	movl %eax, %edi							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %edi, %edi							# move to register
	movl %edi, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $5							# push onto stack
	pushl -404(%ebp)							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl $5, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $100, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $5							# push onto stack
	pushl -404(%ebp)							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %edi							# move to register
	movl $-404, %ebx							# move constant to register
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl $5, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl %ebx, %eax							# move to register
	jmp L8							# jump to L8
L8:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
