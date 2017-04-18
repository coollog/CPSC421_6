.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $132, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L34:
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
	call L1
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $1, %eax                # move to register
	jmp L33                     # jump to L33
L33:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L1
.type L1, @function
L1:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $116, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L36:
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
	je L30                      # if true: jump to L30
	jmp L31                     # if false: jump to L31
L31:
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
	jle L28                     # if true: jump to L28
	jmp L15                     # if false: jump to L15
L15:
	movl $0, %ebx                # move to register
L32:
	movl %ebx, %eax              # move to register
	jmp L35                     # jump to L35
L30:
	pushl 8(%ebp)                # push onto stack
	call L0
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	jmp L32                     # jump to L32
L28:
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
	je L16                      # if true: jump to L16
	jmp L17                     # if false: jump to L17
L17:
	movl $0, %ebx                # move to register
L18:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L22                      # if true: jump to L22
	jmp L21                     # if false: jump to L21
L21:
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
	je L24                      # if true: jump to L24
	jmp L25                     # if false: jump to L25
L25:
	movl $0, %edi                # move to register
L24:
	movl %edi, %ebx              # move to register
L23:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L27                      # if true: jump to L27
	jmp L26                     # if false: jump to L26
L26:
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
	call L1
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
L27:
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
	jge L15                     # if true: jump to L15
	jmp L29                     # if false: jump to L29
L29:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -104(%ebp)        # move to memory
	jmp L28                     # jump to L28
L16:
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
	je L19                      # if true: jump to L19
	jmp L20                     # if false: jump to L20
L20:
	movl $0, %edi                # move to register
L19:
	movl %edi, %ebx              # move to register
	jmp L18                     # jump to L18
L22:
	movl $0, %ebx                # move to register
	jmp L23                     # jump to L23
L35:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L0
.type L0, @function
L0:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $120, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L38:
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
	jle L12                     # if true: jump to L12
	jmp L2                     # if false: jump to L2
L2:
	pushl $L14                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %eax              # move to register
	jmp L37                     # jump to L37
L12:
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
	jle L9                     # if true: jump to L9
	jmp L3                     # if false: jump to L3
L3:
	pushl $L11                   # push onto stack
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
	jge L2                     # if true: jump to L2
	jmp L13                     # if false: jump to L13
L13:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -104(%ebp)        # move to memory
	jmp L12                     # jump to L12
L9:
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
	je L6                      # if true: jump to L6
	jmp L7                     # if false: jump to L7
L7:
	movl $L5, %ebx               # move to register
L8:
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
	jge L3                     # if true: jump to L3
	jmp L10                     # if false: jump to L10
L10:
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -108(%ebp)        # move to memory
	jmp L9                     # jump to L9
L6:
	movl $L4, %ebx               # move to register
	jmp L8                     # jump to L8
L37:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
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
