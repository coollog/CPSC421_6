LABEL L7
MOVE(
 TEMP T115,
 CALL(
  NAME L5,
   TEMP T101,
   CONST 10))
EXP(
 CALL(
  NAME printNum,
   TEMP T115))
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L6)
LABEL L6
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L7:
	pushl $10                    # push onto stack
	pushl %ebp                   # push onto stack
	call L5
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	pushl %ebx                   # push onto stack
	call printNum
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $1, %eax                # move to register
	jmp L6                     # jump to L6
L6:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
LABEL L9
MOVE(
 TEMP T100,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST 12)))
JUMP(
 NAME L8)
LABEL L8
.globl L5
.type L5, @function
L5:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L9:
	movl 12(%ebp), %eax          # move to register
	jmp L8                     # jump to L8
L8:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
