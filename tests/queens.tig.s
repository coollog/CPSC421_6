.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $420, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L74:
	movl $8, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl -404(%ebp)							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl -404(%ebp)							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $1, %edi							# move constant to register
	subl %edi, %ebx							# subtract two registers
	pushl %ebx							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $1, %edi							# move constant to register
	subl %edi, %ebx							# subtract two registers
	pushl %ebx							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L72							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl %ebp							# push onto stack
	call L40
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl $1, %eax							# move to register
	jmp L73							# jump to L73
L73:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L72:
	.long 3
	.byte 104, 105, 10, 0
.globl L40
.type L40, @function
L40:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L76:
	movl %ebp, %ebx							# move to register
	movl $12, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	cmpl %edi, %ebx							# compare for jump...
	je L69							# if true: jump to L69
	jmp L70							# if false: jump to L70
L70:
	movl $0, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
	jle L67							# if true: jump to L67
	jmp L54							# if false: jump to L54
L54:
	movl $0, %ebx							# move to register
L71:
	movl %ebx, %eax							# move to register
	jmp L75							# jump to L75
L69:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl 8(%ebp)							# push onto stack
	call L39
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	jmp L71							# jump to L71
L67:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
	je L55							# if true: jump to L55
	jmp L56							# if false: jump to L56
L56:
	movl $0, %ebx							# move to register
L57:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
	je L61							# if true: jump to L61
	jmp L60							# if false: jump to L60
L60:
	movl $1, %edi							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %esi							# subtract two registers
	pushl %esi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %esi							# subtract two registers
	movl %esi, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	movl	-4(%ebp), %edx							# load pseudo-register
	addl %ebx, %edx							# add two registers
	movl	%edx, -4(%ebp)							# save pseudo-register
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ebx							# fetch from memory
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
	je L63							# if true: jump to L63
	jmp L64							# if false: jump to L64
L64:
	movl $0, %edi							# move to register
L63:
	movl %edi, %ebx							# move to register
L62:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
	je L66							# if true: jump to L66
	jmp L65							# if false: jump to L65
L65:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $1, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $1, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $1, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl 12(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %esi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	imull %ecx, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl %esi, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $12, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	pushl %ebx							# push onto stack
	pushl 8(%ebp)							# push onto stack
	call L40
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $0, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $0, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $0, %ebx							# move to memory
L66:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
	jge L54							# if true: jump to L54
	jmp L68							# if false: jump to L68
L68:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L67							# jump to L67
L55:
	movl $1, %edi							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %esi							# add two registers
	pushl %esi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %esi							# add two registers
	movl %esi, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	movl	-4(%ebp), %edx							# load pseudo-register
	addl %ebx, %edx							# add two registers
	movl	%edx, -4(%ebp)							# save pseudo-register
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ebx							# fetch from memory
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
	je L58							# if true: jump to L58
	jmp L59							# if false: jump to L59
L59:
	movl $0, %edi							# move to register
L58:
	movl %edi, %ebx							# move to register
	jmp L57							# jump to L57
L61:
	movl $0, %ebx							# move to register
	jmp L62							# jump to L62
L75:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
.globl L39
.type L39, @function
L39:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $408, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L78:
	movl $0, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
	jle L51							# if true: jump to L51
	jmp L41							# if false: jump to L41
L41:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L53							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, %eax							# move to register
	jmp L77							# jump to L77
L51:
	movl $0, -408(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
	jle L48							# if true: jump to L48
	jmp L42							# if false: jump to L42
L42:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L50							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
	jge L41							# if true: jump to L41
	jmp L52							# if false: jump to L52
L52:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L51							# jump to L51
L48:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $-408, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	cmpl %edi, %ebx							# compare for jump...
	je L45							# if true: jump to L45
	jmp L46							# if false: jump to L46
L46:
	movl $L44, %ebx							# move to register
L47:
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
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
	jge L42							# if true: jump to L42
	jmp L49							# if false: jump to L49
L49:
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -408(%ebp)							# move to memory
	jmp L48							# jump to L48
L45:
	movl $L43, %ebx							# move to register
	jmp L47							# jump to L47
L77:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L53:
	.long 1
	.byte 10, 0
L50:
	.long 1
	.byte 10, 0
L44:
	.long 2
	.byte 32, 46, 0
L43:
	.long 2
	.byte 32, 79, 0
