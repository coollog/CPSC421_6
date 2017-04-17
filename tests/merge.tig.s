.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $412, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L56:
	movl %ebp, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-408, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl %ebp                   # push onto stack
	call L22
	addl $4, %esp                # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-412, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-404, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %esi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %esi, %esi              # move to register
	movl %esi, (%ebx)            # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl %ebp                   # push onto stack
	call L22
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl -412(%ebp)             # push onto stack
	pushl -408(%ebp)             # push onto stack
	pushl %ebp                   # push onto stack
	call L23
	addl $12, %esp               # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl %edi                   # push onto stack
	pushl %ebx                   # push onto stack
	call L25
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl $1, %eax                # move to register
	jmp L55                     # jump to L55
L55:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L25
.type L25, @function
L25:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L58:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L52                      # if true: jump to L52
	jmp L53                     # if false: jump to L53
L53:
	movl 8(%ebp), %edi           # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %esi                # move constant to register
	pushl (%ebx, %esi, 4)        # push onto stack
	pushl %edi                   # push onto stack
	call L24
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L51                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl 8(%ebp), %edi           # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $1, %esi                # move constant to register
	pushl (%ebx, %esi, 4)        # push onto stack
	pushl %edi                   # push onto stack
	call L25
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
L54:
	movl %ebx, %eax              # move to register
	jmp L57                     # jump to L57
L52:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L50                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	jmp L54                     # jump to L54
L57:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L51:
	.long 1
	.byte 32, 0
L50:
	.long 1
	.byte 10, 0
.globl L24
.type L24, @function
L24:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L60:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jl L47                      # if true: jump to L47
	jmp L48                     # if false: jump to L48
L48:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L44                      # if true: jump to L44
	jmp L45                     # if false: jump to L45
L45:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L43                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
L46:
	movl %ebx, %ebx              # move to register
L49:
	movl %ebx, %eax              # move to register
	jmp L59                     # jump to L59
L47:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L42                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl $0, %ebx                # move constant to register
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	subl %ebx, %edi              # subtract two registers
	pushl %edi                   # push onto stack
	pushl %ebp                   # push onto stack
	call L38
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
	jmp L49                     # jump to L49
L44:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	pushl %ebp                   # push onto stack
	call L38
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	jmp L46                     # jump to L46
L59:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L43:
	.long 1
	.byte 48, 0
L42:
	.long 1
	.byte 45, 0
.globl L38
.type L38, @function
L38:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L62:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L40                      # if true: jump to L40
	jmp L41                     # if false: jump to L41
L41:
	movl $0, %eax                # move to register
	jmp L61                     # jump to L61
L40:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %eax, %edi              # save %eax
	movl %edx, %esi              # save %edx
	movl $0, %edx                # put 0 in %edx

	movl 12(%ebp), %eax          # put divisor in %eax
	movl $10, %ebx               # move constant to register
	idiv %ebx                    # divide by register
	movl %eax, %ebx              # put quotient in result register
	movl %edi, %eax              # restore %eax
	movl %esi, %edx              # restore %edx
	pushl %ebx                   # push onto stack
	pushl 8(%ebp)                # push onto stack
	call L38
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %eax, %esi              # save %eax
	movl %edx, %ecx              # save %edx
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl $0, %edx                # put 0 in %edx

	movl 12(%ebp), %eax          # put divisor in %eax
	movl $10, %ebx               # move constant to register
	idiv %ebx                    # divide by register
	movl %eax, %ebx              # put quotient in result register
	movl %esi, %eax              # restore %eax
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %edx              # restore %edx
	movl %ebx, %ebx              # move to register
	movl $10, %esi               # move constant to register
	imull %esi, %ebx             # multiply two registers
	subl %ebx, %edi              # subtract two registers
	movl %edi, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L39                   # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebx, %ebx              # move to register
	addl %edi, %ebx              # add two registers
	pushl %ebx                   # push onto stack
	call chr
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl %ebx                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	jmp L41                     # jump to L41
L61:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L39:
	.long 1
	.byte 48, 0
.globl L23
.type L23, @function
L23:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L64:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L35                      # if true: jump to L35
	jmp L36                     # if false: jump to L36
L36:
	movl %ebp, %ebx              # move to register
	movl $16, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L32                      # if true: jump to L32
	jmp L33                     # if false: jump to L33
L33:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	movl (%ebx, %edi, 4), %esi   # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 16(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $16, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl $0, %ebx                # move constant to register
	movl %ebx, %ebx              # move to register
	movl $4, %ecx                # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	imull %ecx, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	cmpl %ebx, %esi              # compare for jump...
	jl L29                      # if true: jump to L29
	jmp L30                     # if false: jump to L30
