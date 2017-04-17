#LABEL L56
#MOVE(
##TEMP T125,
##BINOP(PLUS,
###TEMP T101,
###CONST ~404))
#MOVE(
##TEMP T124,
##CALL(
###NAME getch))
#MOVE(
##MEM[4](
###TEMP T125),
##TEMP T124)
#MOVE(
##TEMP T127,
##BINOP(PLUS,
###TEMP T101,
###CONST ~408))
#MOVE(
##TEMP T126,
##CALL(
###NAME L22,
####TEMP T101))
#MOVE(
##MEM[4](
###TEMP T127),
##TEMP T126)
#MOVE(
##TEMP T131,
##BINOP(PLUS,
###TEMP T101,
###CONST ~412))
#MOVE(
##TEMP T129,
##BINOP(PLUS,
###TEMP T101,
###CONST ~404))
#MOVE(
##TEMP T128,
##CALL(
###NAME getch))
#MOVE(
##MEM[4](
###TEMP T129),
##TEMP T128)
#MOVE(
##TEMP T130,
##CALL(
###NAME L22,
####TEMP T101))
#MOVE(
##MEM[4](
###TEMP T131),
##TEMP T130)
#MOVE(
##TEMP T133,
##TEMP T101)
#MOVE(
##TEMP T132,
##CALL(
###NAME L23,
####TEMP T101,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST ~408)),
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST ~412))))
#EXP(
##CALL(
###NAME L25,
####TEMP T133,
####TEMP T132))
#MOVE(
##TEMP T100,
##CONST 1)
#JUMP(
##NAME L55)
#LABEL L55
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
#LABEL L58
#CJUMP(EQ,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)),
##CONST 0,
##L52,L53)
#LABEL L53
#MOVE(
##TEMP T148,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 8)))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#EXP(
##CALL(
###NAME L24,
####TEMP T148,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 12)),
######BINOP(MUL,
#######CONST 0,
#######CONST 4)))))
#EXP(
##CALL(
###NAME print,
####NAME L51))
#MOVE(
##TEMP T150,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 8)))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#MOVE(
##TEMP T149,
##CALL(
###NAME L25,
####TEMP T150,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 12)),
######BINOP(MUL,
#######CONST 1,
#######CONST 4)))))
#MOVE(
##TEMP T123,
##TEMP T149)
#LABEL L54
#MOVE(
##TEMP T100,
##TEMP T123)
#JUMP(
##NAME L57)
#LABEL L52
#MOVE(
##TEMP T123,
##CALL(
###NAME print,
####NAME L50))
#JUMP(
##NAME L54)
#LABEL L57
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
#LABEL L60
#CJUMP(LT,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)),
##CONST 0,
##L47,L48)
#LABEL L48
#CJUMP(GT,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)),
##CONST 0,
##L44,L45)
#LABEL L45
#MOVE(
##TEMP T121,
##CALL(
###NAME print,
####NAME L43))
#LABEL L46
#MOVE(
##TEMP T122,
##TEMP T121)
#LABEL L49
#MOVE(
##TEMP T100,
##TEMP T122)
#JUMP(
##NAME L59)
#LABEL L47
#EXP(
##CALL(
###NAME print,
####NAME L42))
#MOVE(
##TEMP T169,
##CALL(
###NAME L38,
####TEMP T101,
####BINOP(MINUS,
#####CONST 0,
#####MEM[4](
######BINOP(PLUS,
#######TEMP T101,
#######CONST 12)))))
#MOVE(
##TEMP T122,
##TEMP T169)
#JUMP(
##NAME L49)
#LABEL L44
#MOVE(
##TEMP T121,
##CALL(
###NAME L38,
####TEMP T101,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#JUMP(
##NAME L46)
#LABEL L59
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
#LABEL L62
#CJUMP(GT,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)),
##CONST 0,
##L40,L41)
#LABEL L41
#MOVE(
##TEMP T100,
##CONST 0)
#JUMP(
##NAME L61)
#LABEL L40
#EXP(
##CALL(
###NAME L38,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 8)),
####BINOP(DIV,
#####MEM[4](
######BINOP(PLUS,
#######TEMP T101,
#######CONST 12)),
#####CONST 10)))
#MOVE(
##TEMP T190,
##BINOP(MINUS,
###MEM[4](
####BINOP(PLUS,
#####TEMP T101,
#####CONST 12)),
###BINOP(MUL,
####BINOP(DIV,
#####MEM[4](
######BINOP(PLUS,
#######TEMP T101,
#######CONST 12)),
#####CONST 10),
####CONST 10)))
#MOVE(
##TEMP T189,
##CALL(
###NAME ord,
####NAME L39))
#MOVE(
##TEMP T188,
##CALL(
###NAME chr,
####BINOP(PLUS,
#####TEMP T190,
#####TEMP T189)))
#MOVE(
##TEMP T187,
##CALL(
###NAME print,
####TEMP T188))
#EXP(
##TEMP T187)
#JUMP(
##NAME L41)
#LABEL L61
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
#LABEL L64
#CJUMP(EQ,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)),
##CONST 0,
##L35,L36)
#LABEL L36
#CJUMP(EQ,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 16)),
##CONST 0,
##L32,L33)
#LABEL L33
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#MOVE(
##TEMP T214,
##MEM[4](
###BINOP(PLUS,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12)),
####BINOP(MUL,
#####CONST 0,
#####CONST 4))))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 16))))
#CJUMP(LT,
##TEMP T214,
##MEM[4](
###BINOP(PLUS,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 16)),
####BINOP(MUL,
#####CONST 0,
#####CONST 4))),
##L29,L30)
#LABEL L30
#MOVE(
##TEMP T117,
##CALL(
###NAME allocRecord,
####CONST 8))
#MOVE(
##TEMP T219,
##BINOP(PLUS,
###TEMP T117,
###CONST 0))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 16))))
#MOVE(
##MEM[4](
###TEMP T219),
##MEM[4](
###BINOP(PLUS,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 16)),
####BINOP(MUL,
#####CONST 0,
#####CONST 4))))
#MOVE(
##TEMP T223,
##BINOP(PLUS,
###TEMP T117,
###CONST 4))
#MOVE(
##TEMP T222,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 8)))
#MOVE(
##TEMP T221,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 16))))
#MOVE(
##TEMP T220,
##CALL(
###NAME L23,
####TEMP T222,
####TEMP T221,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 16)),
######BINOP(MUL,
#######CONST 1,
#######CONST 4)))))
#MOVE(
##MEM[4](
###TEMP T223),
##TEMP T220)
#MOVE(
##TEMP T118,
##TEMP T117)
#LABEL L31
#MOVE(
##TEMP T119,
##TEMP T118)
#LABEL L34
#MOVE(
##TEMP T120,
##TEMP T119)
#LABEL L37
#MOVE(
##TEMP T100,
##TEMP T120)
#JUMP(
##NAME L63)
#LABEL L35
#MOVE(
##TEMP T120,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 16)))
#JUMP(
##NAME L37)
#LABEL L32
#MOVE(
##TEMP T119,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 12)))
#JUMP(
##NAME L34)
#LABEL L29
#MOVE(
##TEMP T116,
##CALL(
###NAME allocRecord,
####CONST 8))
#MOVE(
##TEMP T215,
##BINOP(PLUS,
###TEMP T116,
###CONST 0))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#MOVE(
##MEM[4](
###TEMP T215),
##MEM[4](
###BINOP(PLUS,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12)),
####BINOP(MUL,
#####CONST 0,
#####CONST 4))))
#MOVE(
##TEMP T218,
##BINOP(PLUS,
###TEMP T116,
###CONST 4))
#MOVE(
##TEMP T217,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST 8)))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#MOVE(
##TEMP T216,
##CALL(
###NAME L23,
####TEMP T217,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 12)),
######BINOP(MUL,
#######CONST 1,
#######CONST 4))),
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 16))))
#MOVE(
##MEM[4](
###TEMP T218),
##TEMP T216)
#MOVE(
##TEMP T118,
##TEMP T116)
#JUMP(
##NAME L31)
#LABEL L63
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
#LABEL L66
#MOVE(
##TEMP T286,
##BINOP(PLUS,
###TEMP T101,
###CONST ~404))
#MOVE(
##TEMP T113,
##CALL(
###NAME allocRecord,
####CONST 4))
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T113,
####CONST 0)),
##CONST 0)
#MOVE(
##MEM[4](
###TEMP T286),
##TEMP T113)
#MOVE(
##TEMP T288,
##BINOP(PLUS,
###TEMP T101,
###CONST ~408))
#MOVE(
##TEMP T287,
##CALL(
###NAME L0,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 8)),
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST ~404))))
#MOVE(
##MEM[4](
###TEMP T288),
##TEMP T287)
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST ~404))))
#CJUMP(EQ,
##MEM[4](
###BINOP(PLUS,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST ~404)),
####BINOP(MUL,
#####CONST 0,
#####CONST 4))),
##CONST 0,
##L27,L26)
#LABEL L26
#MOVE(
##TEMP T114,
##CALL(
###NAME allocRecord,
####CONST 8))
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T114,
####CONST 0)),
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~408)))
#MOVE(
##TEMP T290,
##BINOP(PLUS,
###TEMP T114,
###CONST 4))
#MOVE(
##TEMP T289,
##CALL(
###NAME L22,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 8))))
#MOVE(
##MEM[4](
###TEMP T290),
##TEMP T289)
#MOVE(
##TEMP T115,
##TEMP T114)
#LABEL L28
#MOVE(
##TEMP T100,
##TEMP T115)
#JUMP(
##NAME L65)
#LABEL L27
#MOVE(
##TEMP T115,
##CONST 0)
#JUMP(
##NAME L28)
#LABEL L65
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
#LABEL L68
#MOVE(
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~404)),
##CONST 0)
#EXP(
##CALL(
###NAME L2,
####TEMP T101))
#EXP(
##CALL(
###NAME checkNilRecord,
####MEM[4](
#####BINOP(PLUS,
######TEMP T101,
######CONST 12))))
#MOVE(
##TEMP T315,
##BINOP(PLUS,
###MEM[4](
####BINOP(PLUS,
#####TEMP T101,
#####CONST 12)),
###BINOP(MUL,
####CONST 0,
####CONST 4)))
#MOVE(
##TEMP T314,
##CALL(
###NAME L1,
####TEMP T101,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 8)),
######CONST ~404))))
#MOVE(
##MEM[4](
###TEMP T315),
##TEMP T314)
#MOVE(
##TEMP T316,
##CALL(
###NAME L1,
####TEMP T101,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 8)),
######CONST ~404))))
#CJUMP(EQ,
##TEMP T316,
##CONST 0,
##L19,L21)
#LABEL L21
#MOVE(
##TEMP T321,
##BINOP(PLUS,
###TEMP T101,
###CONST ~404))
#MOVE(
##TEMP T318,
##BINOP(MUL,
###MEM[4](
####BINOP(PLUS,
#####TEMP T101,
#####CONST ~404)),
###CONST 10))
#MOVE(
##TEMP T317,
##CALL(
###NAME ord,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 8)),
######CONST ~404))))
#MOVE(
##TEMP T320,
##BINOP(PLUS,
###TEMP T318,
###TEMP T317))
#MOVE(
##TEMP T319,
##CALL(
###NAME ord,
####NAME L20))
#MOVE(
##MEM[4](
###TEMP T321),
##BINOP(MINUS,
###TEMP T320,
###TEMP T319))
#MOVE(
##TEMP T323,
##BINOP(PLUS,
###MEM[4](
####BINOP(PLUS,
#####TEMP T101,
#####CONST 8)),
###CONST ~404))
#MOVE(
##TEMP T322,
##CALL(
###NAME getch))
#MOVE(
##MEM[4](
###TEMP T323),
##TEMP T322)
#MOVE(
##TEMP T324,
##CALL(
###NAME L1,
####TEMP T101,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########TEMP T101,
########CONST 8)),
######CONST ~404))))
#CJUMP(NE,
##TEMP T324,
##CONST 0,
##L21,L19)
#LABEL L19
#MOVE(
##TEMP T100,
##MEM[4](
###BINOP(PLUS,
####TEMP T101,
####CONST ~404)))
#JUMP(
##NAME L67)
#LABEL L67
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
#LABEL L70
#MOVE(
##TEMP T368,
##CALL(
###NAME stringEqual,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########MEM[4](
#########BINOP(PLUS,
##########TEMP T101,
##########CONST 8)),
########CONST 8)),
######CONST ~404)),
####NAME L10))
#CJUMP(EQ,
##TEMP T368,
##CONST 0,
##L13,L12)
#LABEL L12
#MOVE(
##TEMP T111,
##CONST 1)
#LABEL L14
#CJUMP(EQ,
##TEMP T111,
##CONST 0,
##L17,L18)
#LABEL L18
#MOVE(
##TEMP T371,
##BINOP(PLUS,
###MEM[4](
####BINOP(PLUS,
#####MEM[4](
######BINOP(PLUS,
#######TEMP T101,
#######CONST 8)),
#####CONST 8)),
###CONST ~404))
#MOVE(
##TEMP T370,
##CALL(
###NAME getch))
#MOVE(
##MEM[4](
###TEMP T371),
##TEMP T370)
#MOVE(
##TEMP T372,
##CALL(
###NAME stringEqual,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########MEM[4](
#########BINOP(PLUS,
##########TEMP T101,
##########CONST 8)),
########CONST 8)),
######CONST ~404)),
####NAME L10))
#CJUMP(NE,
##TEMP T372,
##CONST 0,
##L12,L13)
#LABEL L13
#MOVE(
##TEMP T112,
##CONST 1)
#MOVE(
##TEMP T369,
##CALL(
###NAME stringEqual,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########MEM[4](
#########BINOP(PLUS,
##########TEMP T101,
##########CONST 8)),
########CONST 8)),
######CONST ~404)),
####NAME L11))
#CJUMP(EQ,
##TEMP T369,
##CONST 0,
##L16,L15)
#LABEL L15
#MOVE(
##TEMP T111,
##TEMP T112)
#JUMP(
##NAME L14)
#LABEL L16
#MOVE(
##TEMP T112,
##CONST 0)
#JUMP(
##NAME L15)
#LABEL L17
#MOVE(
##TEMP T100,
##CONST 0)
#JUMP(
##NAME L69)
#LABEL L69
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
#LABEL L72
#MOVE(
##TEMP T408,
##CALL(
###NAME ord,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########MEM[4](
#########BINOP(PLUS,
##########TEMP T101,
##########CONST 8)),
########CONST 8)),
######CONST ~404))))
#MOVE(
##TEMP T410,
##TEMP T408)
#MOVE(
##TEMP T409,
##CALL(
###NAME ord,
####NAME L3))
#CJUMP(GE,
##TEMP T410,
##TEMP T409,
##L5,L6)
#LABEL L6
#MOVE(
##TEMP T109,
##CONST 0)
#LABEL L7
#MOVE(
##TEMP T100,
##TEMP T109)
#JUMP(
##NAME L71)
#LABEL L5
#MOVE(
##TEMP T110,
##CONST 1)
#MOVE(
##TEMP T411,
##CALL(
###NAME ord,
####MEM[4](
#####BINOP(PLUS,
######MEM[4](
#######BINOP(PLUS,
########MEM[4](
#########BINOP(PLUS,
##########TEMP T101,
##########CONST 8)),
########CONST 8)),
######CONST ~404))))
#MOVE(
##TEMP T413,
##TEMP T411)
#MOVE(
##TEMP T412,
##CALL(
###NAME ord,
####NAME L4))
#CJUMP(LE,
##TEMP T413,
##TEMP T412,
##L8,L9)
#LABEL L9
#MOVE(
##TEMP T110,
##CONST 0)
#LABEL L8
#MOVE(
##TEMP T109,
##TEMP T110)
#JUMP(
##NAME L7)
#LABEL L71
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
