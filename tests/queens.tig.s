.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $524, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L6410:
	pushl $0                     # push onto stack
	pushl %ebp                   # push onto stack
	call try
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $1, %eax                # move to register
	jmp L6409                     # jump to L6409
L6409:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L4569
.type L4569, @function
L4569:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L6412:
	movl %ebp, %ebx              # move to register
	movl $-492, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-208, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	je L6406                      # if true: jump to L6406
	jmp L6407                     # if false: jump to L6407
L6407:
L6404:
	movl %ebp, %ebx              # move to register
	movl $-512, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-516, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	jle L6405                     # if true: jump to L6405
	jmp L6339                     # if false: jump to L6339
L6339:
	movl $0, %ebx                # move to register
L6408:
	movl %ebx, %eax              # move to register
	jmp L6411                     # jump to L6411
L6406:
	pushl %ebp                   # push onto stack
	call printboard
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	jmp L6408                     # jump to L6408
L6405:
	movl %ebp, %ebx              # move to register
	movl $-212, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L6360                      # if true: jump to L6360
	jmp L6361                     # if false: jump to L6361
L6361:
	movl $0, %ebx                # move to register
L6362:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L6365                     # if true: jump to L6365
	jmp L6366                     # if false: jump to L6366
L6366:
	movl $0, %ebx                # move to register
L6367:
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jne L6370                     # if true: jump to L6370
	jmp L6371                     # if false: jump to L6371
L6371:
	movl %ebp, %ebx              # move to register
	movl $-512, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -512(%ebp)        # move to memory
	jmp L6404                     # jump to L6404
L6360:
	movl $1, %edi                # move to register
	movl %ebp, %ebx              # move to register
	movl $-220, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-492, %ecx             # move constant to register
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
	je L6363                      # if true: jump to L6363
	jmp L6364                     # if false: jump to L6364
L6364:
	movl $0, %edi                # move to register
L6363:
	movl %edi, %ebx              # move to register
	jmp L6362                     # jump to L6362
L6365:
	movl $1, %edi                # move to register
	movl %ebp, %ebx              # move to register
	movl $-224, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ecx              # move to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %esi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-492, %ecx             # move constant to register
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
	je L6368                      # if true: jump to L6368
	jmp L6369                     # if false: jump to L6369
L6369:
	movl $0, %edi                # move to register
L6368:
	movl %edi, %ebx              # move to register
	jmp L6367                     # jump to L6367
L6370:
	movl %ebp, %ebx              # move to register
	movl $-212, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $1, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-220, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $-492, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	addl %esi, %ebx              # add two registers
	movl $1, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-224, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $-492, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	subl %esi, %ebx              # subtract two registers
	movl $1, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-216, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-492, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebp, %esi              # move to register
	movl $-508, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	movl %esi, (%edi, %ebx, 4)   # move to memory
	movl %ebp, %ebx              # move to register
	movl $-492, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	pushl %ebx                   # push onto stack
	pushl %ebp                   # push onto stack
	call try
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $-212, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-220, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $-492, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	addl %esi, %ebx              # add two registers
	movl $0, (%edi, %ebx, 4)     # move to memory
	movl %ebp, %ebx              # move to register
	movl $-224, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-508, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $7, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl %ebx, %ebx              # move to register
	movl %ebp, %esi              # move to register
	movl $-492, %ecx             # move constant to register
	movl	%ecx, -4(%ebp)          # save pseudo-register

	movl	-4(%ebp), %ecx          # load pseudo-register
	addl %ecx, %esi              # add two registers
	movl (%esi), %esi            # fetch from memory
	subl %esi, %ebx              # subtract two registers
	movl $0, (%edi, %ebx, 4)     # move to memory
	movl $0, %ebx                # move to register
	jmp L6371                     # jump to L6371
L6411:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
.globl L4568
.type L4568, @function
L4568:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L5321:
	movl %ebp, %ebx              # move to register
	movl $-256, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-260, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	jle L5322                     # if true: jump to L5322
	jmp L5020                     # if false: jump to L5020
L5020:
	pushl $L5324                 # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %eax              # move to register
	jmp L6413                     # jump to L6413
L5322:
L5092:
	movl %ebp, %ebx              # move to register
	movl $-316, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-320, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	jle L5093                     # if true: jump to L5093
	jmp L5063                     # if false: jump to L5063
L5063:
	pushl $L5095                 # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebp, %ebx              # move to register
	movl $-256, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -256(%ebp)        # move to memory
	jmp L5321                     # jump to L5321
L5093:
	movl %ebp, %ebx              # move to register
	movl $-216, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %edi              # move to register
	movl %ebp, %ebx              # move to register
	movl $-316, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $4, %esi                # move constant to register
	imull %esi, %ebx             # multiply two registers
	addl %ebx, %edi              # add two registers
	movl (%edi), %edi            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-312, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	cmpl %ebx, %edi              # compare for jump...
	je L5075                      # if true: jump to L5075
	jmp L5076                     # if false: jump to L5076
L5076:
	movl $L5074, %ebx            # move to register
L5077:
	pushl %ebx                   # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $-316, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -316(%ebp)        # move to memory
	jmp L5092                     # jump to L5092
L5075:
	movl $L5073, %ebx            # move to register
	jmp L5077                     # jump to L5077
L6413:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L6079:
	.long 1
	.byte 10, 0
L6078:
	.long 1
	.byte 10, 0
L6075:
	.long 1
	.byte 10, 0
L6074:
	.long 1
	.byte 10, 0
L6068:
	.long 2
	.byte 32, 46, 0
L6067:
	.long 2
	.byte 32, 79, 0
L6066:
	.long 2
	.byte 32, 46, 0
L6065:
	.long 2
	.byte 32, 79, 0
L6061:
	.long 2
	.byte 32, 46, 0
L6060:
	.long 2
	.byte 32, 79, 0
L6059:
	.long 2
	.byte 32, 46, 0
L6058:
	.long 2
	.byte 32, 79, 0
L6054:
	.long 2
	.byte 32, 46, 0
L6053:
	.long 2
	.byte 32, 79, 0
L6052:
	.long 2
	.byte 32, 46, 0
L6051:
	.long 2
	.byte 32, 79, 0
L6047:
	.long 2
	.byte 32, 46, 0
L6046:
	.long 2
	.byte 32, 79, 0
L6045:
	.long 2
	.byte 32, 46, 0
L6044:
	.long 2
	.byte 32, 79, 0
L6039:
	.long 2
	.byte 32, 46, 0
L6038:
	.long 2
	.byte 32, 79, 0
L6037:
	.long 2
	.byte 32, 46, 0
L6036:
	.long 2
	.byte 32, 79, 0
L6032:
	.long 2
	.byte 32, 46, 0
L6031:
	.long 2
	.byte 32, 79, 0
L6030:
	.long 2
	.byte 32, 46, 0
L6029:
	.long 2
	.byte 32, 79, 0
