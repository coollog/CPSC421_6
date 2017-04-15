.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp
	movl %esp, %ebp
	subl $420, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L92:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $8, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $400, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %edi, %edi							# move to register
	movl $4, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %edi, (%esi)							# move to memory
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, (%ebx)							# move to memory
	movl %ebx, (%ebx)							# move to memory
	movl $396, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %edi, %edi							# move to register
	movl $4, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %edi, (%esi)							# move to memory
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, (%ebx)							# move to memory
	movl %ebx, (%ebx)							# move to memory
	movl $392, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %edi, %edi							# move to register
	movl $4, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %edi, (%esi)							# move to memory
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl %ebx, (%ebx)							# move to memory
	movl %ebx, (%ebx)							# move to memory
	movl $388, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %edi, %edi							# move to register
	movl $4, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %edi, (%esi)							# move to memory
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl %ebx, (%ebx)							# move to memory
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %edi, %edi							# move to register
	movl $4, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %edi, (%esi)							# move to memory
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	call L2
	addl $16, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
	movl $1, %ebx							# move constant to register
	movl %ebx, %eax							# move to register
	jmp L91							# jump to L91
L91:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
.globl L2
.type L2, @function
L2:
	pushl %ebp
	movl %esp, %ebp
	subl $404, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L94:
	movl $12, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
je L88							# if true: jump to L88
	jmp L89							# if false: jump to L89
L89:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $0, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	cmpl %ebx, %edi							# compare for jump...
jle L86							# if true: jump to L86
	jmp L22							# if false: jump to L22
L22:
	movl $0, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
L90:
	movl %ebx, %eax							# move to register
	jmp L93							# jump to L93
L88:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call L1
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
	movl %ebx, %ebx							# move to register
	jmp L90							# jump to L90
L86:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L24							# if true: jump to L24
	jmp L26							# if false: jump to L26
L26:
	mov $L28, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L27:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $400, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
je L34							# if true: jump to L34
	jmp L35							# if false: jump to L35
L35:
	movl $0, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
L36:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jne L44							# if true: jump to L44
	jmp L45							# if false: jump to L45
L45:
	movl $0, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
L46:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jne L84							# if true: jump to L84
	jmp L85							# if false: jump to L85
L85:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	cmpl %ebx, %edi							# compare for jump...
jge L22							# if true: jump to L22
	jmp L87							# if false: jump to L87
L87:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, (%ebx)							# move to memory
	jmp L86							# jump to L86
L24:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $400, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L26							# if true: jump to L26
	jmp L25							# if false: jump to L25
L25:
	jmp L27							# jump to L27
L34:
	movl $1, %ebx							# move constant to register
	movl %ebx, %edi							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
jge L29							# if true: jump to L29
	jmp L31							# if false: jump to L31
