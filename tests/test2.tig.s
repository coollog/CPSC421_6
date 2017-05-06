LABEL L3
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~208)))
MOVE(
 TEMP T100,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~208)),
   BINOP(MUL,
    CONST 9,
    CONST 4))))
JUMP(
 NAME L2)
LABEL L2
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $216, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L3:
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebp, %edi              # move to register
	movl $-208, %ebx             # move constant to register
	addl %ebx, %edi              # add two registers
	movl (%edi), %ebx            # fetch from memory
	movl $9, %edi                # move constant to register
	movl (%ebx, %edi, 4), %eax   # move to register
	jmp L2                     # jump to L2
L2:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
