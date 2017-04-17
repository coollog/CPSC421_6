.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $412, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L406:
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
	call L372
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
	call L372
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
	call L373
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
	call L375
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl $1, %eax                # move to register
	jmp L405                     # jump to L405
L405:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L375
.type L375, @function
L375:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L408:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L402                      # if true: jump to L402
	jmp L403                     # if false: jump to L403
L403:
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
	call L374
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L401                  # push onto stack
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
	call L375
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
L404:
	movl %ebx, %eax              # move to register
	jmp L407                     # jump to L407
L402:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L400                  # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	jmp L404                     # jump to L404
L407:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L401:
	.long 1
	.byte 32, 0
L400:
	.long 1
	.byte 10, 0
.globl L374
.type L374, @function
L374:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L410:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jl L397                      # if true: jump to L397
	jmp L398                     # if false: jump to L398
L398:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L394                      # if true: jump to L394
	jmp L395                     # if false: jump to L395
L395:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L393                  # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
L396:
	movl %ebx, %ebx              # move to register
L399:
	movl %ebx, %eax              # move to register
	jmp L409                     # jump to L409
L397:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L392                  # push onto stack
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
	call L388
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, %ebx              # move to register
	jmp L399                     # jump to L399
L394:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl 12(%ebp)               # push onto stack
	pushl %ebp                   # push onto stack
	call L388
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	jmp L396                     # jump to L396
L409:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L393:
	.long 1
	.byte 48, 0
L392:
	.long 1
	.byte 45, 0
.globl L388
.type L388, @function
L388:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L412:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L390                      # if true: jump to L390
	jmp L391                     # if false: jump to L391
L391:
	movl $0, %eax                # move to register
	jmp L411                     # jump to L411
L390:
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
	call L388
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
	pushl $L389                  # push onto stack
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
	pushl .globl L63
.type L63, @function
L63:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L87:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jg L65                      # if true: jump to L65
	jmp L66                     # if false: jump to L66
L66:
	movl $0, %eax                # move to register
	jmp L86                     # jump to L86
L65:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	movl %eax, %edi              # save %eax
	movl %edx, %ebx              # save %edx
               # save caller save
	movl %eax, %edi              # save %eax
	movl %edx, %ebx              # save %edx
	movl $0, %edx                # put 0 in %edx

	movl %ebp, %eax              # put divisor in %eax
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L414:
	movl %ebp, %ebx              # move to register
	movl $12, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L385                      # if true: jump to L385
	jmp L386                     # if false: jump to L386
L386:
	movl %ebp, %ebx              # move to register
	movl $16, %edi               # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L382                      # if true: jump to L382
	jmp L383                     # if false: jump to L383
L383:
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
	jl L379                      # if true: jump to L379
	jmp L380                     # if false: jump to L380
L380:
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
	call L373
	addl $12, %esp               # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
L381:
	movl %ebx, %ebx              # move to register
L384:
	movl %ebx, %ebx              # move to register
L387:
	movl %ebx, %eax              # move to register
	jmp L413                     # jump to L413
L385:
	movl 16(%ebp), %ebx          # move to register
	jmp L387                     # jump to L387
L382:
	movl 12(%ebp), %ebx          # move to register
	jmp L384                     # jump to L384
L379:
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
	call L373
	addl $12, %esp               # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebx, (%edi)            # move to memory
	movl	-4(%ebp), %ecx          # load pseudo-register
	movl %ecx, %ebx              # move to register
	jmp L381                     # jump to L381
L413:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L372
.type L372, @function
L372:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $408, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L416:
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
	call L350
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
	je L377                      # if true: jump to L377
	jmp L376                     # if false: jump to L376
L376:
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
	call L372
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %esi, %esi              # move to register
	movl %esi, (%ebx)            # move to memory
	movl %edi, %ebx              # move to register
L378:
	movl %ebx, %eax              # move to register
	jmp L415                     # jump to L415
L377:
	movl $0, %ebx                # move to register
	jmp L378                     # jump to L378
L415:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L350
.type L350, @function
L350:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $404, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L418:
	movl $0, -404(%ebp)          # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl %ebp                   # push onto stack
	call L352
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
	call L351
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
	call L351
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L369                      # if true: jump to L369
	jmp L371                     # if false: jump to L371
L371:
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
	pushl $L370                  # push onto stack
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
	call L351
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L371                     # if true: jump to L371
	jmp L369                     # if false: jump to L369
L369:
	movl -404(%ebp), %eax        # move to register
	jmp L417                     # jump to L417
L417:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L370:
	.long 1
	.byte 48, 0
.globl L352
.type L352, @function
L352:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L420:
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L360                  # push onto stack
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
	je L363                      # if true: jump to L363
	jmp L362                     # if false: jump to L362
L362:
	movl $1, %ebx                # move to register
L364:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L367                      # if true: jump to L367
	jmp L368                     # if false: jump to L368
L368:
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
	pushl $L360                  # push onto stack
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
	jne L362                     # if true: jump to L362
	jmp L363                     # if false: jump to L363
L363:
	movl $1, %edi                # move to register
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl $L361                  # push onto stack
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
	je L366                      # if true: jump to L366
	jmp L365                     # if false: jump to L365
L365:
	movl %edi, %ebx              # move to register
	jmp L364                     # jump to L364
L366:
	movl $0, %edi                # move to register
	jmp L365                     # jump to L365
L367:
	movl $0, %eax                # move to register
	jmp L419                     # jump to L419
L419:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L361:
	.long 1
	.byte 10, 0
L360:
	.long 1
	.byte 32, 0
.globl L351
.type L351, @function
L351:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $400, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L422:
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
	pushl $L353                  # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	cmpl %ebx, %edi              # compare for jump...
	jge L355                     # if true: jump to L355
	jmp L356                     # if false: jump to L356
L356:
	movl $0, %ebx                # move to register
L357:
	movl %ebx, %eax              # move to register
	jmp L421                     # jump to L421
L355:
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
	pushl $L354                  # push onto stack
	call ord
	addl $4, %esp                # pop arguments
	movl %eax, %esi              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %esi, %esi              # move to register
	cmpl %esi, %ebx              # compare for jump...
	jle L358                     # if true: jump to L358
	jmp L359                     # if false: jump to L359
L359:
	movl $0, %edi                # move to register
L358:
	movl %edi, %ebx              # move to register
	jmp L357                     # jump to L357
L421:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L354:
	.long 1
	.byte 57, 0
L353:
	.long 1
	.byte 48, 0
