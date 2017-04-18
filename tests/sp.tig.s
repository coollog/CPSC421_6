.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L1:
	movl $1, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -48(%ebp)         # save pseudo-register

	movl $2, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -44(%ebp)         # save pseudo-register

	movl $3, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -40(%ebp)         # save pseudo-register

	movl $4, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -36(%ebp)         # save pseudo-register

	movl $5, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -32(%ebp)         # save pseudo-register

	movl $6, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -28(%ebp)         # save pseudo-register

	movl $7, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -24(%ebp)         # save pseudo-register

	movl $8, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -20(%ebp)         # save pseudo-register

	movl $9, %ebx                # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -16(%ebp)         # save pseudo-register

	movl $10, %ebx               # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -12(%ebp)         # save pseudo-register

	movl $11, %ebx               # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl $12, %ebx               # move constant to register
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl $13, %ebx               # move constant to register
	movl %ebx, %esi              # move to register
	movl $14, %ebx               # move constant to register
	movl %ebx, %edi              # move to register
	movl $15, %ebx               # move constant to register
	movl %ebx, %ebx              # move to register
	movl $16, %ecx               # move constant to register
	movl	%ecx, -52(%ebp)         # save pseudo-register

	movl	-52(%ebp), %ecx         # load pseudo-register
	addl %ecx, %ebx              # add two registers
	addl %ebx, %edi              # add two registers
	addl %edi, %esi              # add two registers
	movl	-4(%ebp), %edx          # load pseudo-register
	addl %esi, %edx              # add two registers
	movl	%edx, -4(%ebp)          # save pseudo-register
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl	-8(%ebp), %edx          # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -8(%ebp)          # save pseudo-register
	movl	-8(%ebp), %ecx          # load pseudo-register
	movl	-12(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -12(%ebp)         # save pseudo-register
	movl	-12(%ebp), %ecx         # load pseudo-register
	movl	-16(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -16(%ebp)         # save pseudo-register
	movl	-16(%ebp), %ecx         # load pseudo-register
	movl	-20(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -20(%ebp)         # save pseudo-register
	movl	-20(%ebp), %ecx         # load pseudo-register
	movl	-24(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -24(%ebp)         # save pseudo-register
	movl	-24(%ebp), %ecx         # load pseudo-register
	movl	-28(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -28(%ebp)         # save pseudo-register
	movl	-28(%ebp), %ecx         # load pseudo-register
	movl	-32(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -32(%ebp)         # save pseudo-register
	movl	-32(%ebp), %ecx         # load pseudo-register
	movl	-36(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -36(%ebp)         # save pseudo-register
	movl	-36(%ebp), %ecx         # load pseudo-register
	movl	-40(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -40(%ebp)         # save pseudo-register
	movl	-40(%ebp), %ecx         # load pseudo-register
	movl	-44(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -44(%ebp)         # save pseudo-register
	movl	-44(%ebp), %ecx         # load pseudo-register
	movl	-48(%ebp), %edx         # load pseudo-register
	addl %ecx, %edx              # add two registers
	movl	%edx, -48(%ebp)         # save pseudo-register
	movl $1, %eax                # move to register
	jmp L0                     # jump to L0
L0:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
