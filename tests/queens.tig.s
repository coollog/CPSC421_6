LABEL L1842
EXP(
 CALL(
  NAME L1,
   TEMP T101,
   CONST 0))
MOVE(
 TEMP T100,
 CONST 1)
JUMP(
 NAME L1841)
LABEL L1841
L1842:
	pushl $0                     # push onto stack
	pushl t101                   # push onto stack
	call L1
	addl $8, t102                # pop arguments
	movl t100, t440              # get return value
	movl $1, t100                # move to register
	jmp L1841                     # jump to L1841
L1841:
LABEL L1844
CJUMP(
EQ,
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   CONST ~228)),
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   CONST ~208)),
 L1838,L1839)
LABEL L1839
LABEL L1836
CJUMP(
LE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~224)),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~228)),
 L1837,L1771)
LABEL L1771
MOVE(
 TEMP T439,
 CONST 0)
LABEL L1840
MOVE(
 TEMP T100,
 TEMP T439)
JUMP(
 NAME L1843)
LABEL L1838
MOVE(
 TEMP T439,
 CALL(
  NAME L0,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8))))
JUMP(
 NAME L1840)
LABEL L1837
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
     CONST ~212)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~220)),
    CONST 4))),
 CONST 0,
 L1792,L1793)
LABEL L1793
MOVE(
 TEMP T421,
 CONST 0)
LABEL L1794
CJUMP(
NE,
 TEMP T421,
 CONST 0,
 L1797,L1798)
LABEL L1798
MOVE(
 TEMP T423,
 CONST 0)
LABEL L1799
CJUMP(
NE,
 TEMP T423,
 CONST 0,
 L1802,L1803)
LABEL L1803
EXP(
 TEMP T425)
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~224)),
 BINOP(PLUS,
  MEM[4](
   BINOP(PLUS,
    TEMP T101,
    CONST ~224)),
  CONST 1))
JUMP(
 NAME L1836)
LABEL L1792
MOVE(
 TEMP T422,
 CONST 1)
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
     CONST ~220)),
   BINOP(MUL,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~220)),
     MEM[4](
      BINOP(PLUS,
       MEM[4](
        BINOP(PLUS,
         TEMP T101,
         CONST 8)),
       CONST ~228))),
    CONST 4))),
 CONST 0,
 L1795,L1796)
LABEL L1796
MOVE(
 TEMP T422,
 CONST 0)
LABEL L1795
MOVE(
 TEMP T421,
 TEMP T422)
JUMP(
 NAME L1794)
LABEL L1797
MOVE(
 TEMP T424,
 CONST 1)
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
     CONST ~224)),
   BINOP(MUL,
    BINOP(MINUS,
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST ~220)),
      CONST 7),
     MEM[4](
      BINOP(PLUS,
       MEM[4](
        BINOP(PLUS,
         TEMP T101,
         CONST 8)),
       CONST ~228))),
    CONST 4))),
 CONST 0,
 L1800,L1801)
LABEL L1801
MOVE(
 TEMP T424,
 CONST 0)
LABEL L1800
MOVE(
 TEMP T423,
 TEMP T424)
JUMP(
 NAME L1799)
LABEL L1802
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~212)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~220)),
    CONST 4))),
 CONST 1)
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~220)),
   BINOP(MUL,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~220)),
     MEM[4](
      BINOP(PLUS,
       MEM[4](
        BINOP(PLUS,
         TEMP T101,
         CONST 8)),
       CONST ~228))),
    CONST 4))),
 CONST 1)
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~224)),
   BINOP(MUL,
    BINOP(MINUS,
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST ~220)),
      CONST 7),
     MEM[4](
      BINOP(PLUS,
       MEM[4](
        BINOP(PLUS,
         TEMP T101,
         CONST 8)),
       CONST ~228))),
    CONST 4))),
 CONST 1)
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~216)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST 8)),
      CONST ~228)),
    CONST 4))),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~220)))
EXP(
 CALL(
  NAME L1,
   MEM[4](
    BINOP(PLUS,
     TEMP T101,
     CONST 8)),
   BINOP(PLUS,
    MEM[4](
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST 8)),
      CONST ~228)),
    CONST 1)))
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~212)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~220)),
    CONST 4))),
 CONST 0)
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~220)),
   BINOP(MUL,
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST ~220)),
     MEM[4](
      BINOP(PLUS,
       MEM[4](
        BINOP(PLUS,
         TEMP T101,
         CONST 8)),
       CONST ~228))),
    CONST 4))),
 CONST 0)
MOVE(
 MEM[4](
  BINOP(PLUS,
   MEM[4](
    BINOP(PLUS,
     MEM[4](
      BINOP(PLUS,
       TEMP T101,
       CONST 8)),
     CONST ~224)),
   BINOP(MUL,
    BINOP(MINUS,
     BINOP(PLUS,
      MEM[4](
       BINOP(PLUS,
        TEMP T101,
        CONST ~220)),
      CONST 7),
     MEM[4](
      BINOP(PLUS,
       MEM[4](
        BINOP(PLUS,
         TEMP T101,
         CONST 8)),
       CONST ~228))),
    CONST 4))),
 CONST 0)
MOVE(
 TEMP T425,
 CONST 0)
JUMP(
 NAME L1803)
LABEL L1843
L1844:
	movl t101, t442              # move to register
	movl $8, t443                # move constant to register
	addl t443, t442              # add two registers
	movl (t442), t444            # fetch from memory
	movl t444, t441              # move to register
	movl $-228, t445             # move constant to register
	addl t445, t441              # add two registers
	movl (t441), t446            # fetch from memory
	movl t101, t448              # move to register
	movl $8, t449                # move constant to register
	addl t449, t448              # add two registers
	movl (t448), t450            # fetch from memory
	movl t450, t447              # move to register
	movl $-208, t451             # move constant to register
	addl t451, t447              # add two registers
	movl (t447), t452            # fetch from memory
	cmpl t452, t446              # compare for jump...
	je L1838                      # if true: jump to L1838
	jmp L1839                     # if false: jump to L1839
L1839:
L1836:
	movl t101, t453              # move to register
	movl $-224, t454             # move constant to register
	addl t454, t453              # add two registers
	movl (t453), t455            # fetch from memory
	movl t101, t456              # move to register
	movl $-228, t457             # move constant to register
	addl t457, t456              # add two registers
	movl (t456), t458            # fetch from memory
	cmpl t458, t455              # compare for jump...
	jle L1837                     # if true: jump to L1837
	jmp L1771                     # if false: jump to L1771
L1771:
	movl $0, t439                # move to register
L1840:
	movl t439, t100              # move to register
	jmp L1843                     # jump to L1843
L1838:
	pushl 8(t101)                # push onto stack
	call L0
	addl $4, t102                # pop arguments
	movl t100, t459              # get return value
	movl t459, t439              # move to register
	jmp L1840                     # jump to L1840
L1837:
	movl t101, t462              # move to register
	movl $8, t463                # move constant to register
	addl t463, t462              # add two registers
	movl (t462), t464            # fetch from memory
	movl t464, t461              # move to register
	movl $-212, t465             # move constant to register
	addl t465, t461              # add two registers
	movl (t461), t466            # fetch from memory
	movl t466, t460              # move to register
	movl t101, t468              # move to register
	movl $-220, t469             # move constant to register
	addl t469, t468              # add two registers
	movl (t468), t470            # fetch from memory
	movl t470, t467              # move to register
	movl $4, t471                # move constant to register
	imull t471, t467             # multiply two registers
	addl t467, t460              # add two registers
	movl (t460), t472            # fetch from memory
	movl $0, t473                # move constant to register
	cmpl t473, t472              # compare for jump...
	je L1792                      # if true: jump to L1792
	jmp L1793                     # if false: jump to L1793
L1793:
	movl $0, t421                # move to register
L1794:
	movl $0, t474                # move constant to register
	cmpl t474, t421              # compare for jump...
	jne L1797                     # if true: jump to L1797
	jmp L1798                     # if false: jump to L1798
L1798:
	movl $0, t423                # move to register
L1799:
	movl $0, t475                # move constant to register
	cmpl t475, t423              # compare for jump...
	jne L1802                     # if true: jump to L1802
	jmp L1803                     # if false: jump to L1803
L1803:
	movl t101, t477              # move to register
	movl $-224, t478             # move constant to register
	addl t478, t477              # add two registers
	movl (t477), t479            # fetch from memory
	movl t479, t476              # move to register
	movl $1, t480                # move constant to register
	addl t480, t476              # add two registers
	movl t476, -224(t101)        # move to memory
	jmp L1836                     # jump to L1836