L6025:
	.long 2
	.byte 32, 46, 0
L6024:
	.long 2
	.byte 32, 79, 0
L6023:
	.long 2
	.byte 32, 46, 0
L6022:
	.long 2
	.byte 32, 79, 0
L6018:
	.long 2
	.byte 32, 46, 0
L6017:
	.long 2
	.byte 32, 79, 0
L6016:
	.long 2
	.byte 32, 46, 0
L6015:
	.long 2
	.byte 32, 79, 0
L6011:
	.long 2
	.byte 32, 46, 0
L6010:
	.long 2
	.byte 32, 79, 0
L6009:
	.long 2
	.byte 32, 46, 0
L6008:
	.long 2
	.byte 32, 79, 0
L6004:
	.long 2
	.byte 32, 46, 0
L6003:
	.long 2
	.byte 32, 79, 0
L6002:
	.long 2
	.byte 32, 46, 0
L6001:
	.long 2
	.byte 32, 79, 0
L6000:
	.long 1
	.byte 10, 0
L5999:
	.long 1
	.byte 10, 0
L5993:
	.long 2
	.byte 32, 46, 0
L5992:
	.long 2
	.byte 32, 79, 0
L5991:
	.long 2
	.byte 32, 46, 0
L5990:
	.long 2
	.byte 32, 79, 0
L5986:
	.long 2
	.byte 32, 46, 0
L5985:
	.long 2
	.byte 32, 79, 0
L5984:
	.long 2
	.byte 32, 46, 0
L5983:
	.long 2
	.byte 32, 79, 0
L5979:
	.long 2
	.byte 32, 46, 0
L5978:
	.long 2
	.byte 32, 79, 0
L5977:
	.long 2
	.byte 32, 46, 0
L5976:
	.long 2
	.byte 32, 79, 0
L5972:
	.long 2
	.byte 32, 46, 0
L5971:
	.long 2
	.byte 32, 79, 0
L5970:
	.long 2
	.byte 32, 46, 0
L5969:
	.long 2
	.byte 32, 79, 0
L5964:
	.long 2
	.byte 32, 46, 0
L5963:
	.long 2
	.byte 32, 79, 0
L5962:
	.long 2
	.byte 32, 46, 0
L5961:
	.long 2
	.byte 32, 79, 0
L5957:
	.long 2
	.byte 32, 46, 0
L5956:
	.long 2
	.byte 32, 79, 0
L5955:
	.long 2
	.byte 32, 46, 0
L5954:
	.long 2
	.byte 32, 79, 0
L5950:
	.long 2
	.byte 32, 46, 0
L5949:
	.long 2
	.byte 32, 79, 0
L5948:
	.long 2
	.byte 32, 46, 0
L5947:
	.long 2
	.byte 32, 79, 0
L5943:
	.long 2
	.byte 32, 46, 0
L5942:
	.long 2
	.byte 32, 79, 0
L5941:
	.long 2
	.byte 32, 46, 0
L5940:
	.long 2
	.byte 32, 79, 0
L5936:
	.long 2
	.byte 32, 46, 0
L5935:
	.long 2
	.byte 32, 79, 0
L5934:
	.long 2
	.byte 32, 46, 0
L5933:
	.long 2
	.byte 32, 79, 0
L5929:
	.long 2
	.byte 32, 46, 0
L5928:
	.long 2
	.byte 32, 79, 0
L5927:
	.long 2
	.byte 32, 46, 0
L5926:
	.long 2
	.byte 32, 79, 0
L5925:
	.long 1
	.byte 10, 0
L5924:
	.long 1
	.byte 10, 0
L5918:
	.long 2
	.byte 32, 46, 0
L5917:
	.long 2
	.byte 32, 79, 0
L5916:
	.long 2
	.byte 32, 46, 0
L5915:
	.long 2
	.byte 32, 79, 0
L5911:
	.long 2
	.byte 32, 46, 0
L5910:
	.long 2
	.byte 32, 79, 0
L5909:
	.long 2
	.byte 32, 46, 0
L5908:
	.long 2
	.byte 32, 79, 0
L5904:
	.long 2
	.byte 32, 46, 0
L5903:
	.long 2
	.byte 32, 79, 0
L5902:
	.long 2
	.byte 32, 46, 0
L5901:
	.long 2
	.byte 32, 79, 0
L5897:
	.long 2
	.byte 32, 46, 0
L5896:
	.long 2
	.byte 32, 79, 0
L5895:
	.long 2
	.byte 32, 46, 0
L5894:
	.long 2
	.byte 32, 79, 0
L5889:
	.long 2
	.byte 32, 46, 0
L5888:
	.long 2
	.byte 32, 79, 0
L5887:
	.long 2
	.byte 32, 46, 0
L5886:
	.long 2
	.byte 32, 79, 0
L5882:
	.long 2
	.byte 32, 46, 0
L5881:
	.long 2
	.byte 32, 79, 0
L5880:
	.long 2
	.byte 32, 46, 0
L5879:
	.long 2
	.byte 32, 79, 0
L5875:
	.long 2
	.byte 32, 46, 0
L5874:
	.long 2
	.byte 32, 79, 0
L5873:
	.long 2
	.byte 32, 46, 0
L5872:
	.long 2
	.byte 32, 79, 0
L5868:
	.long 2
	.byte 32, 46, 0
L5867:
	.long 2
	.byte 32, 79, 0
L5866:
	.long 2
	.byte 32, 46, 0
L5865:
	.long 2
	.byte 32, 79, 0
L5861:
	.long 2
	.byte 32, 46, 0
L5860:
	.long 2
	.byte 32, 79, 0
L5859:
	.long 2
	.byte 32, 46, 0
L5858:
	.long 2
	.byte 32, 79, 0
L5854:
	.long 2
	.byte 32, 46, 0
L5853:
	.long 2
	.byte 32, 79, 0
L5852:
	.long 2
	.byte 32, 46, 0
L5851:
	.long 2
	.byte 32, 79, 0
L5850:
	.long 1
	.byte 10, 0
L5849:
	.long 1
	.byte 10, 0
L5843:
	.long 2
	.byte 32, 46, 0
L5842:
	.long 2
	.byte 32, 79, 0
L5841:
	.long 2
	.byte 32, 46, 0
L5840:
	.long 2
	.byte 32, 79, 0
L5836:
	.long 2
	.byte 32, 46, 0
L5835:
	.long 2
	.byte 32, 79, 0
L5834:
	.long 2
	.byte 32, 46, 0
L5833:
	.long 2
	.byte 32, 79, 0
L5829:
	.long 2
	.byte 32, 46, 0
L5828:
	.long 2
	.byte 32, 79, 0
L5827:
	.long 2
	.byte 32, 46, 0
L5826:
	.long 2
	.byte 32, 79, 0
L5822:
	.long 2
	.byte 32, 46, 0
L5821:
	.long 2
	.byte 32, 79, 0
L5820:
	.long 2
	.byte 32, 46, 0