L31:
	mov $L33, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %ebx, (%esi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %ebx, (%esi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L32:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $392, %esi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	addl %edx, %esi							# add two registers
	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	addl %edx, %esi							# add two registers
	movl $4, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	imull %edx, %esi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
je L37							# if true: jump to L37
	jmp L38							# if false: jump to L38
L38:
	movl $0, %ebx							# move constant to register
	movl %ebx, %edi							# move to register
L37:
	movl %edi, %ebx							# move to register
	jmp L36							# jump to L36
L29:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl $8, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl $392, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	addl %edx, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl (%esi), %esi							# fetch from memory
	cmpl %ebx, %esi							# compare for jump...
jge L31							# if true: jump to L31
	jmp L30							# if false: jump to L30
L30:
	jmp L32							# jump to L32
L44:
	movl $1, %ebx							# move constant to register
	movl %ebx, %edi							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $7, %esi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %ebx, %ebx							# move to register
	subl %esi, %ebx							# subtract two registers
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
jge L39							# if true: jump to L39
	jmp L41							# if false: jump to L41
L41:
	mov $L43, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %ebx, (%esi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %ebx, (%esi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L42:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $388, %esi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl $7, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	addl %edx, %esi							# add two registers
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	subl %edx, %esi							# subtract two registers
	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	addl %edx, %esi							# add two registers
	movl $4, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	imull %edx, %esi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
je L47							# if true: jump to L47
	jmp L48							# if false: jump to L48
L48:
	movl $0, %ebx							# move constant to register
	movl %ebx, %edi							# move to register
L47:
	movl %edi, %ebx							# move to register
	jmp L46							# jump to L46
L39:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $7, %esi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %esi, %ebx							# add two registers
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %ebx, %ebx							# move to register
	subl %esi, %ebx							# subtract two registers
	movl $8, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl $388, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %esi, %esi							# move to register
	addl %edx, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl (%esi), %esi							# fetch from memory
	cmpl %ebx, %esi							# compare for jump...
jge L41							# if true: jump to L41
	jmp L40							# if false: jump to L40
L40:
	jmp L42							# jump to L42
L84:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L49							# if true: jump to L49
	jmp L51							# if false: jump to L51
L51:
	mov $L53, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L52:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $400, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L54							# if true: jump to L54
	jmp L56							# if false: jump to L56
L56:
	mov $L58, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L57:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $392, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $7, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L59							# if true: jump to L59
	jmp L61							# if false: jump to L61
L61:
	mov $L63, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L62:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $388, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $7, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $1, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $12, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L64							# if true: jump to L64
	jmp L66							# if false: jump to L66
L66:
	mov $L68, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L67:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $396, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, (%ebx)							# move to memory
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl %edi, %edi							# move to register
	movl $4, %esi							# move constant to register
	movl %esp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl %edi, (%esi)							# move to memory
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	call L2
	addl $16, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L69							# if true: jump to L69
	jmp L71							# if false: jump to L71
L71:
	mov $L73, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L72:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $400, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $0, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L74							# if true: jump to L74
	jmp L76							# if false: jump to L76
L76:
	mov $L78, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L77:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $392, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $0, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $7, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L79							# if true: jump to L79
	jmp L81							# if false: jump to L81
L81:
	mov $L83, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L82:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $388, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $7, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $12, %esi							# move constant to register
	movl %ebp, %esi							# move to register
	addl %esi, %esi							# add two registers
	movl (%esi), %esi							# fetch from memory
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $0, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	jmp L85							# jump to L85
L49:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $400, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L51							# if true: jump to L51
	jmp L50							# if false: jump to L50
L50:
	jmp L52							# jump to L52
L54:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $392, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L56							# if true: jump to L56
	jmp L55							# if false: jump to L55
L55:
	jmp L57							# jump to L57
L59:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $7, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $388, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L61							# if true: jump to L61
	jmp L60							# if false: jump to L60
L60:
	jmp L62							# jump to L62
L64:
	movl $12, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $396, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L66							# if true: jump to L66
	jmp L65							# if false: jump to L65
L65:
	jmp L67							# jump to L67
L69:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $400, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L71							# if true: jump to L71
	jmp L70							# if false: jump to L70
L70:
	jmp L72							# jump to L72
L74:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $392, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L76							# if true: jump to L76
	jmp L75							# if false: jump to L75
L75:
	jmp L77							# jump to L77
L79:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $7, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl $12, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebx, %ebx							# move to register
	subl %edi, %ebx							# subtract two registers
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $388, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L81							# if true: jump to L81
	jmp L80							# if false: jump to L80
L80:
	jmp L82							# jump to L82
L93:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
.globl L1
.type L1, @function
L1:
	pushl %ebp
	movl %esp, %ebp
	subl $408, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L96:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $0, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	cmpl %ebx, %edi							# compare for jump...
jle L19							# if true: jump to L19
	jmp L3							# if false: jump to L3
L3:
	mov $L21, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl %ebx, %ebx							# move to register
	movl %ebx, %eax							# move to register
	jmp L95							# jump to L95
L19:
	movl $400, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $0, %ebx							# move constant to register
	movl %ebx, (%ebx)							# move to memory
	movl $400, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	cmpl %ebx, %edi							# compare for jump...
jle L16							# if true: jump to L16
	jmp L4							# if false: jump to L4
L4:
	mov $L18, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl %ebx, %ebx							# move to register
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	cmpl %ebx, %edi							# compare for jump...
jge L3							# if true: jump to L3
	jmp L20							# if false: jump to L20
L20:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, (%ebx)							# move to memory
	jmp L19							# jump to L19
L16:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
jge L6							# if true: jump to L6
	jmp L8							# if false: jump to L8
L8:
	mov $L10, %ebx
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $1, %ebx							# move constant to register
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	movl $0, %ebx							# move constant to register
	pushl %ebx
	call exit
	addl $8, %esp
	movl %eax, %ebx
	popl %edx
	popl %ecx
	popl %eax
L9:
	movl $8, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $396, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $404, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl $4, %esi							# move constant to register
	movl %edi, %edi							# move to register
	imull %esi, %edi							# multiply two registers
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $400, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
je L13							# if true: jump to L13
	jmp L14							# if false: jump to L14
L14:
	mov $L12, %ebx
	movl %ebx, %ebx							# move to register
L15:
	movl %ebx, %ebx							# move to register
	movl $0, %edi							# move constant to register
	movl %esp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl %ebx, (%edi)							# move to memory
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
	movl $400, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $404, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $1, %esi							# move constant to register
	movl %edi, %edi							# move to register
	subl %esi, %edi							# subtract two registers
	cmpl %ebx, %edi							# compare for jump...
jge L4							# if true: jump to L4
	jmp L17							# if false: jump to L17
L17:
	movl $400, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl $400, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $1, %edi							# move constant to register
	movl %ebx, %ebx							# move to register
	addl %edi, %ebx							# add two registers
	movl %ebx, (%ebx)							# move to memory
	jmp L16							# jump to L16
L6:
	movl $404, %ebx							# move constant to register
	movl %ebp, %ebx							# move to register
	addl %ebx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl $8, %edi							# move constant to register
	movl %ebp, %edi							# move to register
	addl %edi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl $396, %esi							# move constant to register
	movl %edi, %edi							# move to register
	addl %esi, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl (%edi), %edi							# fetch from memory
	cmpl %ebx, %edi							# compare for jump...
jge L8							# if true: jump to L8
	jmp L7							# if false: jump to L7
L7:
	jmp L9							# jump to L9
L13:
	mov $L11, %ebx
	movl %ebx, %ebx							# move to register
	jmp L15							# jump to L15
L95:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
L83:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L78:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L73:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L68:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L63:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L58:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L53:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L43:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L33:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L28:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
L21:
	.long 1
	.byte 10, 0
L18:
	.long 1
	.byte 10, 0
L12:
	.long 2
	.byte 32, 46, 0
L11:
	.long 2
	.byte 32, 79, 0
L10:
	.long 21
	.byte 69, 114, 114, 111, 114, 58, 32, 111, 117, 116, 45, 111, 102, 45, 98, 111, 117, 110, 100, 115, 10, 0