L1792:
	movl $1, t422                # move to register
	movl t101, t483              # move to register
	movl $8, t484                # move constant to register
	addl t484, t483              # add two registers
	movl (t483), t485            # fetch from memory
	movl t485, t482              # move to register
	movl $-220, t486             # move constant to register
	addl t486, t482              # add two registers
	movl (t482), t487            # fetch from memory
	movl t487, t481              # move to register
	movl t101, t490              # move to register
	movl $-220, t491             # move constant to register
	addl t491, t490              # add two registers
	movl (t490), t492            # fetch from memory
	movl t492, t489              # move to register
	movl t101, t494              # move to register
	movl $8, t495                # move constant to register
	addl t495, t494              # add two registers
	movl (t494), t496            # fetch from memory
	movl t496, t493              # move to register
	movl $-228, t497             # move constant to register
	addl t497, t493              # add two registers
	movl (t493), t498            # fetch from memory
	addl t498, t489              # add two registers
	movl t489, t488              # move to register
	movl $4, t499                # move constant to register
	imull t499, t488             # multiply two registers
	addl t488, t481              # add two registers
	movl (t481), t500            # fetch from memory
	movl $0, t501                # move constant to register
	cmpl t501, t500              # compare for jump...
	je L1795                      # if true: jump to L1795
	jmp L1796                     # if false: jump to L1796
L1796:
	movl $0, t422                # move to register
L1795:
	movl t422, t421              # move to register
	jmp L1794                     # jump to L1794
L1797:
	movl $1, t424                # move to register
	movl t101, t504              # move to register
	movl $8, t505                # move constant to register
	addl t505, t504              # add two registers
	movl (t504), t506            # fetch from memory
	movl t506, t503              # move to register
	movl $-224, t507             # move constant to register
	addl t507, t503              # add two registers
	movl (t503), t508            # fetch from memory
	movl t508, t502              # move to register
	movl t101, t512              # move to register
	movl $-220, t513             # move constant to register
	addl t513, t512              # add two registers
	movl (t512), t514            # fetch from memory
	movl t514, t511              # move to register
	movl $7, t515                # move constant to register
	addl t515, t511              # add two registers
	movl t511, t510              # move to register
	movl t101, t517              # move to register
	movl $8, t518                # move constant to register
	addl t518, t517              # add two registers
	movl (t517), t519            # fetch from memory
	movl t519, t516              # move to register
	movl $-228, t520             # move constant to register
	addl t520, t516              # add two registers
	movl (t516), t521            # fetch from memory
	subl t521, t510              # subtract two registers
	movl t510, t509              # move to register
	movl $4, t522                # move constant to register
	imull t522, t509             # multiply two registers
	addl t509, t502              # add two registers
	movl (t502), t523            # fetch from memory
	movl $0, t524                # move constant to register
	cmpl t524, t523              # compare for jump...
	je L1800                      # if true: jump to L1800
	jmp L1801                     # if false: jump to L1801
L1801:
	movl $0, t424                # move to register
L1800:
	movl t424, t423              # move to register
	jmp L1799                     # jump to L1799
L1802:
	movl t101, t526              # move to register
	movl $8, t527                # move constant to register
	addl t527, t526              # add two registers
	movl (t526), t528            # fetch from memory
	movl t528, t525              # move to register
	movl $-212, t529             # move constant to register
	addl t529, t525              # add two registers
	movl (t525), t530            # fetch from memory
	movl t101, t531              # move to register
	movl $-220, t532             # move constant to register
	addl t532, t531              # add two registers
	movl (t531), t533            # fetch from memory
	movl $1, (t530, t533, 4)     # move to memory
	movl t101, t535              # move to register
	movl $8, t536                # move constant to register
	addl t536, t535              # add two registers
	movl (t535), t537            # fetch from memory
	movl t537, t534              # move to register
	movl $-220, t538             # move constant to register
	addl t538, t534              # add two registers
	movl (t534), t539            # fetch from memory
	movl t101, t541              # move to register
	movl $-220, t542             # move constant to register
	addl t542, t541              # add two registers
	movl (t541), t543            # fetch from memory
	movl t543, t540              # move to register
	movl t101, t545              # move to register
	movl $8, t546                # move constant to register
	addl t546, t545              # add two registers
	movl (t545), t547            # fetch from memory
	movl t547, t544              # move to register
	movl $-228, t548             # move constant to register
	addl t548, t544              # add two registers
	movl (t544), t549            # fetch from memory
	addl t549, t540              # add two registers
	movl $1, (t539, t540, 4)     # move to memory
	movl t101, t551              # move to register
	movl $8, t552                # move constant to register
	addl t552, t551              # add two registers
	movl (t551), t553            # fetch from memory
	movl t553, t550              # move to register
	movl $-224, t554             # move constant to register
	addl t554, t550              # add two registers
	movl (t550), t555            # fetch from memory
	movl t101, t558              # move to register
	movl $-220, t559             # move constant to register
	addl t559, t558              # add two registers
	movl (t558), t560            # fetch from memory
	movl t560, t557              # move to register
	movl $7, t561                # move constant to register
	addl t561, t557              # add two registers
	movl t557, t556              # move to register
	movl t101, t563              # move to register
	movl $8, t564                # move constant to register
	addl t564, t563              # add two registers
	movl (t563), t565            # fetch from memory
	movl t565, t562              # move to register
	movl $-228, t566             # move constant to register
	addl t566, t562              # add two registers
	movl (t562), t567            # fetch from memory
	subl t567, t556              # subtract two registers
	movl $1, (t555, t556, 4)     # move to memory
	movl t101, t569              # move to register
	movl $8, t570                # move constant to register
	addl t570, t569              # add two registers
	movl (t569), t571            # fetch from memory
	movl t571, t568              # move to register
	movl $-216, t572             # move constant to register
	addl t572, t568              # add two registers
	movl (t568), t573            # fetch from memory
	movl t101, t575              # move to register
	movl $8, t576                # move constant to register
	addl t576, t575              # add two registers
	movl (t575), t577            # fetch from memory
	movl t577, t574              # move to register
	movl $-228, t578             # move constant to register
	addl t578, t574              # add two registers
	movl (t574), t579            # fetch from memory
	movl t101, t580              # move to register
	movl $-220, t581             # move constant to register
	addl t581, t580              # add two registers
	movl (t580), t582            # fetch from memory
	movl t582, (t573, t579, 4)   # move to memory
	movl t101, t586              # move to register
	movl $8, t587                # move constant to register
	addl t587, t586              # add two registers
	movl (t586), t588            # fetch from memory
	movl t588, t585              # move to register
	movl $-228, t589             # move constant to register
	addl t589, t585              # add two registers
	movl (t585), t590            # fetch from memory
	movl t590, t584              # move to register
	movl $1, t591                # move constant to register
	addl t591, t584              # add two registers
	pushl t584                   # push onto stack
	pushl 8(t101)                # push onto stack
	call L1
	addl $8, t102                # pop arguments
	movl t100, t583              # get return value
	movl t101, t593              # move to register
	movl $8, t594                # move constant to register
	addl t594, t593              # add two registers
	movl (t593), t595            # fetch from memory
	movl t595, t592              # move to register
	movl $-212, t596             # move constant to register
	addl t596, t592              # add two registers
	movl (t592), t597            # fetch from memory
	movl t101, t598              # move to register
	movl $-220, t599             # move constant to register
	addl t599, t598              # add two registers
	movl (t598), t600            # fetch from memory
	movl $0, (t597, t600, 4)     # move to memory
	movl t101, t602              # move to register
	movl $8, t603                # move constant to register
	addl t603, t602              # add two registers
	movl (t602), t604            # fetch from memory
	movl t604, t601              # move to register
	movl $-220, t605             # move constant to register
	addl t605, t601              # add two registers
	movl (t601), t606            # fetch from memory
	movl t101, t608              # move to register
	movl $-220, t609             # move constant to register
	addl t609, t608              # add two registers
	movl (t608), t610            # fetch from memory
	movl t610, t607              # move to register
	movl t101, t612              # move to register
	movl $8, t613                # move constant to register
	addl t613, t612              # add two registers
	movl (t612), t614            # fetch from memory
	movl t614, t611              # move to register
	movl $-228, t615             # move constant to register
	addl t615, t611              # add two registers
	movl (t611), t616            # fetch from memory
	addl t616, t607              # add two registers
	movl $0, (t606, t607, 4)     # move to memory
	movl t101, t618              # move to register
	movl $8, t619                # move constant to register
	addl t619, t618              # add two registers
	movl (t618), t620            # fetch from memory
	movl t620, t617              # move to register
	movl $-224, t621             # move constant to register
	addl t621, t617              # add two registers
	movl (t617), t622            # fetch from memory
	movl t101, t625              # move to register
	movl $-220, t626             # move constant to register
	addl t626, t625              # add two registers
	movl (t625), t627            # fetch from memory
	movl t627, t624              # move to register
	movl $7, t628                # move constant to register
	addl t628, t624              # add two registers
	movl t624, t623              # move to register
	movl t101, t630              # move to register
	movl $8, t631                # move constant to register
	addl t631, t630              # add two registers
	movl (t630), t632            # fetch from memory
	movl t632, t629              # move to register
	movl $-228, t633             # move constant to register
	addl t633, t629              # add two registers
	movl (t629), t634            # fetch from memory
	subl t634, t623              # subtract two registers
	movl $0, (t622, t623, 4)     # move to memory
	movl $0, t425                # move to register
	jmp L1803                     # jump to L1803
