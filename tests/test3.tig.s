LABEL L5
MOVE(
 TEMP T110,
 BINOP(PLUS,
  TEMP T101,
  CONST ~208))
MOVE(
 TEMP T109,
 CALL(
  NAME allocRecord,
   CONST 8))
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T109,
   CONST 0)),
 NAME L0)
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T109,
   CONST 4)),
 CONST 1000)
MOVE(
 MEM[4](
  TEMP T110),
 TEMP T109)
EXP(
 CALL(
  NAME print,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~208)),
     CONST 0))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~208)),
   CONST 0)),
 NAME L2)
EXP(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~208)))
MOVE(
 TEMP T111,
 CALL(
  NAME print,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~208)),
     CONST 0))))
MOVE(
 TEMP T100,
 TEMP T111)
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
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl %ebx, %edi              # move to register
	pushl $8                     # push onto stack
	call allocRecord
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl $L0, 0(%ebx)            # move to memory
	movl $1000, 4(%ebx)          # move to memory
	movl %ebx, (%edi)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl 0(%ebx)                # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl $L2, 0(%ebx)            # move to memory
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	movl %ebp, %ebx              # move to register
	movl $-208, %edi             # move constant to register
	addl %edi, %ebx              # add two registers
	movl (%ebx), %ebx            # fetch from memory
	pushl 0(%ebx)                # push onto stack
	call print
	addl $4, %esp                # pop arguments
	movl %eax, %ebx              # get return value
	movl %ebx, %ebx              # move to register
	movl %ebx, %eax              # move to register
	jmp L4                     # jump to L4
L4:
	popl %esi                    # pop callee save
	popl %edi                    # pop callee save
	popl %ebx                    # pop callee save
	movl %ebp, %esp              # deallocate frame
	popl %ebp                    # restore base pointer
	ret
L3:
	.long 8
	.byte 83, 111, 109, 101, 98, 111, 100, 121, 0
L2:
	.long 8
	.byte 83, 111, 109, 101, 98, 111, 100, 121, 0
L1:
	.long 6
	.byte 78, 111, 98, 111, 100, 121, 0
L0:
	.long 6
	.byte 78, 111, 98, 111, 100, 121, 0
