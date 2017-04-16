LABEL L112
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 CONST 8)
MOVE(
 TEMP T982,
 BINOP(PLUS,
  TEMP T101,
  CONST ~408))
MOVE(
 TEMP T981,
 CALL(
  NAME initArray,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~404)),
   CONST 0))
MOVE(
 MEM[4](
  TEMP T982),
 TEMP T981)
MOVE(
 TEMP T984,
 BINOP(PLUS,
  TEMP T101,
  CONST ~412))
MOVE(
 TEMP T983,
 CALL(
  NAME initArray,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~404)),
   CONST 0))
MOVE(
 MEM[4](
  TEMP T984),
 TEMP T983)
MOVE(
 TEMP T986,
 BINOP(PLUS,
  TEMP T101,
  CONST ~416))
MOVE(
 TEMP T985,
 CALL(
  NAME initArray,
   BINOP(MINUS,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404))),
    CONST 1),
   CONST 0))
MOVE(
 MEM[4](
  TEMP T986),
 TEMP T985)
MOVE(
 TEMP T988,
 BINOP(PLUS,
  TEMP T101,
  CONST ~420))
MOVE(
 TEMP T987,
 CALL(
  NAME initArray,
   BINOP(MINUS,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404))),
    CONST 1),
   CONST 0))
MOVE(
 MEM[4](
  TEMP T988),
 TEMP T987)
EXP(
 CALL(
  NAME L79,
   TEMP T101,
   CONST 0))
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L111)
LABEL L111
.globl tigermain
.type tigermain, @function
tigermain:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $420, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L112:
	movl $8, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl -404(%ebp)							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl -404(%ebp)							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $1, %edi							# move constant to register
	subl %edi, %ebx							# subtract two registers
	pushl %ebx							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %ebx							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $1, %edi							# move constant to register
	subl %edi, %ebx							# subtract two registers
	pushl %ebx							# push onto stack
	call initArray
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, (%ebx)							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $0							# push onto stack
	pushl %ebp							# push onto stack
	call L79
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl $1, %eax							# move to register
	jmp L111							# jump to L111
L111:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
LABEL L114
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST 12)),
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   CONST ~404)),
 L108,L109)
LABEL L109
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 CONST 0)
CJUMP(
LE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 BINOP(MINUS,
  MEM[4](
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 8)),
    CONST ~404)),
  CONST 1),
 L106,L93)
LABEL L93
MOVE(
 TEMP T980,
 CONST 0)
LABEL L110
MOVE(
 TEMP T100,
 TEMP T980)
JUMP(
 NAME L113)
LABEL L108
MOVE(
 TEMP T980,
 CALL(
  NAME L78,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8))))
JUMP(
 NAME L110)
LABEL L106
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~408)),
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~404))))
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~408)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    CONST 4))),
 CONST 0,
 L94,L95)
LABEL L95
MOVE(
 TEMP T976,
 CONST 0)
LABEL L96
CJUMP(
EQ,
 TEMP T976,
 CONST 0,
 L100,L99)
LABEL L99
MOVE(
 TEMP T979,
 CONST 1)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~420)),
   BINOP(MINUS,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     CONST 7),
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)))))
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~420)),
   BINOP(MUL,
    BINOP(MINUS,
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST ~404)),
      CONST 7),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 12))),
    CONST 4))),
 CONST 0,
 L102,L103)
LABEL L103
MOVE(
 TEMP T979,
 CONST 0)
LABEL L102
MOVE(
 TEMP T978,
 TEMP T979)
LABEL L101
CJUMP(
EQ,
 TEMP T978,
 CONST 0,
 L105,L104)
LABEL L104
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~408)),
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~404))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~408)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    CONST 4))),
 CONST 1)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~416)),
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~416)),
   BINOP(MUL,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 12))),
    CONST 4))),
 CONST 1)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~420)),
   BINOP(MINUS,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     CONST 7),
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~420)),
   BINOP(MUL,
    BINOP(MINUS,
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST ~404)),
      CONST 7),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 12))),
    CONST 4))),
 CONST 1)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~412)),
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 12))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~412)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)),
    CONST 4))),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)))
EXP(
 CALL(
  NAME L79,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)),
    CONST 1)))
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~408)),
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~404))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~408)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    CONST 4))),
 CONST 0)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~416)),
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~416)),
   BINOP(MUL,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 12))),
    CONST 4))),
 CONST 0)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~420)),
   BINOP(MINUS,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     CONST 7),
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)))))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~420)),
   BINOP(MUL,
    BINOP(MINUS,
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST ~404)),
      CONST 7),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 12))),
    CONST 4))),
 CONST 0)
LABEL L105
CJUMP(
GE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 BINOP(MINUS,
  MEM[4](
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 8)),
    CONST ~404)),
  CONST 1),
 L93,L107)