L1843:
LABEL L753
CJUMP(
LE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~236)),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~240)),
 L754,L452)
LABEL L452
MOVE(
 TEMP T636,
 CALL(
  NAME print,
   NAME L756))
MOVE(
 TEMP T100,
 TEMP T636)
JUMP(
 NAME L1845)
LABEL L754
LABEL L524
CJUMP(
LE,
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~296)),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~300)),
 L525,L495)
LABEL L495
MOVE(
 TEMP T635,
 CALL(
  NAME print,
   NAME L527))
EXP(
 TEMP T635)
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~236)),
 BINOP(PLUS,
  MEM[4](
   BINOP(PLUS,
    TEMP T101,
    CONST ~236)),
  CONST 1))
JUMP(
 NAME L753)
LABEL L525
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
     CONST ~216)),
   BINOP(MUL,
    MEM[4](
     BINOP(PLUS,
      TEMP T101,
      CONST ~296)),
    CONST 4))),
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~292)),
 L507,L508)
LABEL L508
MOVE(
 TEMP T176,
 NAME L506)
LABEL L509
EXP(
 CALL(
  NAME print,
   TEMP T176))
MOVE(
 MEM[4](
  BINOP(PLUS,
   TEMP T101,
   CONST ~296)),
 BINOP(PLUS,
  MEM[4](
   BINOP(PLUS,
    TEMP T101,
    CONST ~296)),
  CONST 1))
JUMP(
 NAME L524)
LABEL L507
MOVE(
 TEMP T176,
 NAME L505)
JUMP(
 NAME L509)
LABEL L1845
L753:
	movl t101, t637              # move to register
	movl $-236, t638             # move constant to register
	addl t638, t637              # add two registers
	movl (t637), t639            # fetch from memory
	movl t101, t640              # move to register
	movl $-240, t641             # move constant to register
	addl t641, t640              # add two registers
	movl (t640), t642            # fetch from memory
	cmpl t642, t639              # compare for jump...
	jle L754                     # if true: jump to L754
	jmp L452                     # if false: jump to L452
L452:
	pushl $L756                  # push onto stack
	call print
	addl $4, t102                # pop arguments
	movl t100, t643              # get return value
	movl t643, t636              # move to register
	movl t636, t100              # move to register
	jmp L1845                     # jump to L1845
L754:
L524:
	movl t101, t644              # move to register
	movl $-296, t645             # move constant to register
	addl t645, t644              # add two registers
	movl (t644), t646            # fetch from memory
	movl t101, t647              # move to register
	movl $-300, t648             # move constant to register
	addl t648, t647              # add two registers
	movl (t647), t649            # fetch from memory
	cmpl t649, t646              # compare for jump...
	jle L525                     # if true: jump to L525
	jmp L495                     # if false: jump to L495
L495:
	pushl $L527                  # push onto stack
	call print
	addl $4, t102                # pop arguments
	movl t100, t650              # get return value
	movl t650, t635              # move to register
	movl t101, t652              # move to register
	movl $-236, t653             # move constant to register
	addl t653, t652              # add two registers
	movl (t652), t654            # fetch from memory
	movl t654, t651              # move to register
	movl $1, t655                # move constant to register
	addl t655, t651              # add two registers
	movl t651, -236(t101)        # move to memory
	jmp L753                     # jump to L753
L525:
	movl t101, t658              # move to register
	movl $8, t659                # move constant to register
	addl t659, t658              # add two registers
	movl (t658), t660            # fetch from memory
	movl t660, t657              # move to register
	movl $-216, t661             # move constant to register
	addl t661, t657              # add two registers
	movl (t657), t662            # fetch from memory
	movl t662, t656              # move to register
	movl t101, t664              # move to register
	movl $-296, t665             # move constant to register
	addl t665, t664              # add two registers
	movl (t664), t666            # fetch from memory
	movl t666, t663              # move to register
	movl $4, t667                # move constant to register
	imull t667, t663             # multiply two registers
	addl t663, t656              # add two registers
	movl (t656), t668            # fetch from memory
	movl t101, t669              # move to register
	movl $-292, t670             # move constant to register
	addl t670, t669              # add two registers
	movl (t669), t671            # fetch from memory
	cmpl t671, t668              # compare for jump...
	je L507                      # if true: jump to L507
	jmp L508                     # if false: jump to L508
L508:
	movl $L506, t176             # move to register
L509:
	pushl t176                   # push onto stack
	call print
	addl $4, t102                # pop arguments
	movl t100, t672              # get return value
	movl t101, t674              # move to register
	movl $-296, t675             # move constant to register
	addl t675, t674              # add two registers
	movl (t674), t676            # fetch from memory
	movl t676, t673              # move to register
	movl $1, t677                # move constant to register
	addl t677, t673              # add two registers
	movl t673, -296(t101)        # move to memory
	jmp L524                     # jump to L524
L507:
	movl $L505, t176             # move to register
	jmp L509                     # jump to L509
L1845:
L1511:
	.long 1
	.byte 10, 0
L1510:
	.long 1
	.byte 10, 0
L1507:
	.long 1
	.byte 10, 0
L1506:
	.long 1
	.byte 10, 0
L1500:
	.long 2
	.byte 32, 46, 0
L1499:
	.long 2
	.byte 32, 79, 0
L1498:
	.long 2
	.byte 32, 46, 0
L1497:
	.long 2
	.byte 32, 79, 0
L1493:
	.long 2
	.byte 32, 46, 0
L1492:
	.long 2
	.byte 32, 79, 0
L1491:
	.long 2
	.byte 32, 46, 0
L1490:
	.long 2
	.byte 32, 79, 0
L1486:
	.long 2
	.byte 32, 46, 0
L1485:
	.long 2
	.byte 32, 79, 0
L1484:
	.long 2
	.byte 32, 46, 0
L1483:
	.long 2
	.byte 32, 79, 0
L1479:
	.long 2
	.byte 32, 46, 0
L1478:
	.long 2
	.byte 32, 79, 0
L1477:
	.long 2
	.byte 32, 46, 0
L1476:
	.long 2
	.byte 32, 79, 0
L1471:
	.long 2
	.byte 32, 46, 0
L1470:
	.long 2
	.byte 32, 79, 0
L1469:
	.long 2
	.byte 32, 46, 0
L1468:
	.long 2
	.byte 32, 79, 0
L1464:
	.long 2
	.byte 32, 46, 0
L1463:
	.long 2
	.byte 32, 79, 0
L1462:
	.long 2
	.byte 32, 46, 0
L1461:
	.long 2
	.byte 32, 79, 0
L1457:
	.long 2
	.byte 32, 46, 0
L1456:
	.long 2
	.byte 32, 79, 0
L1455:
	.long 2
	.byte 32, 46, 0
L1454:
	.long 2
	.byte 32, 79, 0
L1450:
	.long 2
	.byte 32, 46, 0
L1449:
	.long 2
	.byte 32, 79, 0
L1448:
	.long 2
	.byte 32, 46, 0
L1447:
	.long 2
	.byte 32, 79, 0
L1443:
	.long 2
	.byte 32, 46, 0
L1442:
	.long 2
	.byte 32, 79, 0
L1441:
	.long 2
	.byte 32, 46, 0
L1440:
	.long 2
	.byte 32, 79, 0
L1436:
	.long 2
	.byte 32, 46, 0
L1435:
	.long 2
	.byte 32, 79, 0
L1434:
	.long 2
	.byte 32, 46, 0
L1433:
	.long 2
	.byte 32, 79, 0
L1432:
	.long 1
	.byte 10, 0
L1431:
	.long 1
	.byte 10, 0
L1425:
	.long 2
	.byte 32, 46, 0
L1424:
	.long 2
	.byte 32, 79, 0
L1423:
	.long 2
	.byte 32, 46, 0
L1422:
	.long 2
	.byte 32, 79, 0
L1418:
	.long 2
	.byte 32, 46, 0
L1417:
	.long 2
	.byte 32, 79, 0
L1416:
	.long 2
	.byte 32, 46, 0
L1415:
	.long 2
	.byte 32, 79, 0
L1411:
	.long 2
	.byte 32, 46, 0
L1410:
	.long 2
	.byte 32, 79, 0
L1409:
	.long 2
	.byte 32, 46, 0
L1408:
	.long 2
	.byte 32, 79, 0
L1404:
	.long 2
	.byte 32, 46, 0
L1403:
	.long 2
	.byte 32, 79, 0
L1402:
	.long 2
	.byte 32, 46, 0
L1401:
	.long 2
	.byte 32, 79, 0
L1396:
	.long 2
	.byte 32, 46, 0
L1395:
	.long 2
	.byte 32, 79, 0
L1394:
	.long 2
	.byte 32, 46, 0
