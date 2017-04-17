#LABEL L24
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~404)),
##CONST 0)
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~408)),
##CONST 0)
#CJUMP(LE,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~408)),
##CONST 100,
##L21,L20)
#LABEL L20
#MOVE(
##TEMP T100,
##CONST 1)
#JUMP(
##NAME L23)
#LABEL L21
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~404)),
##BINOP(PLUS,
###MEM[4](
####BINOP(PLUS,
#####TEMP T101,
#####CONST ~404)),
###CONST 1))
#MOVE(
##TEMP T189,
##CALL(
###NAME printNum,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST ~404))))
#EXP(
##TEMP T189)
#CJUMP(GE,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~408)),
##CONST 100,
##L20,L22)
#LABEL L22
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~408)),
##BINOP(PLUS,
###MEM[4](
####BINOP(PLUS,
#####TEMP T101,
#####CONST ~408)),
###CONST 1))
#JUMP(
##NAME L21)
#LABEL L23
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $408, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L24:
	movl $0, -404(%ebp)          # move to memory
	movl $0, -408(%ebp)          # move to memory
	movl %ebp, %ebx              # move to register
	movl $-408, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $100, %edi              # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jle L21                     # if true: jump to L21
	jmp L20                     # if false: jump to L20
L20:
	movl $1, %eax                # move to register
	jmp L23                     # jump to L23
L21:
	movl %ebp, %ebx              # move to register
	movl $-404, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -404(%ebp)        # move to memory
	pushl %eax                   # save caller save
	pushl %ecx                   # save caller save
	pushl %edx                   # save caller save
	pushl -404(%ebp)             # push onto stack
	call printNum
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	popl %edx                    # restore caller save
	popl %ecx                    # restore caller save
	popl %eax                    # restore caller save
	movl %ebx, %ebx              # move to register
	movl %ebp, %ebx              # move to register
	movl $-408, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $100, %edi              # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	jge L20                     # if true: jump to L20
	jmp L22                     # if false: jump to L22
L22:
	movl %ebp, %ebx              # move to register
	movl $-408, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, -408(%ebp)        # move to memory
	jmp L21                     # jump to L21
L23:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
