.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $420, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L47:
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
	call L27
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl $1, %eax							# move to register
	jmp L46							# jump to L46
L46:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
.globl L27
.type L27, @function
L27:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L49:
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
	jle L43							# if true: jump to L43
	jmp L41							# if false: jump to L41
L41:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L45							# push onto stack
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
	movl %ebx, %ebx							# move to register
	movl %ebx, %eax							# move to register
	jmp L48							# jump to L48
L43:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L42							# push onto stack
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
	jge L41							# if true: jump to L41
	jmp L44							# if false: jump to L44
L44:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L43							# jump to L43
L48:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L45:
	.long 1
	.byte 10, 0
L42:
	.long 1
	.byte 46, 0
.globl L26
.type L26, @function
L26:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $408, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L51:
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
	jle L38							# if true: jump to L38
	jmp L28							# if false: jump to L28
L28:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L40							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, %eax							# move to register
	jmp L50							# jump to L50
L38:
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
	jle L35							# if true: jump to L35
	jmp L29							# if false: jump to L29
L29:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L37							# push onto stack
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
	jge L28							# if true: jump to L28
	jmp L39							# if false: jump to L39
L39:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L38							# jump to L38
L35:
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
	je L32							# if true: jump to L32
	jmp L33							# if false: jump to L33
L33:
	movl $L31, %ebx							# move to register
L34:
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
	jge L29							# if true: jump to L29
	jmp L36							# if false: jump to L36
L36:
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -408(%ebp)							# move to memory
	jmp L35							# jump to L35
L32:
	movl $L30, %ebx							# move to register
	jmp L34							# jump to L34
L50:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L40:
	.long 1
	.byte 10, 0
L37:
	.long 1
	.byte 10, 0
L31:
	.long 2
	.byte 32, 46, 0
L30:
	.long 2
	.byte 32, 79, 0