L1393:
	.long 2
	.byte 32, 79, 0
L1389:
	.long 2
	.byte 32, 46, 0
L1388:
	.long 2
	.byte 32, 79, 0
L1387:
	.long 2
	.byte 32, 46, 0
L1386:
	.long 2
	.byte 32, 79, 0
L1382:
	.long 2
	.byte 32, 46, 0
L1381:
	.long 2
	.byte 32, 79, 0
L1380:
	.long 2
	.byte 32, 46, 0
L1379:
	.long 2
	.byte 32, 79, 0
L1375:
	.long 2
	.byte 32, 46, 0
L1374:
	.long 2
	.byte 32, 79, 0
L1373:
	.long 2
	.byte 32, 46, 0
L1372:
	.long 2
	.byte 32, 79, 0
L1368:
	.long 2
	.byte 32, 46, 0
L1367:
	.long 2
	.byte 32, 79, 0
L1366:
	.long 2
	.byte 32, 46, 0
L1365:
	.long 2
	.byte 32, 79, 0
L1361:
	.long 2
	.byte 32, 46, 0
L1360:
	.long 2
	.byte 32, 79, 0
L1359:
	.long 2
	.byte 32, 46, 0
L1358:
	.long 2
	.byte 32, 79, 0
L1357:
	.long 1
	.byte 10, 0
L1356:
	.long 1
	.byte 10, 0
L1350:
	.long 2
	.byte 32, 46, 0
L1349:
	.long 2
	.byte 32, 79, 0
L1348:
	.long 2
	.byte 32, 46, 0
L1347:
	.long 2
	.byte 32, 79, 0
L1343:
	.long 2
	.byte 32, 46, 0
L1342:
	.long 2
	.byte 32, 79, 0
L1341:
	.long 2
	.byte 32, 46, 0
L1340:
	.long 2
	.byte 32, 79, 0
L1336:
	.long 2
	.byte 32, 46, 0
L1335:
	.long 2
	.byte 32, 79, 0
L1334:
	.long 2
	.byte 32, 46, 0
L1333:
	.long 2
	.byte 32, 79, 0
L1329:
	.long 2
	.byte 32, 46, 0
L1328:
	.long 2
	.byte 32, 79, 0
L1327:
	.long 2
	.byte 32, 46, 0
L1326:
	.long 2
	.byte 32, 79, 0
L1321:
	.long 2
	.byte 32, 46, 0
L1320:
	.long 2
	.byte 32, 79, 0
L1319:
	.long 2
	.byte 32, 46, 0
L1318:
	.long 2
	.byte 32, 79, 0
L1314:
	.long 2
	.byte 32, 46, 0
L1313:
	.long 2
	.byte 32, 79, 0
L1312:
	.long 2
	.byte 32, 46, 0
L1311:
	.long 2
	.byte 32, 79, 0
L1307:
	.long 2
	.byte 32, 46, 0
L1306:
	.long 2
	.byte 32, 79, 0
L1305:
	.long 2
	.byte 32, 46, 0
L1304:
	.long 2
	.byte 32, 79, 0
L1300:
	.long 2
	.byte 32, 46, 0
L1299:
	.long 2
	.byte 32, 79, 0
L1298:
	.long 2
	.byte 32, 46, 0
L1297:
	.long 2
	.byte 32, 79, 0
L1293:
	.long 2
	.byte 32, 46, 0
L1292:
	.long 2
	.byte 32, 79, 0
L1291:
	.long 2
	.byte 32, 46, 0
L1290:
	.long 2
	.byte 32, 79, 0
L1286:
	.long 2
	.byte 32, 46, 0
L1285:
	.long 2
	.byte 32, 79, 0
L1284:
	.long 2
	.byte 32, 46, 0
L1283:
	.long 2
	.byte 32, 79, 0
L1282:
	.long 1
	.byte 10, 0
L1281:
	.long 1
	.byte 10, 0
L1275:
	.long 2
	.byte 32, 46, 0
L1274:
	.long 2
	.byte 32, 79, 0
L1273:
	.long 2
	.byte 32, 46, 0
L1272:
	.long 2
	.byte 32, 79, 0
L1268:
	.long 2
	.byte 32, 46, 0
L1267:
	.long 2
	.byte 32, 79, 0
L1266:
	.long 2
	.byte 32, 46, 0
L1265:
	.long 2
	.byte 32, 79, 0
L1261:
	.long 2
	.byte 32, 46, 0
L1260:
	.long 2
	.byte 32, 79, 0
L1259:
	.long 2
	.byte 32, 46, 0
L1258:
	.long 2
	.byte 32, 79, 0
L1254:
	.long 2
	.byte 32, 46, 0
L1253:
	.long 2
	.byte 32, 79, 0
L1252:
	.long 2
	.byte 32, 46, 0
L1251:
	.long 2
	.byte 32, 79, 0
L1246:
	.long 2
	.byte 32, 46, 0
L1245:
	.long 2
	.byte 32, 79, 0
L1244:
	.long 2
	.byte 32, 46, 0
L1243:
	.long 2
	.byte 32, 79, 0
L1239:
	.long 2
	.byte 32, 46, 0
L1238:
	.long 2
	.byte 32, 79, 0
L1237:
	.long 2
	.byte 32, 46, 0
L1236:
	.long 2
	.byte 32, 79, 0
L1232:
	.long 2
	.byte 32, 46, 0
L1231:
	.long 2
	.byte 32, 79, 0
L1230:
	.long 2
	.byte 32, 46, 0
L1229:
	.long 2
	.byte 32, 79, 0
L1225:
	.long 2
	.byte 32, 46, 0
L1224:
	.long 2
	.byte 32, 79, 0
L1223:
	.long 2
	.byte 32, 46, 0
L1222:
	.long 2
	.byte 32, 79, 0
L1218:
	.long 2
	.byte 32, 46, 0
L1217:
	.long 2
	.byte 32, 79, 0
L1216:
	.long 2
	.byte 32, 46, 0
L1215:
	.long 2
	.byte 32, 79, 0
L1211:
	.long 2
	.byte 32, 46, 0
L1210:
	.long 2
	.byte 32, 79, 0
L1209:
	.long 2
	.byte 32, 46, 0
L1208:
	.long 2
	.byte 32, 79, 0
L1206:
	.long 1
	.byte 10, 0
L1205:
	.long 1
	.byte 10, 0
L1199:
	.long 2
	.byte 32, 46, 0
L1198:
	.long 2
	.byte 32, 79, 0
L1197:
	.long 2
	.byte 32, 46, 0
L1196:
	.long 2
	.byte 32, 79, 0
L1192:
	.long 2
	.byte 32, 46, 0
L1191:
	.long 2
	.byte 32, 79, 0
L1190:
	.long 2
	.byte 32, 46, 0
L1189:
	.long 2
	.byte 32, 79, 0
L1185:
	.long 2
	.byte 32, 46, 0
L1184:
	.long 2
	.byte 32, 79, 0
L1183:
	.long 2
	.byte 32, 46, 0
L1182:
	.long 2
	.byte 32, 79, 0
L1178:
	.long 2
	.byte 32, 46, 0
L1177:
	.long 2
	.byte 32, 79, 0
L1176:
	.long 2
	.byte 32, 46, 0
L1175:
	.long 2
	.byte 32, 79, 0
L1170:
	.long 2
	.byte 32, 46, 0
L1169:
	.long 2
	.byte 32, 79, 0
L1168:
	.long 2
	.byte 32, 46, 0
L1167:
	.long 2
	.byte 32, 79, 0
L1163:
	.long 2
	.byte 32, 46, 0
L1162:
	.long 2
	.byte 32, 79, 0
L1161:
	.long 2
	.byte 32, 46, 0
L1160:
	.long 2
	.byte 32, 79, 0
L1156:
	.long 2
	.byte 32, 46, 0
L1155:
	.long 2
	.byte 32, 79, 0
L1154:
	.long 2
	.byte 32, 46, 0
L1153:
	.long 2
	.byte 32, 79, 0
L1149:
	.long 2
	.byte 32, 46, 0
L1148:
	.long 2
	.byte 32, 79, 0
L1147:
	.long 2
	.byte 32, 46, 0
L1146:
	.long 2
	.byte 32, 79, 0
L1142:
	.long 2
	.byte 32, 46, 0
L1141:
	.long 2
	.byte 32, 79, 0
L1140:
	.long 2
	.byte 32, 46, 0
L1139:
	.long 2
	.byte 32, 79, 0
L1135:
	.long 2
	.byte 32, 46, 0
L1134:
	.long 2
	.byte 32, 79, 0
L1133:
	.long 2
	.byte 32, 46, 0
L1132:
	.long 2
	.byte 32, 79, 0
L1131:
	.long 1
	.byte 10, 0
L1130:
	.long 1
	.byte 10, 0
L1124:
	.long 2
	.byte 32, 46, 0
L1123:
	.long 2
	.byte 32, 79, 0