L5819:
	.long 2
	.byte 32, 79, 0
L5814:
	.long 2
	.byte 32, 46, 0
L5813:
	.long 2
	.byte 32, 79, 0
L5812:
	.long 2
	.byte 32, 46, 0
L5811:
	.long 2
	.byte 32, 79, 0
L5807:
	.long 2
	.byte 32, 46, 0
L5806:
	.long 2
	.byte 32, 79, 0
L5805:
	.long 2
	.byte 32, 46, 0
L5804:
	.long 2
	.byte 32, 79, 0
L5800:
	.long 2
	.byte 32, 46, 0
L5799:
	.long 2
	.byte 32, 79, 0
L5798:
	.long 2
	.byte 32, 46, 0
L5797:
	.long 2
	.byte 32, 79, 0
L5793:
	.long 2
	.byte 32, 46, 0
L5792:
	.long 2
	.byte 32, 79, 0
L5791:
	.long 2
	.byte 32, 46, 0
L5790:
	.long 2
	.byte 32, 79, 0
L5786:
	.long 2
	.byte 32, 46, 0
L5785:
	.long 2
	.byte 32, 79, 0
L5784:
	.long 2
	.byte 32, 46, 0
L5783:
	.long 2
	.byte 32, 79, 0
L5779:
	.long 2
	.byte 32, 46, 0
L5778:
	.long 2
	.byte 32, 79, 0
L5777:
	.long 2
	.byte 32, 46, 0
L5776:
	.long 2
	.byte 32, 79, 0
L5774:
	.long 1
	.byte 10, 0
L5773:
	.long 1
	.byte 10, 0
L5767:
	.long 2
	.byte 32, 46, 0
L5766:
	.long 2
	.byte 32, 79, 0
L5765:
	.long 2
	.byte 32, 46, 0
L5764:
	.long 2
	.byte 32, 79, 0
L5760:
	.long 2
	.byte 32, 46, 0
L5759:
	.long 2
	.byte 32, 79, 0
L5758:
	.long 2
	.byte 32, 46, 0
L5757:
	.long 2
	.byte 32, 79, 0
L5753:
	.long 2
	.byte 32, 46, 0
L5752:
	.long 2
	.byte 32, 79, 0
L5751:
	.long 2
	.byte 32, 46, 0
L5750:
	.long 2
	.byte 32, 79, 0
L5746:
	.long 2
	.byte 32, 46, 0
L5745:
	.long 2
	.byte 32, 79, 0
L5744:
	.long 2
	.byte 32, 46, 0
L5743:
	.long 2
	.byte 32, 79, 0
L5738:
	.long 2
	.byte 32, 46, 0
L5737:
	.long 2
	.byte 32, 79, 0
L5736:
	.long 2
	.byte 32, 46, 0
L5735:
	.long 2
	.byte 32, 79, 0
L5731:
	.long 2
	.byte 32, 46, 0
L5730:
	.long 2
	.byte 32, 79, 0
L5729:
	.long 2
	.byte 32, 46, 0
L5728:
	.long 2
	.byte 32, 79, 0
L5724:
	.long 2
	.byte 32, 46, 0
L5723:
	.long 2
	.byte 32, 79, 0
L5722:
	.long 2
	.byte 32, 46, 0
L5721:
	.long 2
	.byte 32, 79, 0
L5717:
	.long 2
	.byte 32, 46, 0
L5716:
	.long 2
	.byte 32, 79, 0
L5715:
	.long 2
	.byte 32, 46, 0
L5714:
	.long 2
	.byte 32, 79, 0
L5710:
	.long 2
	.byte 32, 46, 0
L5709:
	.long 2
	.byte 32, 79, 0
L5708:
	.long 2
	.byte 32, 46, 0
L5707:
	.long 2
	.byte 32, 79, 0
L5703:
	.long 2
	.byte 32, 46, 0
L5702:
	.long 2
	.byte 32, 79, 0
L5701:
	.long 2
	.byte 32, 46, 0
L5700:
	.long 2
	.byte 32, 79, 0
L5699:
	.long 1
	.byte 10, 0
L5698:
	.long 1
	.byte 10, 0
L5692:
	.long 2
	.byte 32, 46, 0
L5691:
	.long 2
	.byte 32, 79, 0
L5690:
	.long 2
	.byte 32, 46, 0
L5689:
	.long 2
	.byte 32, 79, 0
L5685:
	.long 2
	.byte 32, 46, 0
L5684:
	.long 2
	.byte 32, 79, 0
L5683:
	.long 2
	.byte 32, 46, 0
L5682:
	.long 2
	.byte 32, 79, 0
L5678:
	.long 2
	.byte 32, 46, 0
L5677:
	.long 2
	.byte 32, 79, 0
L5676:
	.long 2
	.byte 32, 46, 0
L5675:
	.long 2
	.byte 32, 79, 0
L5671:
	.long 2
	.byte 32, 46, 0
L5670:
	.long 2
	.byte 32, 79, 0
L5669:
	.long 2
	.byte 32, 46, 0
L5668:
	.long 2
	.byte 32, 79, 0
L5663:
	.long 2
	.byte 32, 46, 0
L5662:
	.long 2
	.byte 32, 79, 0
L5661:
	.long 2
	.byte 32, 46, 0
L5660:
	.long 2
	.byte 32, 79, 0
L5656:
	.long 2
	.byte 32, 46, 0
L5655:
	.long 2
	.byte 32, 79, 0
L5654:
	.long 2
	.byte 32, 46, 0
L5653:
	.long 2
	.byte 32, 79, 0
L5649:
	.long 2
	.byte 32, 46, 0
L5648:
	.long 2
	.byte 32, 79, 0
L5647:
	.long 2
	.byte 32, 46, 0
L5646:
	.long 2
	.byte 32, 79, 0
L5642:
	.long 2
	.byte 32, 46, 0
L5641:
	.long 2
	.byte 32, 79, 0
L5640:
	.long 2
	.byte 32, 46, 0
L5639:
	.long 2
	.byte 32, 79, 0
L5635:
	.long 2
	.byte 32, 46, 0
L5634:
	.long 2
	.byte 32, 79, 0
L5633:
	.long 2
	.byte 32, 46, 0
L5632:
	.long 2
	.byte 32, 79, 0
L5628:
	.long 2
	.byte 32, 46, 0
L5627:
	.long 2
	.byte 32, 79, 0
L5626:
	.long 2
	.byte 32, 46, 0
L5625:
	.long 2
	.byte 32, 79, 0
L5624:
	.long 1
	.byte 10, 0
L5623:
	.long 1
	.byte 10, 0
L5617:
	.long 2
	.byte 32, 46, 0
L5616:
	.long 2
	.byte 32, 79, 0
L5615:
	.long 2
	.byte 32, 46, 0
L5614:
	.long 2
	.byte 32, 79, 0
L5610:
	.long 2
	.byte 32, 46, 0
