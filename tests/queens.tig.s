.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp
	movl %esp, %ebp
	subl $420, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L186:
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call initArray
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~412, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call initArray
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call initArray
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call initArray
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	pushl %ebp
	call L153
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %eax							# move to register
	jmp L185							# jump to L185
L185:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
.globl L153
.type L153, @function
L153:
	pushl %ebp
	movl %esp, %ebp
	subl $404, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L188:
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L182							# if true: jump to L182
	jmp L183							# if false: jump to L183
L183:
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
jle L180							# if true: jump to L180
	jmp L167							# if false: jump to L167
L167:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

L184:
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %eax							# move to register
	jmp L187							# jump to L187
L182:
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call L152
	addl $4, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L184							# jump to L184
L180:
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L168							# if true: jump to L168
	jmp L169							# if false: jump to L169
L169:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

L170:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L174							# if true: jump to L174
	jmp L173							# if false: jump to L173
L173:
	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $7, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -8(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl $7, %ecx							# move constant to register
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-16(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L176							# if true: jump to L176
	jmp L177							# if false: jump to L177
L177:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

L176:
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

L175:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L179							# if true: jump to L179
	jmp L178							# if false: jump to L178
L178:
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $7, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $7, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~412, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~412, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call L153
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $7, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~420, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $7, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

L179:
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
jge L167							# if true: jump to L167
	jmp L181							# if false: jump to L181
L181:
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L180							# jump to L180
L168:
	movl $1, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -8(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~416, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl $12, %ecx							# move constant to register
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-16(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -16(%ebp)							# save pseudo-register

	movl	-12(%ebp), %ecx							# load pseudo-register
	movl	-16(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L171							# if true: jump to L171
	jmp L172							# if false: jump to L172
L172:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

L171:
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L170							# jump to L170
L174:
	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L175							# jump to L175
L187:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
.globl L152
.type L152, @function
L152:
	pushl %ebp
	movl %esp, %ebp
	subl $408, %esp
	pushl %ebx
	pushl %edi
	pushl %esi
L190:
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
jle L164							# if true: jump to L164
	jmp L154							# if false: jump to L154
L154:
	pushl %eax
	pushl %ecx
	pushl %edx
	mov $L166, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call print
	addl $4, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %eax							# move to register
	jmp L189							# jump to L189
L164:
	movl $~408, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $0, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
jle L161							# if true: jump to L161
	jmp L155							# if false: jump to L155
L155:
	pushl %eax
	pushl %ecx
	pushl %edx
	mov $L163, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call print
	addl $4, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
jge L154							# if true: jump to L154
	jmp L165							# if false: jump to L165
L165:
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L164							# jump to L164
L161:
	pushl %eax
	pushl %ecx
	pushl %edx
	movl $~404, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~412, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call checkArrayBounds
	addl $8, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $8, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~412, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $4, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	imull %edx, %ecx							# multiply two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
je L158							# if true: jump to L158
	jmp L159							# if false: jump to L159
L159:
	mov $L157, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

L160:
	pushl %eax
	pushl %ecx
	pushl %edx
	movl	-4(%ebp), %ecx							# load pseudo-register
	pushl %ecx
	call print
	addl $4, %esp
	movl %eax, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	popl %edx
	popl %ecx
	popl %eax
	movl $~408, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $8, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $~404, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -12(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	movl	-12(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	subl %edx, %ecx							# subtract two registers
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	cmpl %ecx, %edx							# compare for jump...
jge L155							# if true: jump to L155
	jmp L162							# if false: jump to L162
L162:
	movl $~408, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $~408, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %edx							# load pseudo-register
	movl %ebp, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ecx							# fetch from memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl $1, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl	-8(%ebp), %edx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	addl %edx, %ecx							# add two registers
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, (%ecx)							# move to memory
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L161							# jump to L161
L158:
	mov $L156, %ecx
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	movl %ecx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	jmp L160							# jump to L160
L189:
	popl %esi
	popl %edi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
L166:
	.long 1
	.byte 10, 0
L163:
	.long 1
	.byte 10, 0
L157:
	.long 2
	.byte 32, 46, 0
L156:
	.long 2
	.byte 32, 79, 0
