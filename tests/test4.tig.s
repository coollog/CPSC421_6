LABEL L5
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L4)
LABEL L4
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $216, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L5:
	movl $1, %eax                # move to register
	jmp L4                     # jump to L4
L4:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
LABEL L7
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   CONST ~208)),
 CONST 0,
 L1,L2)
LABEL L2
MOVE(
 TEMP T111,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   CONST ~208)))
MOVE(
 TEMP T110,
 CALL(
  NAME L0,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   BINOP(MINUS,
    MEM[4](
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST 8)),
      CONST ~208)),
    CONST 1)))
MOVE(
 TEMP T109,
 BINOP(MUL,
  TEMP T111,
  TEMP T110))
LABEL L3
MOVE(
 TEMP T100,
 TEMP T109)
JUMP(
 NAME L6)
LABEL L1
MOVE(
 TEMP T109,
 CONST 1)
JUMP(
 NAME L3)
LABEL L6
.globl L0
.type L0, @function
L0:
	pushl %ebp                   # save base pointer
	movl %esp, %ebp              # base pointer <- stack pointer
	subl $212, %esp              # allocate space for local variables
	pushl %ebx                   # push callee save
	pushl %edi                   # push callee save
	pushl %esi                   # push callee save
L7:
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $0, %edi                # move constant to register
	cmpl %edi, %ebx              # compare for jump...
	je L1                      # if true: jump to L1
	jmp L2                     # if false: jump to L2
L2:
	movl %ebp, %ebx              # move to register
	movl $8, %edi                # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl -208(%ebx), %edi        # move to register
	movl %ebp, %ebx              # move to register
	movl $8, %esi                # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $-208, %esi             # move constant to register
	addl %esi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebx, %ebx              # move to register
	movl $1, %esi                # move constant to register
	subl %esi, %ebx              # subtract two registers
	pushl %ebx                   # push onto stack
	pushl 8(%ebp)                # push onto stack
	call L0
	addl $8, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %edi, %edi              # move to register
	imull %ebx, %edi             # multiply two registers
	movl %edi, %ebx              # move to register
L3:
	movl %ebx, %eax              # move to register
	jmp L6                     # jump to L6
L1:
	movl $1, %ebx                # move to register
	jmp L3                     # jump to L3
L6:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