L5609:
	.long 2
	.byte 32, 79, 0
L5608:
	.long 2
	.byte 32, 46, 0
L5607:
	.long 2
	.byte 32, 79, 0
L5603:
	.long 2
	.byte 32, 46, 0
L5602:
	.long 2
	.byte 32, 79, 0
L5601:
	.long 2
	.byte 32, 46, 0
L5600:
	.long 2
	.byte 32, 79, 0
L5596:
	.long 2
	.byte 32, 46, 0
L5595:
	.long 2
	.byte 32, 79, 0
L5594:
	.long 2
	.byte 32, 46, 0
L5593:
	.long 2
	.byte 32, 79, 0
L5588:
	.long 2
	.byte 32, 46, 0
L5587:
	.long 2
	.byte 32, 79, 0
L5586:
	.long 2
	.byte 32, 46, 0
L5585:
	.long 2
	.byte 32, 79, 0
L5581:
	.long 2
	.byte 32, 46, 0
L5580:
	.long 2
	.byte 32, 79, 0
L5579:
	.long 2
	.byte 32, 46, 0
L5578:
	.long 2
	.byte 32, 79, 0
L5574:
	.long 2
	.byte 32, 46, 0
L5573:
	.long 2
	.byte 32, 79, 0
L5572:
	.long 2
	.byte 32, 46, 0
L5571:
	.long 2
	.byte 32, 79, 0
L5567:
	.long 2
	.byte 32, 46, 0
L5566:
	.long 2
	.byte 32, 79, 0
L5565:
	.long 2
	.byte 32, 46, 0
L5564:
	.long 2
	.byte 32, 79, 0
L5560:
	.long 2
	.byte 32, 46, 0
L5559:
	.long 2
	.byte 32, 79, 0
L5558:
	.long 2
	.byte 32, 46, 0
L5557:
	.long 2
	.byte 32, 79, 0
L5553:
	.long 2
	.byte 32, 46, 0
L5552:
	.long 2
	.byte 32, 79, 0
L5551:
	.long 2
	.byte 32, 46, 0
L5550:
	.long 2
	.byte 32, 79, 0
L5549:
	.long 1
	.byte 10, 0
L5548:
	.long 1
	.byte 10, 0
L5542:
	.long 2
	.byte 32, 46, 0
L5541:
	.long 2
	.byte 32, 79, 0
L5540:
	.long 2
	.byte 32, 46, 0
L5539:
	.long 2
	.byte 32, 79, 0
L5535:
	.long 2
	.byte 32, 46, 0
L5534:
	.long 2
	.byte 32, 79, 0
L5533:
	.long 2
	.byte 32, 46, 0
L5532:
	.long 2
	.byte 32, 79, 0
L5528:
	.long 2
	.byte 32, 46, 0
L5527:
	.long 2
	.byte 32, 79, 0
L5526:
	.long 2
	.byte 32, 46, 0
L5525:
	.long 2
	.byte 32, 79, 0
L5521:
	.long 2
	.byte 32, 46, 0
L5520:
	.long 2
	.byte 32, 79, 0
L5519:
	.long 2
	.byte 32, 46, 0
L5518:
	.long 2
	.byte 32, 79, 0
L5513:
	.long 2
	.byte 32, 46, 0
L5512:
	.long 2
	.byte 32, 79, 0
L5511:
	.long 2
	.byte 32, 46, 0
L5510:
	.long 2
	.byte 32, 79, 0
L5506:
	.long 2
	.byte 32, 46, 0
L5505:
	.long 2
	.byte 32, 79, 0
L5504:
	.long 2
	.byte 32, 46, 0
L5503:
	.long 2
	.byte 32, 79, 0
L5499:
	.long 2
	.byte 32, 46, 0
L5498:
	.long 2
	.byte 32, 79, 0
L5497:
	.long 2
	.byte 32, 46, 0
L5496:
	.long 2
	.byte 32, 79, 0
L5492:
	.long 2
	.byte 32, 46, 0
L5491:
	.long 2
	.byte 32, 79, 0
L5490:
	.long 2
	.byte 32, 46, 0
L5489:
	.long 2
	.byte 32, 79, 0
L5485:
	.long 2
	.byte 32, 46, 0
L5484:
	.long 2
	.byte 32, 79, 0
L5483:
	.long 2
	.byte 32, 46, 0
L5482:
	.long 2
	.byte 32, 79, 0
L5478:
	.long 2
	.byte 32, 46, 0
L5477:
	.long 2
	.byte 32, 79, 0
L5476:
	.long 2
	.byte 32, 46, 0
L5475:
	.long 2
	.byte 32, 79, 0
L5474:
	.long 1
	.byte 10, 0
L5473:
	.long 1
	.byte 10, 0
L5467:
	.long 2
	.byte 32, 46, 0
L5466:
	.long 2
	.byte 32, 79, 0
L5465:
	.long 2
	.byte 32, 46, 0
L5464:
	.long 2
	.byte 32, 79, 0
L5460:
	.long 2
	.byte 32, 46, 0
L5459:
	.long 2
	.byte 32, 79, 0
L5458:
	.long 2
	.byte 32, 46, 0
L5457:
	.long 2
	.byte 32, 79, 0
L5453:
	.long 2
	.byte 32, 46, 0
L5452:
	.long 2
	.byte 32, 79, 0
L5451:
	.long 2
	.byte 32, 46, 0
L5450:
	.long 2
	.byte 32, 79, 0
L5446:
	.long 2
	.byte 32, 46, 0
L5445:
	.long 2
	.byte 32, 79, 0
L5444:
	.long 2
	.byte 32, 46, 0
L5443:
	.long 2
	.byte 32, 79, 0
L5438:
	.long 2
	.byte 32, 46, 0
L5437:
	.long 2
	.byte 32, 79, 0
L5436:
	.long 2
	.byte 32, 46, 0
L5435:
	.long 2
	.byte 32, 79, 0
L5431:
	.long 2
	.byte 32, 46, 0
L5430:
	.long 2
	.byte 32, 79, 0
L5429:
	.long 2
	.byte 32, 46, 0
L5428:
	.long 2
	.byte 32, 79, 0
L5424:
	.long 2
	.byte 32, 46, 0
L5423:
	.long 2
	.byte 32, 79, 0
L5422:
	.long 2
	.byte 32, 46, 0
L5421:
	.long 2
	.byte 32, 79, 0
L5417:
	.long 2
	.byte 32, 46, 0
L5416:
	.long 2
	.byte 32, 79, 0
L5415:
	.long 2
	.byte 32, 46, 0
L5414:
	.long 2
	.byte 32, 79, 0
L5410:
	.long 2
	.byte 32, 46, 0
L5409:
	.long 2
	.byte 32, 79, 0
L5408:
	.long 2
	.byte 32, 46, 0
L5407:
	.long 2
	.byte 32, 79, 0
L5403:
	.long 2
	.byte 32, 46, 0
L5402:
	.long 2
	.byte 32, 79, 0
