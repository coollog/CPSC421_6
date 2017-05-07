LABEL L2
MOVE(
 TEMP T109,
 CALL(
  NAME L0,
   TEMP T101,
   CONST 10))
EXP(
 CALL(
  NAME printNum,
   TEMP T109))
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L1)
LABEL L1
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L2:
	pushl $10                    # push onto stack
	pushl %ebp                   # push onto stack
	call L0
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	pushl %ebx                   # push onto stack
	call printNum
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl $1, %eax                # move to register
	jmp L1                     # jump to L1
L1:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
LABEL L4
MOVE(
 TEMP T100,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   CONST 12)))
JUMP(
 NAME L3)
LABEL L3
.globl L0
.type L0, @function
L0:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L4:
	movl %ebp, %edi              # move to register
	movl $8, %ebx                # move constant to register
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl 12(%ebx), %eax          # move to register
	jmp L3                     # jump to L3
L3:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
