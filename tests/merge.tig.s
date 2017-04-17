.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $112, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L129:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl %ebp                   # push onto stack
	call L95
	addl $4, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-112, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %esi              # get return value
	movl %esi, %esi              # move to register
	movl %esi, (%ebx)            # move to memory
	pushl %ebp                   # push onto stack
	call L95
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	pushl -112(%ebp)             # push onto stack
	pushl -108(%ebp)             # push onto stack
	pushl %ebp                   # push onto stack
	call L96
	addl $12, %esp               # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	pushl %edi                   # push onto stack
	pushl %ebx                   # push onto stack
	call L98
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $1, %eax                # move to register
	jmp L128                     # jump to L128
L128:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L98
.type L98, @function
L98:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $100, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L131:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L125                      # if true: jump to L125
	jmp L126                     # if false: jump to L126
L126:
	movl 8(%ebp), %edi           # move to register
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %esi                # move constant to register
	pushl (%ebx, %esi, 4)        # push onto stack
	pushl %edi                   # push onto stack
	call L97
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	pushl $L124                  # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl 8(%ebp), %edi           # move to register
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $1, %esi                # move constant to register
	pushl (%ebx, %esi, 4)        # push onto stack
	pushl %edi                   # push onto stack
	call L98
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
L127:
	movl %ebx, %eax              # move to register
	jmp L130                     # jump to L130
L125:
	pushl $L123                  # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	jmp L127                     # jump to L127
L130:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L124:
	.long 1
	.byte 32, 0
L123:
	.long 1
	.byte 10, 0
.globl L97
.type L97, @function
L97:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $100, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L133:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jl L120                      # if true: jump to L120
	jmp L121                     # if false: jump to L121
L121:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L117                      # if true: jump to L117
	jmp L118                     # if false: jump to L118
L118:
	pushl $L116                  # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
L119:
	movl %ebx, %ebx              # move to register
L122:
	movl %ebx, %eax              # move to register
	jmp L132                     # jump to L132
L120:
	pushl $L115                  # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $0, %ebx                # move constant to register
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $12, %esi               # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	subl %ebx, %edi              # subtract two registers
	pushl %edi                   # push onto stack
	pushl %ebp                   # push onto stack
	call L111
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
	jmp L122                     # jump to L122
L117:
	pushl 12(%ebp)               # push onto stack
	pushl %ebp                   # push onto stack
	call L111
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	jmp L119                     # jump to L119
L132:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L116:
	.long 1
	.byte 48, 0
L115:
	.long 1
	.byte 45, 0
.globl L111
.type L111, @function
L111:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $100, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L135:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L113                      # if true: jump to L113
	jmp L114                     # if false: jump to L114
L114:
	movl $0, %eax                # move to register
	jmp L134                     # jump to L134
L113:
	movl $0, %edx                # put 0 in %edx

	movl 12(%ebp), %eax          # put divisor in %eax
	movl $10, %ebx               # move constant to register
	idiv %ebx                    # divide by register
	movl %eax, %ebx              # put quotient in result register
	pushl %ebx                   # push onto stack
	pushl 8(%ebp)                # push onto stack
	call L111
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl $0, %edx                # put 0 in %edx

	movl 12(%ebp), %eax          # put divisor in %eax
	movl $10, %ebx               # move constant to register
	idiv %ebx                    # divide by register
	movl %eax, %ebx              # put quotient in result register
	movl %ebx, %ebx              # move to register
	movl $10, %esi               # move constant to register
	imull %esi, %ebx             # multiply two registers
	subl %ebx, %edi              # subtract two registers
	movl %edi, %ebx              # move to register
	pushl $L112                  # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %ebx, %ebx              # move to register
	addl %edi, %ebx              # add two registers
	pushl %ebx                   # push onto stack
	call chr
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	pushl %ebx                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	jmp L114                     # jump to L114
L134:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L112:
	.long 1
	.byte 48, 0
.globl L96
.type L96, @function
L96:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $100, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L137:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L108                      # if true: jump to L108
	jmp L109                     # if false: jump to L109
L109:
	movl %ebp, %ebx              # move to register
	movl $16, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L105                      # if true: jump to L105
	jmp L106                     # if false: jump to L106