L5401:
	.long 2
	.byte 32, 46, 0
L5400:
	.long 2
	.byte 32, 79, 0
L5399:
	.long 1
	.byte 10, 0
L5398:
	.long 1
	.byte 10, 0
L5392:
	.long 2
	.byte 32, 46, 0
L5391:
	.long 2
	.byte 32, 79, 0
L5390:
	.long 2
	.byte 32, 46, 0
L5389:
	.long 2
	.byte 32, 79, 0
L5385:
	.long 2
	.byte 32, 46, 0
L5384:
	.long 2
	.byte 32, 79, 0
L5383:
	.long 2
	.byte 32, 46, 0
L5382:
	.long 2
	.byte 32, 79, 0
L5378:
	.long 2
	.byte 32, 46, 0
L5377:
	.long 2
	.byte 32, 79, 0
L5376:
	.long 2
	.byte 32, 46, 0
L5375:
	.long 2
	.byte 32, 79, 0
L5371:
	.long 2
	.byte 32, 46, 0
L5370:
	.long 2
	.byte 32, 79, 0
L5369:
	.long 2
	.byte 32, 46, 0
L5368:
	.long 2
	.byte 32, 79, 0
L5363:
	.long 2
	.byte 32, 46, 0
L5362:
	.long 2
	.byte 32, 79, 0
L5361:
	.long 2
	.byte 32, 46, 0
L5360:
	.long 2
	.byte 32, 79, 0
L5356:
	.long 2
	.byte 32, 46, 0
L5355:
	.long 2
	.byte 32, 79, 0
L5354:
	.long 2
	.byte 32, 46, 0
L5353:
	.long 2
	.byte 32, 79, 0
L5349:
	.long 2
	.byte 32, 46, 0
L5348:
	.long 2
	.byte 32, 79, 0
L5347:
	.long 2
	.byte 32, 46, 0
L5346:
	.long 2
	.byte 32, 79, 0
L5342:
	.long 2
	.byte 32, 46, 0
L5341:
	.long 2
	.byte 32, 79, 0
L5340:
	.long 2
	.byte 32, 46, 0
L5339:
	.long 2
	.byte 32, 79, 0
L5335:
	.long 2
	.byte 32, 46, 0
L5334:
	.long 2
	.byte 32, 79, 0
L5333:
	.long 2
	.byte 32, 46, 0
L5332:
	.long 2
	.byte 32, 79, 0
L5328:
	.long 2
	.byte 32, 46, 0
L5327:
	.long 2
	.byte 32, 79, 0
L5326:
	.long 2
	.byte 32, 46, 0
L5325:
	.long 2
	.byte 32, 79, 0
L5324:
	.long 1
	.byte 10, 0
L5323:
	.long 1
	.byte 10, 0
L5320:
	.long 1
	.byte 10, 0
L5319:
	.long 1
	.byte 10, 0
L5313:
	.long 2
	.byte 32, 46, 0
L5312:
	.long 2
	.byte 32, 79, 0
L5311:
	.long 2
	.byte 32, 46, 0
L5310:
	.long 2
	.byte 32, 79, 0
L5306:
	.long 2
	.byte 32, 46, 0
L5305:
	.long 2
	.byte 32, 79, 0
L5304:
	.long 2
	.byte 32, 46, 0
L5303:
	.long 2
	.byte 32, 79, 0
L5299:
	.long 2
	.byte 32, 46, 0
L5298:
	.long 2
	.byte 32, 79, 0
L5297:
	.long 2
	.byte 32, 46, 0
L5296:
	.long 2
	.byte 32, 79, 0
L5292:
	.long 2
	.byte 32, 46, 0
L5291:
	.long 2
	.byte 32, 79, 0
L5290:
	.long 2
	.byte 32, 46, 0
L5289:
	.long 2
	.byte 32, 79, 0
L5284:
	.long 2
	.byte 32, 46, 0
L5283:
	.long 2
	.byte 32, 79, 0
L5282:
	.long 2
	.byte 32, 46, 0
L5281:
	.long 2
	.byte 32, 79, 0
L5277:
	.long 2
	.byte 32, 46, 0
L5276:
	.long 2
	.byte 32, 79, 0
L5275:
	.long 2
	.byte 32, 46, 0
L5274:
	.long 2
	.byte 32, 79, 0
L5270:
	.long 2
	.byte 32, 46, 0
L5269:
	.long 2
	.byte 32, 79, 0
L5268:
	.long 2
	.byte 32, 46, 0
L5267:
	.long 2
	.byte 32, 79, 0
L5263:
	.long 2
	.byte 32, 46, 0
L5262:
	.long 2
	.byte 32, 79, 0
L5261:
	.long 2
	.byte 32, 46, 0
L5260:
	.long 2
	.byte 32, 79, 0
L5256:
	.long 2
	.byte 32, 46, 0
L5255:
	.long 2
	.byte 32, 79, 0
L5254:
	.long 2
	.byte 32, 46, 0
L5253:
	.long 2
	.byte 32, 79, 0
L5249:
	.long 2
	.byte 32, 46, 0
L5248:
	.long 2
	.byte 32, 79, 0
L5247:
	.long 2
	.byte 32, 46, 0
L5246:
	.long 2
	.byte 32, 79, 0
L5245:
	.long 1
	.byte 10, 0
L5244:
	.long 1
	.byte 10, 0
L5238:
	.long 2
	.byte 32, 46, 0
L5237:
	.long 2
	.byte 32, 79, 0
L5236:
	.long 2
	.byte 32, 46, 0
L5235:
	.long 2
	.byte 32, 79, 0
L5231:
	.long 2
	.byte 32, 46, 0
L5230:
	.long 2
	.byte 32, 79, 0
L5229:
	.long 2
	.byte 32, 46, 0
L5228:
	.long 2
	.byte 32, 79, 0
L5224:
	.long 2
	.byte 32, 46, 0
L5223:
	.long 2
	.byte 32, 79, 0
L5222:
	.long 2
	.byte 32, 46, 0
L5221:
	.long 2
	.byte 32, 79, 0
L5217:
	.long 2
	.byte 32, 46, 0
L5216:
	.long 2
	.byte 32, 79, 0
L5215:
	.long 2
	.byte 32, 46, 0
L5214:
	.long 2
	.byte 32, 79, 0
L5209:
	.long 2
	.byte 32, 46, 0
L5208:
	.long 2
	.byte 32, 79, 0
L5207:
	.long 2
	.byte 32, 46, 0
L5206:
	.long 2
	.byte 32, 79, 0
L5202:
	.long 2
	.byte 32, 46, 0
L5201:
	.long 2
	.byte 32, 79, 0
L5200:
	.long 2
	.byte 32, 46, 0
L5199:
	.long 2
	.byte 32, 79, 0
L5195:
	.long 2
	.byte 32, 46, 0
L5194:
	.long 2
	.byte 32, 79, 0
L5193:
	.long 2
	.byte 32, 46, 0