LABEL L107
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 BINOP(PLUS,
  MEM[4](
   BINOP(PLUS,
    TEMP T101,
    CONST ~404)),
  CONST 1))
JUMP(
 NAME L106)
LABEL L94
MOVE(
 TEMP T977,
 CONST 1)
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~416)),
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 12)))))
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~416)),
   BINOP(MUL,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~404)),
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 12))),
    CONST 4))),
 CONST 0,
 L97,L98)
LABEL L98
MOVE(
 TEMP T977,
 CONST 0)
LABEL L97
MOVE(
 TEMP T976,
 TEMP T977)
JUMP(
 NAME L96)
LABEL L100
MOVE(
 TEMP T978,
 CONST 0)
JUMP(
 NAME L101)
LABEL L113
.globl L79
.type L79, @function
L79:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $404, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L114:
	movl %ebp, %ebx							# move to register
	movl $12, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	cmpl %edi, %ebx							# compare for jump...
je L108							# if true: jump to L108
	jmp L109							# if false: jump to L109
L109:
	movl $0, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
jle L106							# if true: jump to L106
	jmp L93							# if false: jump to L93
L93:
	movl $0, %ebx							# move to register
L110:
	movl %ebx, %eax							# move to register
	jmp L113							# jump to L113
L108:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl 8(%ebp)							# push onto stack
	call L78
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	jmp L110							# jump to L110
L106:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
je L94							# if true: jump to L94
	jmp L95							# if false: jump to L95
L95:
	movl $0, %ebx							# move to register
L96:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
je L100							# if true: jump to L100
	jmp L99							# if false: jump to L99
L99:
	movl $1, %edi							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %esi							# subtract two registers
	pushl %esi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %esi							# subtract two registers
	movl %esi, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	movl	-4(%ebp), %edx							# load pseudo-register
	addl %ebx, %edx							# add two registers
	movl	%edx, -4(%ebp)							# save pseudo-register
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ebx							# fetch from memory
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
je L102							# if true: jump to L102
	jmp L103							# if false: jump to L103
L103:
	movl $0, %edi							# move to register
L102:
	movl %edi, %ebx							# move to register
L101:
	movl $0, %edi							# move constant to register
	cmpl %ebx, %edi							# compare for jump...
je L105							# if true: jump to L105
	jmp L104							# if false: jump to L104
L104:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $1, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $1, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $1, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl 12(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %esi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	imull %ecx, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl %esi, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $12, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	pushl %ebx							# push onto stack
	pushl 8(%ebp)							# push onto stack
	call L79
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %ebx							# fetch from memory
	movl $0, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %edi							# add two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $0, %ebx							# move to memory
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	pushl %edi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-420, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $7, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	subl %ebx, %edi							# subtract two registers
	movl %edi, %ebx							# move to register
	movl $4, %edi							# move constant to register
	imull %edi, %ebx							# multiply two registers
	addl %ebx, %esi							# add two registers
	movl (%esi), %ebx							# fetch from memory
	movl $0, %ebx							# move to memory
L105:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
jge L93							# if true: jump to L93
	jmp L107							# if false: jump to L107
L107:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L106							# jump to L106
L94:
	movl $1, %edi							# move to register
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl	-4(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %esi							# add two registers
	pushl %esi							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-416, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ecx							# move to register
	movl	%ecx, -4(%ebp)							# save pseudo-register

	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %esi							# move to register
	movl %ebp, %ebx							# move to register
	movl $12, %ecx							# move constant to register
	movl	%ecx, -8(%ebp)							# save pseudo-register

	movl	-8(%ebp), %ecx							# load pseudo-register
	addl %ecx, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	addl %ebx, %esi							# add two registers
	movl %esi, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	movl	-4(%ebp), %edx							# load pseudo-register
	addl %ebx, %edx							# add two registers
	movl	%edx, -4(%ebp)							# save pseudo-register
	movl	-4(%ebp), %ecx							# load pseudo-register
	movl (%ecx), %ebx							# fetch from memory
	movl $0, %esi							# move constant to register
	cmpl %ebx, %esi							# compare for jump...
je L97							# if true: jump to L97
	jmp L98							# if false: jump to L98
L98:
	movl $0, %edi							# move to register
L97:
	movl %edi, %ebx							# move to register
	jmp L96							# jump to L96
L100:
	movl $0, %ebx							# move to register
	jmp L101							# jump to L101
L113:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
LABEL L116
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 CONST 0)
CJUMP(
LE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 BINOP(MINUS,
  MEM[4](
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 8)),
    CONST ~404)),
  CONST 1),
 L90,L80)
LABEL L80
MOVE(
 TEMP T1350,
 CALL(
  NAME print,
   NAME L92))
MOVE(
 TEMP T100,
 TEMP T1350)
