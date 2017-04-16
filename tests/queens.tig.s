.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $420, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L39:
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
	pushl $0							# push onto stack
	pushl %ebp							# push onto stack
	call L1
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl $1, %eax							# move to register
	jmp L38							# jump to L38
L38:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
.globl L1
.type L1, @function
L1:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $408, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L41:
	movl $0, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	cmpl %edi, %ebx							# compare for jump...
	jle L17							# if true: jump to L17
	jmp L15							# if false: jump to L15
L15:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L19							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	call flush
	addl $0, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
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
	je L35							# if true: jump to L35
	jmp L36							# if false: jump to L36
L36:
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
	jle L33							# if true: jump to L33
	jmp L20							# if false: jump to L20
L20:
	movl $0, %ebx							# move to register
L37:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl $0, %ebx							# move constant to register
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
	movl $0, %ebx							# move constant to register
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
	movl $0, %eax							# move to register
	jmp L40							# jump to L40
L17:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L16							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	cmpl %edi, %ebx							# compare for jump...
	jge L15							# if true: jump to L15
	jmp L18							# if false: jump to L18
L18:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L17							# jump to L17
L35:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl 8(%ebp)							# push onto stack
	call L0
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	jmp L37							# jump to L37
L33:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -408(%ebp)							# push onto stack
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
	movl $-408, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
	je L21							# if true: jump to L21
	jmp L22							# if false: jump to L22
L22:
	movl $0, %ebx							# move to register
L23:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
	je L27							# if true: jump to L27
	jmp L26							# if false: jump to L26
L26:
	movl $1, %edi							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-408, %esi							# move constant to register
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
	movl $-408, %esi							# move constant to register
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
	je L29							# if true: jump to L29
	jmp L30							# if false: jump to L30
L30:
	movl $0, %edi							# move to register
L29:
	movl %edi, %ebx							# move to register
L28:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
	je L32							# if true: jump to L32
	jmp L31							# if false: jump to L31
L31:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -408(%ebp)							# push onto stack
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
	movl $-408, %esi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
	call L1
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -408(%ebp)							# push onto stack
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
	movl $-408, %esi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
	movl $-408, %edi							# move constant to register
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
L32:
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
	jge L20							# if true: jump to L20
	jmp L34							# if false: jump to L34
L34:
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -408(%ebp)							# move to memory
	jmp L33							# jump to L33
L21:
	movl $1, %edi							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-408, %esi							# move constant to register
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
	movl $-408, %esi							# move constant to register
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
	je L24							# if true: jump to L24
	jmp L25							# if false: jump to L25
L25:
	movl $0, %edi							# move to register
L24:
	movl %edi, %ebx							# move to register
	jmp L23							# jump to L23
L27:
	movl $0, %ebx							# move to register
	jmp L28							# jump to L28
L40:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L19:
	.long 1
	.byte 10, 0
L16:
	.long 1
	.byte 46, 0
.globl L0
.type L0, @function
L0:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $408, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L43:
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
	jle L12							# if true: jump to L12
	jmp L2							# if false: jump to L2
L2:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L14							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, %eax							# move to register
	jmp L42							# jump to L42
L12:
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
	jle L9							# if true: jump to L9
	jmp L3							# if false: jump to L3
L3:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L11							# push onto stack
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
	jge L2							# if true: jump to L2
	jmp L13							# if false: jump to L13
L13:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L12							# jump to L12
L9:
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
	je L6							# if true: jump to L6
	jmp L7							# if false: jump to L7
L7:
	movl $L5, %ebx							# move to register
L8:
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
	jge L3							# if true: jump to L3
	jmp L10							# if false: jump to L10
L10:
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -408(%ebp)							# move to memory
	jmp L9							# jump to L9
L6:
	movl $L4, %ebx							# move to register
	jmp L8							# jump to L8
L42:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L14:
	.long 1
	.byte 10, 0
L11:
	.long 1
	.byte 10, 0
L5:
	.long 2
	.byte 32, 46, 0
L4:
	.long 2
	.byte 32, 79, 0