L5192:
	.long 2
	.byte 32, 79, 0
L5188:
	.long 2
	.byte 32, 46, 0
L5187:
	.long 2
	.byte 32, 79, 0
L5186:
	.long 2
	.byte 32, 46, 0
L5185:
	.long 2
	.byte 32, 79, 0
L5181:
	.long 2
	.byte 32, 46, 0
L5180:
	.long 2
	.byte 32, 79, 0
L5179:
	.long 2
	.byte 32, 46, 0
L5178:
	.long 2
	.byte 32, 79, 0
L5174:
	.long 2
	.byte 32, 46, 0
L5173:
	.long 2
	.byte 32, 79, 0
L5172:
	.long 2
	.byte 32, 46, 0
L5171:
	.long 2
	.byte 32, 79, 0
L5170:
	.long 1
	.byte 10, 0
L5169:
	.long 1
	.byte 10, 0
L5163:
	.long 2
	.byte 32, 46, 0
L5162:
	.long 2
	.byte 32, 79, 0
L5161:
	.long 2
	.byte 32, 46, 0
L5160:
	.long 2
	.byte 32, 79, 0
L5156:
	.long 2
	.byte 32, 46, 0
L5155:
	.long 2
	.byte 32, 79, 0
L5154:
	.long 2
	.byte 32, 46, 0
L5153:
	.long 2
	.byte 32, 79, 0
L5149:
	.long 2
	.byte 32, 46, 0
L5148:
	.long 2
	.byte 32, 79, 0
L5147:
	.long 2
	.byte 32, 46, 0
L5146:
	.long 2
	.byte 32, 79, 0
L5142:
	.long 2
	.byte 32, 46, 0
L5141:
	.long 2
	.byte 32, 79, 0
L5140:
	.long 2
	.byte 32, 46, 0
L5139:
	.long 2
	.byte 32, 79, 0
L5134:
	.long 2
	.byte 32, 46, 0
L5133:
	.long 2
	.byte 32, 79, 0
L5132:
	.long 2
	.byte 32, 46, 0
L5131:
	.long 2
	.byte 32, 79, 0
L5127:
	.long 2
	.byte 32, 46, 0
L5126:
	.long 2
	.byte 32, 79, 0
L5125:
	.long 2
	.byte 32, 46, 0
L5124:
	.long 2
	.byte 32, 79, 0
L5120:
	.long 2
	.byte 32, 46, 0
L5119:
	.long 2
	.byte 32, 79, 0
L5118:
	.long 2
	.byte 32, 46, 0
L5117:
	.long 2
	.byte 32, 79, 0
L5113:
	.long 2
	.byte 32, 46, 0
L5112:
	.long 2
	.byte 32, 79, 0
L5111:
	.long 2
	.byte 32, 46, 0
L5110:
	.long 2
	.byte 32, 79, 0
L5106:
	.long 2
	.byte 32, 46, 0
L5105:
	.long 2
	.byte 32, 79, 0
L5104:
	.long 2
	.byte 32, 46, 0
L5103:
	.long 2
	.byte 32, 79, 0
L5099:
	.long 2
	.byte 32, 46, 0
L5098:
	.long 2
	.byte 32, 79, 0
L5097:
	.long 2
	.byte 32, 46, 0
L5096:
	.long 2
	.byte 32, 79, 0
L5095:
	.long 1
	.byte 10, 0
L5094:
	.long 1
	.byte 10, 0
L5088:
	.long 2
	.byte 32, 46, 0
L5087:
	.long 2
	.byte 32, 79, 0
L5086:
	.long 2
	.byte 32, 46, 0
L5085:
	.long 2
	.byte 32, 79, 0
L5081:
	.long 2
	.byte 32, 46, 0
L5080:
	.long 2
	.byte 32, 79, 0
L5079:
	.long 2
	.byte 32, 46, 0
L5078:
	.long 2
	.byte 32, 79, 0
L5074:
	.long 2
	.byte 32, 46, 0
L5073:
	.long 2
	.byte 32, 79, 0
L5072:
	.long 2
	.byte 32, 46, 0
L5071:
	.long 2
	.byte 32, 79, 0
L5067:
	.long 2
	.byte 32, 46, 0
L5066:
	.long 2
	.byte 32, 79, 0
L5065:
	.long 2
	.byte 32, 46, 0
L5064:
	.long 2
	.byte 32, 79, 0
L5059:
	.long 2
	.byte 32, 46, 0
L5058:
	.long 2
	.byte 32, 79, 0
L5057:
	.long 2
	.byte 32, 46, 0
L5056:
	.long 2
	.byte 32, 79, 0
L5052:
	.long 2
	.byte 32, 46, 0
L5051:
	.long 2
	.byte 32, 79, 0
L5050:
	.long 2
	.byte 32, 46, 0
L5049:
	.long 2
	.byte 32, 79, 0
L5045:
	.long 2
	.byte 32, 46, 0
L5044:
	.long 2
	.byte 32, 79, 0
L5043:
	.long 2
	.byte 32, 46, 0
L5042:
	.long 2
	.byte 32, 79, 0
L5038:
	.long 2
	.byte 32, 46, 0
L5037:
	.long 2
	.byte 32, 79, 0
L5036:
	.long 2
	.byte 32, 46, 0
L5035:
	.long 2
	.byte 32, 79, 0
L5031:
	.long 2
	.byte 32, 46, 0
L5030:
	.long 2
	.byte 32, 79, 0
L5029:
	.long 2
	.byte 32, 46, 0
L5028:
	.long 2
	.byte 32, 79, 0
L5024:
	.long 2
	.byte 32, 46, 0
L5023:
	.long 2
	.byte 32, 79, 0
L5022:
	.long 2
	.byte 32, 46, 0
L5021:
	.long 2
	.byte 32, 79, 0
L5019:
	.long 1
	.byte 10, 0
L5018:
	.long 1
	.byte 10, 0
L5012:
	.long 2
	.byte 32, 46, 0
L5011:
	.long 2
	.byte 32, 79, 0
L5010:
	.long 2
	.byte 32, 46, 0
L5009:
	.long 2
	.byte 32, 79, 0
L5005:
	.long 2
	.byte 32, 46, 0
L5004:
	.long 2
	.byte 32, 79, 0
L5003:
	.long 2
	.byte 32, 46, 0
L5002:
	.long 2
	.byte 32, 79, 0
L4998:
	.long 2
	.byte 32, 46, 0
L4997:
	.long 2
	.byte 32, 79, 0
L4996:
	.long 2
	.byte 32, 46, 0
L4995:
	.long 2
	.byte 32, 79, 0
L4991:
	.long 2
	.byte 32, 46, 0
L4990:
	.long 2
	.byte 32, 79, 0
L4989:
	.long 2
	.byte 32, 46, 0
L4988:
	.long 2
	.byte 32, 79, 0
L4983:
	.long 2
	.byte 32, 46, 0
