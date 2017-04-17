.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $132, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L107:
	movl $8, -104(%ebp)          # move to memory
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl $0                     # push onto stack
	pushl -104(%ebp)             # push onto stack
	call initArray
	addl $8, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-112, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl $0                     # push onto stack
	pushl -104(%ebp)             # push onto stack
	call initArray
	addl $8, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-116, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	pushl $0                     # push onto stack
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	addl %ebx, %edi              # add two registers
	movl %edi, %ebx              # move to register
	movl $1, %edi                # move constant to register
	subl %edi, %ebx              # subtract two registers
	pushl %ebx                   # push onto stack
	call initArray
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, (%esi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-120, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	pushl $0                     # push onto stack
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	addl %ebx, %edi              # add two registers
	movl %edi, %ebx              # move to register
	movl $1, %edi                # move constant to register
	subl %edi, %ebx              # subtract two registers
	pushl %ebx                   # push onto stack
	call initArray
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, (%esi)            # move to memory
	pushl $0                     # push onto stack
	pushl %ebp                   # push onto stack
	call L74
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $1, %eax                # move to register
	jmp L106                     # jump to L106
L106:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L74
.type L74, @function
L74:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $116, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L109:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	je L103                      # if true: jump to L103
	jmp L104                     # if false: jump to L104
L104:
	movl $0, -104(%ebp)          # move to memory
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	cmpl %ebx, %edi              # compare for jump...
	jle L101                     # if true: jump to L101
	jmp L88                     # if false: jump to L88
L88:
	movl $0, %ebx                # move to register
L105:
	movl %ebx, %eax              # move to register
	jmp L108                     # jump to L108
L103:
	pushl 8(%ebp)                # push onto stack
	call L73
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	jmp L105                     # jump to L105
L101:
	pushl -104(%ebp)             # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -108(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L89                      # if true: jump to L89
	jmp L90                     # if false: jump to L90
L90:
	movl $0, %ebx                # move to register
L91:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L95                      # if true: jump to L95
	jmp L94                     # if false: jump to L94
L94:
	movl $1, %edi                # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	subl %ebx, %esi              # subtract two registers
	pushl %esi                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -120(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-120, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl	-8(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	subl %ebx, %esi              # subtract two registers
	movl %esi, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	movl	-4(%ebp), %edx          # load pseudo-register
	addl %ebx, %edx              # add two registers
	movl	%edx, -4(%ebp)          # save pseudo-register
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl (%ecx), %ebx            # fetch from memory
	movl $0, %esi                # move constant to register
	cmpl %esi, %ebx              # compare for jump...
	je L97                      # if true: jump to L97
	jmp L98                     # if false: jump to L98
L98:
	movl $0, %edi                # move to register
L97:
	movl %edi, %ebx              # move to register
L96:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L100                      # if true: jump to L100
	jmp L99                     # if false: jump to L99
L99:
	pushl -104(%ebp)             # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -108(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $1, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	addl %ebx, %edi              # add two registers
	pushl %edi                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -116(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-116, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	addl %esi, %ebx              # add two registers
	movl $1, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	subl %ebx, %edi              # subtract two registers
	pushl %edi                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -120(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-120, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	subl %esi, %ebx              # subtract two registers
	movl $1, (%edi, %ebx, 4)     # move to memory
	pushl 12(%ebp)               # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -112(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-112, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebp, %esi              # move to register
	movl $-104, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	movl %esi, (%edi, %ebx, 4)   # move to memory
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	pushl %ebx                   # push onto stack
	pushl 8(%ebp)                # push onto stack
	call L74
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	pushl -104(%ebp)             # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -108(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	addl %ebx, %edi              # add two registers
	pushl %edi                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -116(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-116, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	addl %esi, %ebx              # add two registers
	movl $0, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	subl %ebx, %edi              # subtract two registers
	pushl %edi                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -120(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-120, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	subl %esi, %ebx              # subtract two registers
	movl $0, (%edi, %ebx, 4)     # move to memory
L100:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	cmpl %ebx, %edi              # compare for jump...
	jge L88                     # if true: jump to L88
	jmp L102                     # if false: jump to L102
L102:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -104(%ebp)        # move to memory
	jmp L101                     # jump to L101
L89:
	movl $1, %edi                # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	addl %ebx, %esi              # add two registers
	pushl %esi                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -116(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-116, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl	-8(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	addl %ebx, %esi              # add two registers
	movl %esi, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	movl	-4(%ebp), %edx          # load pseudo-register
	addl %ebx, %edx              # add two registers
	movl	%edx, -4(%ebp)          # save pseudo-register
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl (%ecx), %ebx            # fetch from memory
	movl $0, %esi                # move constant to register
	cmpl %esi, %ebx              # compare for jump...
	je L92                      # if true: jump to L92
	jmp L93                     # if false: jump to L93
L93:
	movl $0, %edi                # move to register
L92:
	movl %edi, %ebx              # move to register
	jmp L91                     # jump to L91
L95:
	movl $0, %ebx                # move to register
	jmp L96                     # jump to L96
L108:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L73
.type L73, @function
L73:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $120, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L111:
	movl $0, -104(%ebp)          # move to memory
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	cmpl %ebx, %edi              # compare for jump...
	jle L85                     # if true: jump to L85
	jmp L75                     # if false: jump to L75
L75:
	pushl $L87                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %eax              # move to register
	jmp L110                     # jump to L110
L85:
	movl $0, -108(%ebp)          # move to memory
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	cmpl %ebx, %edi              # compare for jump...
	jle L82                     # if true: jump to L82
	jmp L76                     # if false: jump to L76
L76:
	pushl $L84                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	cmpl %ebx, %edi              # compare for jump...
	jge L75                     # if true: jump to L75
	jmp L86                     # if false: jump to L86
L86:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -104(%ebp)        # move to memory
	jmp L85                     # jump to L85
L82:
	pushl -104(%ebp)             # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -112(%ebx)             # push onto stack
	call checkArrayBounds
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-112, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-108, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	je L79                      # if true: jump to L79
	jmp L80                     # if false: jump to L80
L80:
	movl $L78, %ebx              # move to register
L81:
	pushl %ebx                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	cmpl %ebx, %edi              # compare for jump...
	jge L76                     # if true: jump to L76
	jmp L83                     # if false: jump to L83
L83:
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -108(%ebp)        # move to memory
	jmp L82                     # jump to L82
L79:
	movl $L77, %ebx              # move to register
	jmp L81                     # jump to L81
L110:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L87:
	.long 1
	.byte 10, 0
L84:
	.long 1
	.byte 10, 0
L78:
	.long 2
	.byte 32, 46, 0
L77:
	.long 2
	.byte 32, 79, 0