L30:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 16(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $16, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl $0, %ebx                # move constant to register
	movl %ebx, %ebx              # move to register
	movl $4, %ecx                # move constant to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl	-8(%ebp), %ecx          # load pseudo-register
	imull %ecx, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl %ebx, (%esi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	movl $4, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl 8(%ebp), %ecx           # move to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl 12(%ebp), %esi          # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 16(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $16, %ecx               # move constant to register
	movl	%ecx, -12(%ebp)         # save pseudo-register

	movl	-12(%ebp), %ecx         # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $1, %ecx                # move constant to register
	movl	%ecx, -12(%ebp)         # save pseudo-register

	movl	-12(%ebp), %edx         # load pseudo-register
	pushl (%ebx, %edx, 4)        # push onto stack
	pushl %esi                   # push onto stack
	movl	-8(%ebp), %ecx          # load pseudo-register
	pushl %ecx                   # push onto stack
	call L23
	addl $12, %esp               # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
L31:
	movl %ebx, %ebx              # move to register
L34:
	movl %ebx, %ebx              # move to register
L37:
	movl %ebx, %eax              # move to register
	jmp L63                     # jump to L63
L35:
	movl 16(%ebp), %ebx          # move to register
	jmp L37                     # jump to L37
L32:
	movl 12(%ebp), %ebx          # move to register
	jmp L34                     # jump to L34
L29:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl $0, %ebx                # move constant to register
	movl %ebx, %ebx              # move to register
	movl $4, %ecx                # move constant to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl	-8(%ebp), %ecx          # load pseudo-register
	imull %ecx, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl %ebx, (%esi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	movl $4, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl 8(%ebp), %esi           # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 16(%ebp)               # push onto stack
	movl %ebp, %ebx              # move to register
	movl $12, %ecx               # move constant to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl	-8(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $1, %ecx                # move constant to register
	movl	%ecx, -8(%ebp)          # save pseudo-register

	movl	-8(%ebp), %edx          # load pseudo-register
	pushl (%ebx, %edx, 4)        # push onto stack
	pushl %esi                   # push onto stack
	call L23
	addl $12, %esp               # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	jmp L31                     # jump to L31
L63:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L22
.type L22, @function
L22:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $408, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L66:
	movl %ebp, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $4                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, 0(%ebx)             # move to memory
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-408, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl -404(%ebp)             # push onto stack
	pushl 8(%ebp)                # push onto stack
	call L0
	addl $8, %esp                # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl -404(%ebp)             # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl $0, %ebx                # move constant to register
	movl %ebx, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L27                      # if true: jump to L27
	jmp L26                     # if false: jump to L26
L26:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-408, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, 0(%edi)           # move to memory
	movl %edi, %ebx              # move to register
	movl $4, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 8(%ebp)                # push onto stack
	call L22
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %esi, %esi              # move to register
	movl %esi, (%ebx)            # move to memory
	movl %edi, %ebx              # move to register
L28:
	movl %ebx, %eax              # move to register
	jmp L65                     # jump to L65
L27:
	movl $0, %ebx                # move to register
	jmp L28                     # jump to L28
L65:
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
	subl $404, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L68:
	movl $0, -404(%ebp)          # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl %ebp                   # push onto stack
	call L2
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl $0, %ebx                # move constant to register
	movl %ebx, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl %edi, %edi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	pushl %ebp                   # push onto stack
	call L1
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	pushl %ebp                   # push onto stack
	call L1
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L19                      # if true: jump to L19
	jmp L21                     # if false: jump to L21
L21:
	movl %ebp, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-404, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $10, %esi               # move constant to register
	imull %esi, %ebx             # multiply two registers
	movl %ebx, %esi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $8, %ecx                # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl %esi, %ebx              # move to register
	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L20                   # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %esi, %esi              # move to register
	movl %ebx, %ebx              # move to register
	subl %esi, %ebx              # subtract two registers
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	pushl %ebp                   # push onto stack
	call L1
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L21                     # if true: jump to L21
	jmp L19                     # if false: jump to L19
L19:
	movl -404(%ebp), %eax        # move to register
	jmp L67                     # jump to L67
L67:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L20:
	.long 1
	.byte 48, 0
.globl L2
.type L2, @function
L2:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L70:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L10                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	call stringEqual
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L13                      # if true: jump to L13
	jmp L12                     # if false: jump to L12
L12:
	movl $1, %ebx                # move to register
L14:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L17                      # if true: jump to L17
	jmp L18                     # if false: jump to L18
L18:
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %edi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L10                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	call stringEqual
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L12                     # if true: jump to L12
	jmp L13                     # if false: jump to L13
L13:
	movl $1, %edi                # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L11                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	call stringEqual
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %esi                # move constant to register
	cmpl %esi, %ebx              # compare for jump...
	je L16                      # if true: jump to L16
	jmp L15                     # if false: jump to L15
L15:
	movl %edi, %ebx              # move to register
	jmp L14                     # jump to L14
L16:
	movl $0, %edi                # move to register
	jmp L15                     # jump to L15
L17:
	movl $0, %eax                # move to register
	jmp L69                     # jump to L69
L69:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L11:
	.long 1
	.byte 10, 0
L10:
	.long 1
	.byte 32, 0
.globl L1
.type L1, @function
L1:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L72:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, %edi              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L3                    # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	cmpl %ebx, %edi              # compare for jump...
	jge L5                     # if true: jump to L5
	jmp L6                     # if false: jump to L6
L6:
	movl $0, %ebx                # move to register
L7:
	movl %ebx, %eax              # move to register
	jmp L71                     # jump to L71
L5:
	movl $1, %edi                # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -404(%ebx)             # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L4                    # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %esi, %esi              # move to register
	cmpl %esi, %ebx              # compare for jump...
	jle L8                     # if true: jump to L8
	jmp L9                     # if false: jump to L9
L9:
	movl $0, %edi                # move to register
L8:
	movl %edi, %ebx              # move to register
	jmp L7                     # jump to L7
L71:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L4:
	.long 1
	.byte 57, 0
L3:
	.long 1
	.byte 48, 0