JUMP(
 NAME L115)
LABEL L90
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~408)),
 CONST 0)
CJUMP(
LE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~408)),
 BINOP(MINUS,
  MEM[4](
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 8)),
    CONST ~404)),
  CONST 1),
 L87,L81)
LABEL L81
MOVE(
 TEMP T1349,
 CALL(
  NAME print,
   NAME L89))
EXP(
 TEMP T1349)
CJUMP(
GE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 BINOP(MINUS,
  MEM[4](
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 8)),
    CONST ~404)),
  CONST 1),
 L80,L91)
LABEL L91
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~404)),
 BINOP(PLUS,
  MEM[4](
   BINOP(PLUS,
    TEMP T101,
    CONST ~404)),
  CONST 1))
JUMP(
 NAME L90)
LABEL L87
EXP(
 CALL(
  NAME checkArrayBounds,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~412)),
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST ~404))))
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~412)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~404)),
    CONST 4))),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~408)),
 L84,L85)
LABEL L85
MOVE(
 TEMP T975,
 NAME L83)
LABEL L86
EXP(
 CALL(
  NAME print,
   TEMP T975))
CJUMP(
GE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~408)),
 BINOP(MINUS,
  MEM[4](
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST 8)),
    CONST ~404)),
  CONST 1),
 L81,L88)
LABEL L88
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~408)),
 BINOP(PLUS,
  MEM[4](
   BINOP(PLUS,
    TEMP T101,
    CONST ~408)),
  CONST 1))
JUMP(
 NAME L87)
LABEL L84
MOVE(
 TEMP T975,
 NAME L82)
JUMP(
 NAME L86)
LABEL L115
.globl L78
.type L78, @function
L78:
	pushl %ebp							# save base pointer
	movl %esp, %ebp							# base pointer <- stack pointer
	subl $408, %esp							# allocate space for local variables
	pushl %ebx							# push callee save
	pushl %edi							# push callee save
	pushl %esi							# push callee save
L116:
	movl $0, -404(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
jle L90							# if true: jump to L90
	jmp L80							# if false: jump to L80
L80:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L92							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebx, %eax							# move to register
	jmp L115							# jump to L115
L90:
	movl $0, -408(%ebp)							# move to memory
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
jle L87							# if true: jump to L87
	jmp L81							# if false: jump to L81
L81:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl $L89							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebx, %ebx							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
jge L80							# if true: jump to L80
	jmp L91							# if false: jump to L91
L91:
	movl %ebp, %ebx							# move to register
	movl $-404, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -404(%ebp)							# move to memory
	jmp L90							# jump to L90
L87:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl -404(%ebp)							# push onto stack
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	pushl %ebx							# push onto stack
	call checkArrayBounds
	addl $8, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $8, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-412, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %edi							# move to register
	movl %ebp, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $4, %esi							# move constant to register
	imull %esi, %ebx							# multiply two registers
	addl %ebx, %edi							# add two registers
	movl (%edi), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $-408, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	cmpl %edi, %ebx							# compare for jump...
je L84							# if true: jump to L84
	jmp L85							# if false: jump to L85
L85:
	movl $L83, %ebx							# move to register
L86:
	pushl %eax							# save caller save
	pushl %ecx							# save caller save
	pushl %edx							# save caller save
	pushl %ebx							# push onto stack
	call print
	addl $4, %esp							# pop arguments
	movl %eax, %ebx							# get return value
	popl %edx							# restore caller save
	popl %ecx							# restore caller save
	popl %eax							# restore caller save
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %edi							# fetch from memory
	movl %ebp, %ebx							# move to register
	movl $8, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $-404, %esi							# move constant to register
	addl %esi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %esi							# move constant to register
	subl %esi, %ebx							# subtract two registers
	cmpl %edi, %ebx							# compare for jump...
jge L81							# if true: jump to L81
	jmp L88							# if false: jump to L88
L88:
	movl %ebp, %ebx							# move to register
	movl $-408, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl (%ebx), %ebx							# fetch from memory
	movl %ebx, %ebx							# move to register
	movl $1, %edi							# move constant to register
	addl %edi, %ebx							# add two registers
	movl %ebx, -408(%ebp)							# move to memory
	jmp L87							# jump to L87
L84:
	movl $L82, %ebx							# move to register
	jmp L86							# jump to L86
L115:
	popl %esi							# pop callee save
	popl %edi							# pop callee save
	popl %ebx							# pop callee save
	movl %ebp, %esp							# deallocate frame
	popl %ebp							# restore base pointer
	ret
L92:
	.long 1
	.byte 10, 0
L89:
	.long 1
	.byte 10, 0
L83:
	.long 2
	.byte 32, 46, 0
L82:
	.long 2
	.byte 32, 79, 0