L1122:
	.long 2
	.byte 32, 46, 0
L1121:
	.long 2
	.byte 32, 79, 0
L1117:
	.long 2
	.byte 32, 46, 0
L1116:
	.long 2
	.byte 32, 79, 0
L1115:
	.long 2
	.byte 32, 46, 0
L1114:
	.long 2
	.byte 32, 79, 0
L1110:
	.long 2
	.byte 32, 46, 0
L1109:
	.long 2
	.byte 32, 79, 0
L1108:
	.long 2
	.byte 32, 46, 0
L1107:
	.long 2
	.byte 32, 79, 0
L1103:
	.long 2
	.byte 32, 46, 0
L1102:
	.long 2
	.byte 32, 79, 0
L1101:
	.long 2
	.byte 32, 46, 0
L1100:
	.long 2
	.byte 32, 79, 0
L1095:
	.long 2
	.byte 32, 46, 0
L1094:
	.long 2
	.byte 32, 79, 0
L1093:
	.long 2
	.byte 32, 46, 0
L1092:
	.long 2
	.byte 32, 79, 0
L1088:
	.long 2
	.byte 32, 46, 0
L1087:
	.long 2
	.byte 32, 79, 0
L1086:
	.long 2
	.byte 32, 46, 0
L1085:
	.long 2
	.byte 32, 79, 0
L1081:
	.long 2
	.byte 32, 46, 0
L1080:
	.long 2
	.byte 32, 79, 0
L1079:
	.long 2
	.byte 32, 46, 0
L1078:
	.long 2
	.byte 32, 79, 0
L1074:
	.long 2
	.byte 32, 46, 0
L1073:
	.long 2
	.byte 32, 79, 0
L1072:
	.long 2
	.byte 32, 46, 0
L1071:
	.long 2
	.byte 32, 79, 0
L1067:
	.long 2
	.byte 32, 46, 0
L1066:
	.long 2
	.byte 32, 79, 0
L1065:
	.long 2
	.byte 32, 46, 0
L1064:
	.long 2
	.byte 32, 79, 0
L1060:
	.long 2
	.byte 32, 46, 0
L1059:
	.long 2
	.byte 32, 79, 0
L1058:
	.long 2
	.byte 32, 46, 0
L1057:
	.long 2
	.byte 32, 79, 0
L1056:
	.long 1
	.byte 10, 0
L1055:
	.long 1
	.byte 10, 0
L1049:
	.long 2
	.byte 32, 46, 0
L1048:
	.long 2
	.byte 32, 79, 0
L1047:
	.long 2
	.byte 32, 46, 0
L1046:
	.long 2
	.byte 32, 79, 0
L1042:
	.long 2
	.byte 32, 46, 0
L1041:
	.long 2
	.byte 32, 79, 0
L1040:
	.long 2
	.byte 32, 46, 0
L1039:
	.long 2
	.byte 32, 79, 0
L1035:
	.long 2
	.byte 32, 46, 0
L1034:
	.long 2
	.byte 32, 79, 0
L1033:
	.long 2
	.byte 32, 46, 0
L1032:
	.long 2
	.byte 32, 79, 0
L1028:
	.long 2
	.byte 32, 46, 0
L1027:
	.long 2
	.byte 32, 79, 0
L1026:
	.long 2
	.byte 32, 46, 0
L1025:
	.long 2
	.byte 32, 79, 0
L1020:
	.long 2
	.byte 32, 46, 0
L1019:
	.long 2
	.byte 32, 79, 0
L1018:
	.long 2
	.byte 32, 46, 0
L1017:
	.long 2
	.byte 32, 79, 0
L1013:
	.long 2
	.byte 32, 46, 0
L1012:
	.long 2
	.byte 32, 79, 0
L1011:
	.long 2
	.byte 32, 46, 0
L1010:
	.long 2
	.byte 32, 79, 0
L1006:
	.long 2
	.byte 32, 46, 0
L1005:
	.long 2
	.byte 32, 79, 0
L1004:
	.long 2
	.byte 32, 46, 0
L1003:
	.long 2
	.byte 32, 79, 0
L999:
	.long 2
	.byte 32, 46, 0
L998:
	.long 2
	.byte 32, 79, 0
L997:
	.long 2
	.byte 32, 46, 0
L996:
	.long 2
	.byte 32, 79, 0
L992:
	.long 2
	.byte 32, 46, 0
L991:
	.long 2
	.byte 32, 79, 0
L990:
	.long 2
	.byte 32, 46, 0
L989:
	.long 2
	.byte 32, 79, 0
L985:
	.long 2
	.byte 32, 46, 0
L984:
	.long 2
	.byte 32, 79, 0
L983:
	.long 2
	.byte 32, 46, 0
L982:
	.long 2
	.byte 32, 79, 0
L981:
	.long 1
	.byte 10, 0
L980:
	.long 1
	.byte 10, 0
L974:
	.long 2
	.byte 32, 46, 0
L973:
	.long 2
	.byte 32, 79, 0
L972:
	.long 2
	.byte 32, 46, 0
L971:
	.long 2
	.byte 32, 79, 0
L967:
	.long 2
	.byte 32, 46, 0
L966:
	.long 2
	.byte 32, 79, 0
L965:
	.long 2
	.byte 32, 46, 0
L964:
	.long 2
	.byte 32, 79, 0
L960:
	.long 2
	.byte 32, 46, 0
L959:
	.long 2
	.byte 32, 79, 0
L958:
	.long 2
	.byte 32, 46, 0
L957:
	.long 2
	.byte 32, 79, 0
L953:
	.long 2
	.byte 32, 46, 0
L952:
	.long 2
	.byte 32, 79, 0
L951:
	.long 2
	.byte 32, 46, 0
L950:
	.long 2
	.byte 32, 79, 0
L945:
	.long 2
	.byte 32, 46, 0
L944:
	.long 2
	.byte 32, 79, 0
L943:
	.long 2
	.byte 32, 46, 0
L942:
	.long 2
	.byte 32, 79, 0
L938:
	.long 2
	.byte 32, 46, 0
L937:
	.long 2
	.byte 32, 79, 0
L936:
	.long 2
	.byte 32, 46, 0
L935:
	.long 2
	.byte 32, 79, 0
L931:
	.long 2
	.byte 32, 46, 0
L930:
	.long 2
	.byte 32, 79, 0
L929:
	.long 2
	.byte 32, 46, 0
L928:
	.long 2
	.byte 32, 79, 0
L924:
	.long 2
	.byte 32, 46, 0
L923:
	.long 2
	.byte 32, 79, 0
L922:
	.long 2
	.byte 32, 46, 0
L921:
	.long 2
	.byte 32, 79, 0
L917:
	.long 2
	.byte 32, 46, 0
L916:
	.long 2
	.byte 32, 79, 0
L915:
	.long 2
	.byte 32, 46, 0
L914:
	.long 2
	.byte 32, 79, 0
L910:
	.long 2
	.byte 32, 46, 0
L909:
	.long 2
	.byte 32, 79, 0
L908:
	.long 2
	.byte 32, 46, 0
L907:
	.long 2
	.byte 32, 79, 0
L906:
	.long 1
	.byte 10, 0
L905:
	.long 1
	.byte 10, 0
L899:
	.long 2
	.byte 32, 46, 0
L898:
	.long 2
	.byte 32, 79, 0
L897:
	.long 2
	.byte 32, 46, 0
L896:
	.long 2
	.byte 32, 79, 0
L892:
	.long 2
	.byte 32, 46, 0
L891:
	.long 2
	.byte 32, 79, 0
L890:
	.long 2
	.byte 32, 46, 0
L889:
	.long 2
	.byte 32, 79, 0
L885:
	.long 2
	.byte 32, 46, 0
L884:
	.long 2
	.byte 32, 79, 0
L883:
	.long 2
	.byte 32, 46, 0
L882:
	.long 2
	.byte 32, 79, 0
L878:
	.long 2
	.byte 32, 46, 0
L877:
	.long 2
	.byte 32, 79, 0
L876:
	.long 2
	.byte 32, 46, 0
L875:
	.long 2
	.byte 32, 79, 0
L870:
	.long 2
	.byte 32, 46, 0
L869:
	.long 2
	.byte 32, 79, 0
L868:
	.long 2
	.byte 32, 46, 0
L867:
	.long 2
	.byte 32, 79, 0
L863:
	.long 2
	.byte 32, 46, 0
L862:
	.long 2
	.byte 32, 79, 0
L861:
	.long 2
	.byte 32, 46, 0
L860:
	.long 2
	.byte 32, 79, 0
L856:
	.long 2
	.byte 32, 46, 0
L855:
	.long 2
	.byte 32, 79, 0
L854:
	.long 2
	.byte 32, 46, 0
L853:
	.long 2
	.byte 32, 79, 0
L849:
	.long 2
	.byte 32, 46, 0
L848:
	.long 2
	.byte 32, 79, 0
