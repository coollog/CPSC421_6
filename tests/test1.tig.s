.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $216, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L1:
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl $5, %ebx                # move constant to register
	movl $100, (%edi, %ebx, 4)   # move to memory
	movl %ebp, %edi              # move to register
	movl $-208, %ebx             # move constant to register
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl $5, %edi                # move constant to register
	movl (%ebx, %edi, 4), %eax   # move to register
	jmp L0                     # jump to L0
L0:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