L4982:
	.long 2
	.byte 32, 79, 0
L4981:
	.long 2
	.byte 32, 46, 0
L4980:
	.long 2
	.byte 32, 79, 0
L4976:
	.long 2
	.byte 32, 46, 0
L4975:
	.long 2
	.byte 32, 79, 0
L4974:
	.long 2
	.byte 32, 46, 0
L4973:
	.long 2
	.byte 32, 79, 0
L4969:
	.long 2
	.byte 32, 46, 0
L4968:
	.long 2
	.byte 32, 79, 0
L4967:
	.long 2
	.byte 32, 46, 0
L4966:
	.long 2
	.byte 32, 79, 0
L4962:
	.long 2
	.byte 32, 46, 0
L4961:
	.long 2
	.byte 32, 79, 0
L4960:
	.long 2
	.byte 32, 46, 0
L4959:
	.long 2
	.byte 32, 79, 0
L4955:
	.long 2
	.byte 32, 46, 0
L4954:
	.long 2
	.byte 32, 79, 0
L4953:
	.long 2
	.byte 32, 46, 0
L4952:
	.long 2
	.byte 32, 79, 0
L4948:
	.long 2
	.byte 32, 46, 0
L4947:
	.long 2
	.byte 32, 79, 0
L4946:
	.long 2
	.byte 32, 46, 0
L4945:
	.long 2
	.byte 32, 79, 0
L4944:
	.long 1
	.byte 10, 0
L4943:
	.long 1
	.byte 10, 0
L4937:
	.long 2
	.byte 32, 46, 0
L4936:
	.long 2
	.byte 32, 79, 0
L4935:
	.long 2
	.byte 32, 46, 0
L4934:
	.long 2
	.byte 32, 79, 0
L4930:
	.long 2
	.byte 32, 46, 0
L4929:
	.long 2
	.byte 32, 79, 0
L4928:
	.long 2
	.byte 32, 46, 0
L4927:
	.long 2
	.byte 32, 79, 0
L4923:
	.long 2
	.byte 32, 46, 0
L4922:
	.long 2
	.byte 32, 79, 0
L4921:
	.long 2
	.byte 32, 46, 0
L4920:
	.long 2
	.byte 32, 79, 0
L4916:
	.long 2
	.byte 32, 46, 0
L4915:
	.long 2
	.byte 32, 79, 0
L4914:
	.long 2
	.byte 32, 46, 0
L4913:
	.long 2
	.byte 32, 79, 0
L4908:
	.long 2
	.byte 32, 46, 0
L4907:
	.long 2
	.byte 32, 79, 0
L4906:
	.long 2
	.byte 32, 46, 0
L4905:
	.long 2
	.byte 32, 79, 0
L4901:
	.long 2
	.byte 32, 46, 0
L4900:
	.long 2
	.byte 32, 79, 0
L4899:
	.long 2
	.byte 32, 46, 0
L4898:
	.long 2
	.byte 32, 79, 0
L4894:
	.long 2
	.byte 32, 46, 0
L4893:
	.long 2
	.byte 32, 79, 0
L4892:
	.long 2
	.byte 32, 46, 0
L4891:
	.long 2
	.byte 32, 79, 0
L4887:
	.long 2
	.byte 32, 46, 0
L4886:
	.long 2
	.byte 32, 79, 0
L4885:
	.long 2
	.byte 32, 46, 0
L4884:
	.long 2
	.byte 32, 79, 0
L4880:
	.long 2
	.byte 32, 46, 0
L4879:
	.long 2
	.byte 32, 79, 0
L4878:
	.long 2
	.byte 32, 46, 0
L4877:
	.long 2
	.byte 32, 79, 0
L4873:
	.long 2
	.byte 32, 46, 0
L4872:
	.long 2
	.byte 32, 79, 0
L4871:
	.long 2
	.byte 32, 46, 0
L4870:
	.long 2
	.byte 32, 79, 0
L4869:
	.long 1
	.byte 10, 0
L4868:
	.long 1
	.byte 10, 0
L4862:
	.long 2
	.byte 32, 46, 0
L4861:
	.long 2
	.byte 32, 79, 0
L4860:
	.long 2
	.byte 32, 46, 0
L4859:
	.long 2
	.byte 32, 79, 0
L4855:
	.long 2
	.byte 32, 46, 0
L4854:
	.long 2
	.byte 32, 79, 0
L4853:
	.long 2
	.byte 32, 46, 0
L4852:
	.long 2
	.byte 32, 79, 0
L4848:
	.long 2
	.byte 32, 46, 0
L4847:
	.long 2
	.byte 32, 79, 0
L4846:
	.long 2
	.byte 32, 46, 0
L4845:
	.long 2
	.byte 32, 79, 0
L4841:
	.long 2
	.byte 32, 46, 0
L4840:
	.long 2
	.byte 32, 79, 0
L4839:
	.long 2
	.byte 32, 46, 0
L4838:
	.long 2
	.byte 32, 79, 0
L4833:
	.long 2
	.byte 32, 46, 0
L4832:
	.long 2
	.byte 32, 79, 0
L4831:
	.long 2
	.byte 32, 46, 0
L4830:
	.long 2
	.byte 32, 79, 0
L4826:
	.long 2
	.byte 32, 46, 0
L4825:
	.long 2
	.byte 32, 79, 0
L4824:
	.long 2
	.byte 32, 46, 0
L4823:
	.long 2
	.byte 32, 79, 0
L4819:
	.long 2
	.byte 32, 46, 0
L4818:
	.long 2
	.byte 32, 79, 0
L4817:
	.long 2
	.byte 32, 46, 0
L4816:
	.long 2
	.byte 32, 79, 0
L4812:
	.long 2
	.byte 32, 46, 0
L4811:
	.long 2
	.byte 32, 79, 0
L4810:
	.long 2
	.byte 32, 46, 0
L4809:
	.long 2
	.byte 32, 79, 0
L4805:
	.long 2
	.byte 32, 46, 0
L4804:
	.long 2
	.byte 32, 79, 0
L4803:
	.long 2
	.byte 32, 46, 0
L4802:
	.long 2
	.byte 32, 79, 0
L4798:
	.long 2
	.byte 32, 46, 0
L4797:
	.long 2
	.byte 32, 79, 0
L4796:
	.long 2
	.byte 32, 46, 0
L4795:
	.long 2
	.byte 32, 79, 0
L4794:
	.long 1
	.byte 10, 0
L4793:
	.long 1
	.byte 10, 0
L4787:
	.long 2
	.byte 32, 46, 0
L4786:
	.long 2
	.byte 32, 79, 0
L4785:
	.long 2
	.byte 32, 46, 0
L4784:
	.long 2
	.byte 32, 79, 0
L4780:
	.long 2
	.byte 32, 46, 0
L4779:
	.long 2
	.byte 32, 79, 0
L4778:
	.long 2
	.byte 32, 46, 0
L4777:
	.long 2
	.byte 32, 79, 0