L847:
	.long 2
	.byte 32, 46, 0
L846:
	.long 2
	.byte 32, 79, 0
L842:
	.long 2
	.byte 32, 46, 0
L841:
	.long 2
	.byte 32, 79, 0
L840:
	.long 2
	.byte 32, 46, 0
L839:
	.long 2
	.byte 32, 79, 0
L835:
	.long 2
	.byte 32, 46, 0
L834:
	.long 2
	.byte 32, 79, 0
L833:
	.long 2
	.byte 32, 46, 0
L832:
	.long 2
	.byte 32, 79, 0
L831:
	.long 1
	.byte 10, 0
L830:
	.long 1
	.byte 10, 0
L824:
	.long 2
	.byte 32, 46, 0
L823:
	.long 2
	.byte 32, 79, 0
L822:
	.long 2
	.byte 32, 46, 0
L821:
	.long 2
	.byte 32, 79, 0
L817:
	.long 2
	.byte 32, 46, 0
L816:
	.long 2
	.byte 32, 79, 0
L815:
	.long 2
	.byte 32, 46, 0
L814:
	.long 2
	.byte 32, 79, 0
L810:
	.long 2
	.byte 32, 46, 0
L809:
	.long 2
	.byte 32, 79, 0
L808:
	.long 2
	.byte 32, 46, 0
L807:
	.long 2
	.byte 32, 79, 0
L803:
	.long 2
	.byte 32, 46, 0
L802:
	.long 2
	.byte 32, 79, 0
L801:
	.long 2
	.byte 32, 46, 0
L800:
	.long 2
	.byte 32, 79, 0
L795:
	.long 2
	.byte 32, 46, 0
L794:
	.long 2
	.byte 32, 79, 0
L793:
	.long 2
	.byte 32, 46, 0
L792:
	.long 2
	.byte 32, 79, 0
L788:
	.long 2
	.byte 32, 46, 0
L787:
	.long 2
	.byte 32, 79, 0
L786:
	.long 2
	.byte 32, 46, 0
L785:
	.long 2
	.byte 32, 79, 0
L781:
	.long 2
	.byte 32, 46, 0
L780:
	.long 2
	.byte 32, 79, 0
L779:
	.long 2
	.byte 32, 46, 0
L778:
	.long 2
	.byte 32, 79, 0
L774:
	.long 2
	.byte 32, 46, 0
L773:
	.long 2
	.byte 32, 79, 0
L772:
	.long 2
	.byte 32, 46, 0
L771:
	.long 2
	.byte 32, 79, 0
L767:
	.long 2
	.byte 32, 46, 0
L766:
	.long 2
	.byte 32, 79, 0
L765:
	.long 2
	.byte 32, 46, 0
L764:
	.long 2
	.byte 32, 79, 0
L760:
	.long 2
	.byte 32, 46, 0
L759:
	.long 2
	.byte 32, 79, 0
L758:
	.long 2
	.byte 32, 46, 0
L757:
	.long 2
	.byte 32, 79, 0
L756:
	.long 1
	.byte 10, 0
L755:
	.long 1
	.byte 10, 0
L752:
	.long 1
	.byte 10, 0
L751:
	.long 1
	.byte 10, 0
L745:
	.long 2
	.byte 32, 46, 0
L744:
	.long 2
	.byte 32, 79, 0
L743:
	.long 2
	.byte 32, 46, 0
L742:
	.long 2
	.byte 32, 79, 0
L738:
	.long 2
	.byte 32, 46, 0
L737:
	.long 2
	.byte 32, 79, 0
L736:
	.long 2
	.byte 32, 46, 0
L735:
	.long 2
	.byte 32, 79, 0
L731:
	.long 2
	.byte 32, 46, 0
L730:
	.long 2
	.byte 32, 79, 0
L729:
	.long 2
	.byte 32, 46, 0
L728:
	.long 2
	.byte 32, 79, 0
L724:
	.long 2
	.byte 32, 46, 0
L723:
	.long 2
	.byte 32, 79, 0
L722:
	.long 2
	.byte 32, 46, 0
L721:
	.long 2
	.byte 32, 79, 0
L716:
	.long 2
	.byte 32, 46, 0
L715:
	.long 2
	.byte 32, 79, 0
L714:
	.long 2
	.byte 32, 46, 0
L713:
	.long 2
	.byte 32, 79, 0
L709:
	.long 2
	.byte 32, 46, 0
L708:
	.long 2
	.byte 32, 79, 0
L707:
	.long 2
	.byte 32, 46, 0
L706:
	.long 2
	.byte 32, 79, 0
L702:
	.long 2
	.byte 32, 46, 0
L701:
	.long 2
	.byte 32, 79, 0
L700:
	.long 2
	.byte 32, 46, 0
L699:
	.long 2
	.byte 32, 79, 0
L695:
	.long 2
	.byte 32, 46, 0
L694:
	.long 2
	.byte 32, 79, 0
L693:
	.long 2
	.byte 32, 46, 0
L692:
	.long 2
	.byte 32, 79, 0
L688:
	.long 2
	.byte 32, 46, 0
L687:
	.long 2
	.byte 32, 79, 0
L686:
	.long 2
	.byte 32, 46, 0
L685:
	.long 2
	.byte 32, 79, 0
L681:
	.long 2
	.byte 32, 46, 0
L680:
	.long 2
	.byte 32, 79, 0
L679:
	.long 2
	.byte 32, 46, 0
L678:
	.long 2
	.byte 32, 79, 0
L677:
	.long 1
	.byte 10, 0
L676:
	.long 1
	.byte 10, 0
L670:
	.long 2
	.byte 32, 46, 0
L669:
	.long 2
	.byte 32, 79, 0
L668:
	.long 2
	.byte 32, 46, 0
L667:
	.long 2
	.byte 32, 79, 0
L663:
	.long 2
	.byte 32, 46, 0
L662:
	.long 2
	.byte 32, 79, 0
L661:
	.long 2
	.byte 32, 46, 0
L660:
	.long 2
	.byte 32, 79, 0
L656:
	.long 2
	.byte 32, 46, 0
L655:
	.long 2
	.byte 32, 79, 0
L654:
	.long 2
	.byte 32, 46, 0
L653:
	.long 2
	.byte 32, 79, 0
L649:
	.long 2
	.byte 32, 46, 0
L648:
	.long 2
	.byte 32, 79, 0
L647:
	.long 2
	.byte 32, 46, 0
L646:
	.long 2
	.byte 32, 79, 0
L641:
	.long 2
	.byte 32, 46, 0
L640:
	.long 2
	.byte 32, 79, 0
L639:
	.long 2
	.byte 32, 46, 0
L638:
	.long 2
	.byte 32, 79, 0
L634:
	.long 2
	.byte 32, 46, 0
L633:
	.long 2
	.byte 32, 79, 0
L632:
	.long 2
	.byte 32, 46, 0
L631:
	.long 2
	.byte 32, 79, 0
L627:
	.long 2
	.byte 32, 46, 0
L626:
	.long 2
	.byte 32, 79, 0
L625:
	.long 2
	.byte 32, 46, 0
L624:
	.long 2
	.byte 32, 79, 0
L620:
	.long 2
	.byte 32, 46, 0
L619:
	.long 2
	.byte 32, 79, 0
L618:
	.long 2
	.byte 32, 46, 0
L617:
	.long 2
	.byte 32, 79, 0
L613:
	.long 2
	.byte 32, 46, 0
L612:
	.long 2
	.byte 32, 79, 0
L611:
	.long 2
	.byte 32, 46, 0
L610:
	.long 2
	.byte 32, 79, 0
L606:
	.long 2
	.byte 32, 46, 0
L605:
	.long 2
	.byte 32, 79, 0
L604:
	.long 2
	.byte 32, 46, 0
L603:
	.long 2
	.byte 32, 79, 0
L602:
	.long 1
	.byte 10, 0
L601:
	.long 1
	.byte 10, 0
L595:
	.long 2
	.byte 32, 46, 0
L594:
	.long 2
	.byte 32, 79, 0
L593:
	.long 2
	.byte 32, 46, 0
L592:
	.long 2
	.byte 32, 79, 0
L588:
	.long 2
	.byte 32, 46, 0
L587:
	.long 2
	.byte 32, 79, 0
L586:
	.long 2
	.byte 32, 46, 0
L585:
	.long 2
	.byte 32, 79, 0
L581:
	.long 2
	.byte 32, 46, 0
L580:
	.long 2
	.byte 32, 79, 0
L579:
	.long 2
	.byte 32, 46, 0
L578:
	.long 2
	.byte 32, 79, 0
L574:
	.long 2
	.byte 32, 46, 0
L573:
	.long 2
	.byte 32, 79, 0
L572:
	.long 2
	.byte 32, 46, 0
L571:
	.long 2
	.byte 32, 79, 0
L566:
	.long 2
	.byte 32, 46, 0
L565:
	.long 2
	.byte 32, 79, 0
L564:
	.long 2
	.byte 32, 46, 0