L106:
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	movl (%ebx, %edi, 4), %esi   # move to register
	pushl 16(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
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
	jl L102                      # if true: jump to L102
	jmp L103                     # if false: jump to L103
L103:
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	pushl 16(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
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
	pushl 16(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
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
	call L96
	addl $12, %esp               # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
L104:
	movl %ebx, %ebx              # move to register
L107:
	movl %ebx, %ebx              # move to register
L110:
	movl %ebx, %eax              # move to register
	jmp L136                     # jump to L136
L108:
	movl 16(%ebp), %ebx          # move to register
	jmp L110                     # jump to L110
L105:
	movl 12(%ebp), %ebx          # move to register
	jmp L107                     # jump to L107
L102:
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
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
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
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
	call L96
	addl $12, %esp               # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	jmp L104                     # jump to L104
L136:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L95
.type L95, @function
L95:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $108, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L139:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	pushl $4                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $0, 0(%ebx)             # move to memory
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-108, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl -104(%ebp)             # push onto stack
	pushl 8(%ebp)                # push onto stack
	call L73
	addl $8, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	pushl -104(%ebp)             # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
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
	je L100                      # if true: jump to L100
	jmp L99                     # if false: jump to L99
L99:
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-108, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, 0(%edi)           # move to memory
	movl %edi, %ebx              # move to register
	movl $4, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl 8(%ebp)                # push onto stack
	call L95
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	movl %esi, %esi              # move to register
	movl %esi, (%ebx)            # move to memory
	movl %edi, %ebx              # move to register
L101:
	movl %ebx, %eax              # move to register
	jmp L138                     # jump to L138
L100:
	movl $0, %ebx                # move to register
	jmp L101                     # jump to L101
L138:
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
	subl $104, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L141:
	movl $0, -104(%ebp)          # move to memory
	pushl %ebp                   # push onto stack
	call L75
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	pushl 12(%ebp)               # push onto stack
	call checkNilRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
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
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	pushl %ebp                   # push onto stack
	call L74
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	pushl %ebp                   # push onto stack
	call L74
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L92                      # if true: jump to L92
	jmp L94                     # if false: jump to L94
L94:
	movl %ebp, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-104, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $10, %esi               # move constant to register
	imull %esi, %ebx             # multiply two registers
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $8, %ecx                # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl %esi, %ebx              # move to register
	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	pushl $L93                   # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	movl %esi, %esi              # move to register
	movl %ebx, %ebx              # move to register
	subl %esi, %ebx              # subtract two registers
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	pushl %ebp                   # push onto stack
	call L74
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L94                     # if true: jump to L94
	jmp L92                     # if false: jump to L92
L92:
	movl -104(%ebp), %eax        # move to register
	jmp L140                     # jump to L140
L140:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L93:
	.long 1
	.byte 48, 0
.globl L75
.type L75, @function
L75:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $100, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L143:
	pushl $L83                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	call stringEqual
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L86                      # if true: jump to L86
	jmp L85                     # if false: jump to L85
L85:
	movl $1, %ebx                # move to register
L87:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L90                      # if true: jump to L90
	jmp L91                     # if false: jump to L91
L91:
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-104, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	call getch
	addl $0, %esp                # pop arguments
	movl %eax, %edi              # get return value
	movl %edi, %edi              # move to register
	movl %edi, (%ebx)            # move to memory
	pushl $L83                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	call stringEqual
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L85                     # if true: jump to L85
	jmp L86                     # if false: jump to L86
L86:
	movl $1, %edi                # move to register
	pushl $L84                   # push onto stack
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	call stringEqual
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $0, %esi                # move constant to register
	cmpl %esi, %ebx              # compare for jump...
	je L89                      # if true: jump to L89
	jmp L88                     # if false: jump to L88
L88:
	movl %edi, %ebx              # move to register
	jmp L87                     # jump to L87
L89:
	movl $0, %edi                # move to register
	jmp L88                     # jump to L88
L90:
	movl $0, %eax                # move to register
	jmp L142                     # jump to L142
L142:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L84:
	.long 1
	.byte 10, 0
L83:
	.long 1
	.byte 32, 0
.globl L74
.type L74, @function
L74:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $100, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L145:
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %edi              # move to register
	pushl $L76                   # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	cmpl %ebx, %edi              # compare for jump...
	jge L78                     # if true: jump to L78
	jmp L79                     # if false: jump to L79
L79:
	movl $0, %ebx                # move to register
L80:
	movl %ebx, %eax              # move to register
	jmp L144                     # jump to L144
L78:
	movl $1, %edi                # move to register
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl -104(%ebx)             # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
	pushl $L77                   # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	movl %esi, %esi              # move to register
	cmpl %esi, %ebx              # compare for jump...
	jle L81                     # if true: jump to L81
	jmp L82                     # if false: jump to L82
L82:
	movl $0, %edi                # move to register
L81:
	movl %edi, %ebx              # move to register
	jmp L80                     # jump to L80
L144:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L77:
	.long 1
	.byte 57, 0
L76:
	.long 1
	.byte 48, 0