L4773:
	.long 2
	.byte 32, 46, 0
L4772:
	.long 2
	.byte 32, 79, 0
L4771:
	.long 2
	.byte 32, 46, 0
L4770:
	.long 2
	.byte 32, 79, 0
L4766:
	.long 2
	.byte 32, 46, 0
L4765:
	.long 2
	.byte 32, 79, 0
L4764:
	.long 2
	.byte 32, 46, 0
L4763:
	.long 2
	.byte 32, 79, 0
L4758:
	.long 2
	.byte 32, 46, 0
L4757:
	.long 2
	.byte 32, 79, 0
L4756:
	.long 2
	.byte 32, 46, 0
L4755:
	.long 2
	.byte 32, 79, 0
L4751:
	.long 2
	.byte 32, 46, 0
L4750:
	.long 2
	.byte 32, 79, 0
L4749:
	.long 2
	.byte 32, 46, 0
L4748:
	.long 2
	.byte 32, 79, 0
L4744:
	.long 2
	.byte 32, 46, 0
L4743:
	.long 2
	.byte 32, 79, 0
L4742:
	.long 2
	.byte 32, 46, 0
L4741:
	.long 2
	.byte 32, 79, 0
L4737:
	.long 2
	.byte 32, 46, 0
L4736:
	.long 2
	.byte 32, 79, 0
L4735:
	.long 2
	.byte 32, 46, 0
L4734:
	.long 2
	.byte 32, 79, 0
L4730:
	.long 2
	.byte 32, 46, 0
L4729:
	.long 2
	.byte 32, 79, 0
L4728:
	.long 2
	.byte 32, 46, 0
L4727:
	.long 2
	.byte 32, 79, 0
L4723:
	.long 2
	.byte 32, 46, 0
L4722:
	.long 2
	.byte 32, 79, 0
L4721:
	.long 2
	.byte 32, 46, 0
L4720:
	.long 2
	.byte 32, 79, 0
L4719:
	.long 1
	.byte 10, 0
L4718:
	.long 1
	.byte 10, 0
L4712:
	.long 2
	.byte 32, 46, 0
L4711:
	.long 2
	.byte 32, 79, 0
L4710:
	.long 2
	.byte 32, 46, 0
L4709:
	.long 2
	.byte 32, 79, 0
L4705:
	.long 2
	.byte 32, 46, 0
L4704:
	.long 2
	.byte 32, 79, 0
L4703:
	.long 2
	.byte 32, 46, 0
L4702:
	.long 2
	.byte 32, 79, 0
L4698:
	.long 2
	.byte 32, 46, 0
L4697:
	.long 2
	.byte 32, 79, 0
L4696:
	.long 2
	.byte 32, 46, 0
L4695:
	.long 2
	.byte 32, 79, 0
L4691:
	.long 2
	.byte 32, 46, 0
L4690:
	.long 2
	.byte 32, 79, 0
L4689:
	.long 2
	.byte 32, 46, 0
L4688:
	.long 2
	.byte 32, 79, 0
L4683:
	.long 2
	.byte 32, 46, 0
L4682:
	.long 2
	.byte 32, 79, 0
L4681:
	.long 2
	.byte 32, 46, 0
L4680:
	.long 2
	.byte 32, 79, 0
L4676:
	.long 2
	.byte 32, 46, 0
L4675:
	.long 2
	.byte 32, 79, 0
L4674:
	.long 2
	.byte 32, 46, 0
L4673:
	.long 2
	.byte 32, 79, 0
L4669:
	.long 2
	.byte 32, 46, 0
L4668:
	.long 2
	.byte 32, 79, 0
L4667:
	.long 2
	.byte 32, 46, 0
L4666:
	.long 2
	.byte 32, 79, 0
L4662:
	.long 2
	.byte 32, 46, 0
L4661:
	.long 2
	.byte 32, 79, 0
L4660:
	.long 2
	.byte 32, 46, 0
L4659:
	.long 2
	.byte 32, 79, 0
L4655:
	.long 2
	.byte 32, 46, 0
L4654:
	.long 2
	.byte 32, 79, 0
L4653:
	.long 2
	.byte 32, 46, 0
L4652:
	.long 2
	.byte 32, 79, 0
L4648:
	.long 2
	.byte 32, 46, 0
L4647:
	.long 2
	.byte 32, 79, 0
L4646:
	.long 2
	.byte 32, 46, 0
L4645:
	.long 2
	.byte 32, 79, 0
L4644:
	.long 1
	.byte 10, 0
L4643:
	.long 1
	.byte 10, 0
L4637:
	.long 2
	.byte 32, 46, 0
L4636:
	.long 2
	.byte 32, 79, 0
L4635:
	.long 2
	.byte 32, 46, 0
L4634:
	.long 2
	.byte 32, 79, 0
L4630:
	.long 2
	.byte 32, 46, 0
L4629:
	.long 2
	.byte 32, 79, 0
L4628:
	.long 2
	.byte 32, 46, 0
L4627:
	.long 2
	.byte 32, 79, 0
L4623:
	.long 2
	.byte 32, 46, 0
L4622:
	.long 2
	.byte 32, 79, 0
L4621:
	.long 2
	.byte 32, 46, 0
L4620:
	.long 2
	.byte 32, 79, 0
L4616:
	.long 2
	.byte 32, 46, 0
L4615:
	.long 2
	.byte 32, 79, 0
L4614:
	.long 2
	.byte 32, 46, 0
L4613:
	.long 2
	.byte 32, 79, 0
L4608:
	.long 2
	.byte 32, 46, 0
L4607:
	.long 2
	.byte 32, 79, 0
L4606:
	.long 2
	.byte 32, 46, 0
L4605:
	.long 2
	.byte 32, 79, 0
L4601:
	.long 2
	.byte 32, 46, 0
L4600:
	.long 2
	.byte 32, 79, 0
L4599:
	.long 2
	.byte 32, 46, 0
L4598:
	.long 2
	.byte 32, 79, 0
L4594:
	.long 2
	.byte 32, 46, 0
L4593:
	.long 2
	.byte 32, 79, 0
L4592:
	.long 2
	.byte 32, 46, 0
L4591:
	.long 2
	.byte 32, 79, 0
L4587:
	.long 2
	.byte 32, 46, 0
L4586:
	.long 2
	.byte 32, 79, 0
L4585:
	.long 2
	.byte 32, 46, 0
L4584:
	.long 2
	.byte 32, 79, 0
L4580:
	.long 2
	.byte 32, 46, 0
L4579:
	.long 2
	.byte 32, 79, 0
L4578:
	.long 2
	.byte 32, 46, 0
L4577:
	.long 2
	.byte 32, 79, 0
L4573:
	.long 2
	.byte 32, 46, 0
L4572:
	.long 2
	.byte 32, 79, 0
L4571:
	.long 2
	.byte 32, 46, 0
L4570:
	.long 2
	.byte 32, 79, 0