L563:
	.long 2
	.byte 32, 79, 0
L559:
	.long 2
	.byte 32, 46, 0
L558:
	.long 2
	.byte 32, 79, 0
L557:
	.long 2
	.byte 32, 46, 0
L556:
	.long 2
	.byte 32, 79, 0
L552:
	.long 2
	.byte 32, 46, 0
L551:
	.long 2
	.byte 32, 79, 0
L550:
	.long 2
	.byte 32, 46, 0
L549:
	.long 2
	.byte 32, 79, 0
L545:
	.long 2
	.byte 32, 46, 0
L544:
	.long 2
	.byte 32, 79, 0
L543:
	.long 2
	.byte 32, 46, 0
L542:
	.long 2
	.byte 32, 79, 0
L538:
	.long 2
	.byte 32, 46, 0
L537:
	.long 2
	.byte 32, 79, 0
L536:
	.long 2
	.byte 32, 46, 0
L535:
	.long 2
	.byte 32, 79, 0
L531:
	.long 2
	.byte 32, 46, 0
L530:
	.long 2
	.byte 32, 79, 0
L529:
	.long 2
	.byte 32, 46, 0
L528:
	.long 2
	.byte 32, 79, 0
L527:
	.long 1
	.byte 10, 0
L526:
	.long 1
	.byte 10, 0
L520:
	.long 2
	.byte 32, 46, 0
L519:
	.long 2
	.byte 32, 79, 0
L518:
	.long 2
	.byte 32, 46, 0
L517:
	.long 2
	.byte 32, 79, 0
L513:
	.long 2
	.byte 32, 46, 0
L512:
	.long 2
	.byte 32, 79, 0
L511:
	.long 2
	.byte 32, 46, 0
L510:
	.long 2
	.byte 32, 79, 0
L506:
	.long 2
	.byte 32, 46, 0
L505:
	.long 2
	.byte 32, 79, 0
L504:
	.long 2
	.byte 32, 46, 0
L503:
	.long 2
	.byte 32, 79, 0
L499:
	.long 2
	.byte 32, 46, 0
L498:
	.long 2
	.byte 32, 79, 0
L497:
	.long 2
	.byte 32, 46, 0
L496:
	.long 2
	.byte 32, 79, 0
L491:
	.long 2
	.byte 32, 46, 0
L490:
	.long 2
	.byte 32, 79, 0
L489:
	.long 2
	.byte 32, 46, 0
L488:
	.long 2
	.byte 32, 79, 0
L484:
	.long 2
	.byte 32, 46, 0
L483:
	.long 2
	.byte 32, 79, 0
L482:
	.long 2
	.byte 32, 46, 0
L481:
	.long 2
	.byte 32, 79, 0
L477:
	.long 2
	.byte 32, 46, 0
L476:
	.long 2
	.byte 32, 79, 0
L475:
	.long 2
	.byte 32, 46, 0
L474:
	.long 2
	.byte 32, 79, 0
L470:
	.long 2
	.byte 32, 46, 0
L469:
	.long 2
	.byte 32, 79, 0
L468:
	.long 2
	.byte 32, 46, 0
L467:
	.long 2
	.byte 32, 79, 0
L463:
	.long 2
	.byte 32, 46, 0
L462:
	.long 2
	.byte 32, 79, 0
L461:
	.long 2
	.byte 32, 46, 0
L460:
	.long 2
	.byte 32, 79, 0
L456:
	.long 2
	.byte 32, 46, 0
L455:
	.long 2
	.byte 32, 79, 0
L454:
	.long 2
	.byte 32, 46, 0
L453:
	.long 2
	.byte 32, 79, 0
L451:
	.long 1
	.byte 10, 0
L450:
	.long 1
	.byte 10, 0
L444:
	.long 2
	.byte 32, 46, 0
L443:
	.long 2
	.byte 32, 79, 0
L442:
	.long 2
	.byte 32, 46, 0
L441:
	.long 2
	.byte 32, 79, 0
L437:
	.long 2
	.byte 32, 46, 0
L436:
	.long 2
	.byte 32, 79, 0
L435:
	.long 2
	.byte 32, 46, 0
L434:
	.long 2
	.byte 32, 79, 0
L430:
	.long 2
	.byte 32, 46, 0
L429:
	.long 2
	.byte 32, 79, 0
L428:
	.long 2
	.byte 32, 46, 0
L427:
	.long 2
	.byte 32, 79, 0
L423:
	.long 2
	.byte 32, 46, 0
L422:
	.long 2
	.byte 32, 79, 0
L421:
	.long 2
	.byte 32, 46, 0
L420:
	.long 2
	.byte 32, 79, 0
L415:
	.long 2
	.byte 32, 46, 0
L414:
	.long 2
	.byte 32, 79, 0
L413:
	.long 2
	.byte 32, 46, 0
L412:
	.long 2
	.byte 32, 79, 0
L408:
	.long 2
	.byte 32, 46, 0
L407:
	.long 2
	.byte 32, 79, 0
L406:
	.long 2
	.byte 32, 46, 0
L405:
	.long 2
	.byte 32, 79, 0
L401:
	.long 2
	.byte 32, 46, 0
L400:
	.long 2
	.byte 32, 79, 0
L399:
	.long 2
	.byte 32, 46, 0
L398:
	.long 2
	.byte 32, 79, 0
L394:
	.long 2
	.byte 32, 46, 0
L393:
	.long 2
	.byte 32, 79, 0
L392:
	.long 2
	.byte 32, 46, 0
L391:
	.long 2
	.byte 32, 79, 0
L387:
	.long 2
	.byte 32, 46, 0
L386:
	.long 2
	.byte 32, 79, 0
L385:
	.long 2
	.byte 32, 46, 0
L384:
	.long 2
	.byte 32, 79, 0
L380:
	.long 2
	.byte 32, 46, 0
L379:
	.long 2
	.byte 32, 79, 0
L378:
	.long 2
	.byte 32, 46, 0
L377:
	.long 2
	.byte 32, 79, 0
L376:
	.long 1
	.byte 10, 0
L375:
	.long 1
	.byte 10, 0
L369:
	.long 2
	.byte 32, 46, 0
L368:
	.long 2
	.byte 32, 79, 0
L367:
	.long 2
	.byte 32, 46, 0
L366:
	.long 2
	.byte 32, 79, 0
L362:
	.long 2
	.byte 32, 46, 0
L361:
	.long 2
	.byte 32, 79, 0
L360:
	.long 2
	.byte 32, 46, 0
L359:
	.long 2
	.byte 32, 79, 0
L355:
	.long 2
	.byte 32, 46, 0
L354:
	.long 2
	.byte 32, 79, 0
L353:
	.long 2
	.byte 32, 46, 0
L352:
	.long 2
	.byte 32, 79, 0
L348:
	.long 2
	.byte 32, 46, 0
L347:
	.long 2
	.byte 32, 79, 0
L346:
	.long 2
	.byte 32, 46, 0
L345:
	.long 2
	.byte 32, 79, 0
L340:
	.long 2
	.byte 32, 46, 0
L339:
	.long 2
	.byte 32, 79, 0
L338:
	.long 2
	.byte 32, 46, 0
L337:
	.long 2
	.byte 32, 79, 0
L333:
	.long 2
	.byte 32, 46, 0
L332:
	.long 2
	.byte 32, 79, 0
L331:
	.long 2
	.byte 32, 46, 0
L330:
	.long 2
	.byte 32, 79, 0
L326:
	.long 2
	.byte 32, 46, 0
L325:
	.long 2
	.byte 32, 79, 0
L324:
	.long 2
	.byte 32, 46, 0
L323:
	.long 2
	.byte 32, 79, 0
L319:
	.long 2
	.byte 32, 46, 0
L318:
	.long 2
	.byte 32, 79, 0
L317:
	.long 2
	.byte 32, 46, 0
L316:
	.long 2
	.byte 32, 79, 0
L312:
	.long 2
	.byte 32, 46, 0
L311:
	.long 2
	.byte 32, 79, 0
L310:
	.long 2
	.byte 32, 46, 0
L309:
	.long 2
	.byte 32, 79, 0
L305:
	.long 2
	.byte 32, 46, 0
L304:
	.long 2
	.byte 32, 79, 0
L303:
	.long 2
	.byte 32, 46, 0
L302:
	.long 2
	.byte 32, 79, 0
L301:
	.long 1
	.byte 10, 0
L300:
	.long 1
	.byte 10, 0
L294:
	.long 2
	.byte 32, 46, 0
L293:
	.long 2
	.byte 32, 79, 0
L292:
	.long 2
	.byte 32, 46, 0
L291:
	.long 2
	.byte 32, 79, 0
L287:
	.long 2
	.byte 32, 46, 0
L286:
	.long 2
	.byte 32, 79, 0
L285:
	.long 2
	.byte 32, 46, 0
L284:
	.long 2
	.byte 32, 79, 0
L280:
	.long 2
	.byte 32, 46, 0
L279:
	.long 2
	.byte 32, 79, 0
L278:
	.long 2
	.byte 32, 46, 0
L277:
	.long 2
	.byte 32, 79, 0
L273:
	.long 2
	.byte 32, 46, 0
L272:
	.long 2
	.byte 32, 79, 0
L271:
	.long 2
	.byte 32, 46, 0
L270:
	.long 2
	.byte 32, 79, 0
L265:
	.long 2
	.byte 32, 46, 0
L264:
	.long 2
	.byte 32, 79, 0
L263:
	.long 2
	.byte 32, 46, 0
L262:
	.long 2
	.byte 32, 79, 0
L258:
	.long 2
	.byte 32, 46, 0
L257:
	.long 2
	.byte 32, 79, 0
L256:
	.long 2
	.byte 32, 46, 0
L255:
	.long 2
	.byte 32, 79, 0
L251:
	.long 2
	.byte 32, 46, 0
L250:
	.long 2
	.byte 32, 79, 0
L249:
	.long 2
	.byte 32, 46, 0
L248:
	.long 2
	.byte 32, 79, 0
L244:
	.long 2
	.byte 32, 46, 0
L243:
	.long 2
	.byte 32, 79, 0
L242:
	.long 2
	.byte 32, 46, 0
L241:
	.long 2
	.byte 32, 79, 0
L237:
	.long 2
	.byte 32, 46, 0
L236:
	.long 2
	.byte 32, 79, 0
L235:
	.long 2
	.byte 32, 46, 0
L234:
	.long 2
	.byte 32, 79, 0
L230:
	.long 2
	.byte 32, 46, 0
L229:
	.long 2
	.byte 32, 79, 0
L228:
	.long 2
	.byte 32, 46, 0
L227:
	.long 2
	.byte 32, 79, 0
L226:
	.long 1
	.byte 10, 0
L225:
	.long 1
	.byte 10, 0
L219:
	.long 2
	.byte 32, 46, 0
L218:
	.long 2
	.byte 32, 79, 0
L217:
	.long 2
	.byte 32, 46, 0
L216:
	.long 2
	.byte 32, 79, 0
L212:
	.long 2
	.byte 32, 46, 0
L211:
	.long 2
	.byte 32, 79, 0
L210:
	.long 2
	.byte 32, 46, 0
L209:
	.long 2
	.byte 32, 79, 0
L205:
	.long 2
	.byte 32, 46, 0
L204:
	.long 2
	.byte 32, 79, 0
L203:
	.long 2
	.byte 32, 46, 0
L202:
	.long 2
	.byte 32, 79, 0
L198:
	.long 2
	.byte 32, 46, 0
L197:
	.long 2
	.byte 32, 79, 0
L196:
	.long 2
	.byte 32, 46, 0
L195:
	.long 2
	.byte 32, 79, 0
L190:
	.long 2
	.byte 32, 46, 0
L189:
	.long 2
	.byte 32, 79, 0
L188:
	.long 2
	.byte 32, 46, 0
L187:
	.long 2
	.byte 32, 79, 0
L183:
	.long 2
	.byte 32, 46, 0
L182:
	.long 2
	.byte 32, 79, 0
L181:
	.long 2
	.byte 32, 46, 0
L180:
	.long 2
	.byte 32, 79, 0
L176:
	.long 2
	.byte 32, 46, 0
L175:
	.long 2
	.byte 32, 79, 0
L174:
	.long 2
	.byte 32, 46, 0
L173:
	.long 2
	.byte 32, 79, 0
L169:
	.long 2
	.byte 32, 46, 0
L168:
	.long 2
	.byte 32, 79, 0
L167:
	.long 2
	.byte 32, 46, 0
L166:
	.long 2
	.byte 32, 79, 0
L162:
	.long 2
	.byte 32, 46, 0
L161:
	.long 2
	.byte 32, 79, 0
L160:
	.long 2
	.byte 32, 46, 0
L159:
	.long 2
	.byte 32, 79, 0
L155:
	.long 2
	.byte 32, 46, 0
L154:
	.long 2
	.byte 32, 79, 0
L153:
	.long 2
	.byte 32, 46, 0
L152:
	.long 2
	.byte 32, 79, 0
L151:
	.long 1
	.byte 10, 0
L150:
	.long 1
	.byte 10, 0
L144:
	.long 2
	.byte 32, 46, 0
L143:
	.long 2
	.byte 32, 79, 0
L142:
	.long 2
	.byte 32, 46, 0
L141:
	.long 2
	.byte 32, 79, 0
L137:
	.long 2
	.byte 32, 46, 0
L136:
	.long 2
	.byte 32, 79, 0
L135:
	.long 2
	.byte 32, 46, 0
L134:
	.long 2
	.byte 32, 79, 0
L130:
	.long 2
	.byte 32, 46, 0
L129:
	.long 2
	.byte 32, 79, 0
L128:
	.long 2
	.byte 32, 46, 0
L127:
	.long 2
	.byte 32, 79, 0
L123:
	.long 2
	.byte 32, 46, 0
L122:
	.long 2
	.byte 32, 79, 0
L121:
	.long 2
	.byte 32, 46, 0
L120:
	.long 2
	.byte 32, 79, 0
L115:
	.long 2
	.byte 32, 46, 0
L114:
	.long 2
	.byte 32, 79, 0
L113:
	.long 2
	.byte 32, 46, 0
L112:
	.long 2
	.byte 32, 79, 0
L108:
	.long 2
	.byte 32, 46, 0
L107:
	.long 2
	.byte 32, 79, 0
L106:
	.long 2
	.byte 32, 46, 0
L105:
	.long 2
	.byte 32, 79, 0
L101:
	.long 2
	.byte 32, 46, 0
L100:
	.long 2
	.byte 32, 79, 0
L99:
	.long 2
	.byte 32, 46, 0
L98:
	.long 2
	.byte 32, 79, 0
L94:
	.long 2
	.byte 32, 46, 0
L93:
	.long 2
	.byte 32, 79, 0
L92:
	.long 2
	.byte 32, 46, 0
L91:
	.long 2
	.byte 32, 79, 0
L87:
	.long 2
	.byte 32, 46, 0
L86:
	.long 2
	.byte 32, 79, 0
L85:
	.long 2
	.byte 32, 46, 0
L84:
	.long 2
	.byte 32, 79, 0
L80:
	.long 2
	.byte 32, 46, 0
L79:
	.long 2
	.byte 32, 79, 0
L78:
	.long 2
	.byte 32, 46, 0
L77:
	.long 2
	.byte 32, 79, 0
L76:
	.long 1
	.byte 10, 0
L75:
	.long 1
	.byte 10, 0
L69:
	.long 2
	.byte 32, 46, 0
L68:
	.long 2
	.byte 32, 79, 0
L67:
	.long 2
	.byte 32, 46, 0
L66:
	.long 2
	.byte 32, 79, 0
L62:
	.long 2
	.byte 32, 46, 0
L61:
	.long 2
	.byte 32, 79, 0
L60:
	.long 2
	.byte 32, 46, 0
L59:
	.long 2
	.byte 32, 79, 0
L55:
	.long 2
	.byte 32, 46, 0
L54:
	.long 2
	.byte 32, 79, 0
L53:
	.long 2
	.byte 32, 46, 0
L52:
	.long 2
	.byte 32, 79, 0
L48:
	.long 2
	.byte 32, 46, 0
L47:
	.long 2
	.byte 32, 79, 0
L46:
	.long 2
	.byte 32, 46, 0
L45:
	.long 2
	.byte 32, 79, 0
L40:
	.long 2
	.byte 32, 46, 0
L39:
	.long 2
	.byte 32, 79, 0
L38:
	.long 2
	.byte 32, 46, 0
L37:
	.long 2
	.byte 32, 79, 0
L33:
	.long 2
	.byte 32, 46, 0
L32:
	.long 2
	.byte 32, 79, 0
L31:
	.long 2
	.byte 32, 46, 0
L30:
	.long 2
	.byte 32, 79, 0
L26:
	.long 2
	.byte 32, 46, 0
L25:
	.long 2
	.byte 32, 79, 0
L24:
	.long 2
	.byte 32, 46, 0
L23:
	.long 2
	.byte 32, 79, 0
L19:
	.long 2
	.byte 32, 46, 0
L18:
	.long 2
	.byte 32, 79, 0
L17:
	.long 2
	.byte 32, 46, 0
L16:
	.long 2
	.byte 32, 79, 0
L12:
	.long 2
	.byte 32, 46, 0
L11:
	.long 2
	.byte 32, 79, 0
L10:
	.long 2
	.byte 32, 46, 0
L9:
	.long 2
	.byte 32, 79, 0
L5:
	.long 2
	.byte 32, 46, 0
L4:
	.long 2
	.byte 32, 79, 0
L3:
	.long 2
	.byte 32, 46, 0
L2:
	.long 2
	.byte 32, 79, 0
