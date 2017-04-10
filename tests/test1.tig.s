.globl tigermain
tigermain:
push %ebp
mov %esp, %ebp
sub $100, %esp
push %ebx
push %edi
push %esi
L5:
mov $~104, %ebx
	movl	-4(%ebp), %edi # load pseudo-register
mov %edi, %ebx
add %ebx, %ebx
mov %ebx, %ebx
push %eax
push %ecx
push %edx
mov $0, %ebx
push %ebx
mov $10, %ebx
push %ebx
call initArray
add $8, %esp
pop %edx
pop %ecx
pop %eax
mov %esi, %ebx
mov %ebx, (%ebx)
mov $~104, %ebx
	movl	-4(%ebp), %edi # load pseudo-register
mov %edi, %ebx
add %ebx, %ebx
movl (%ebx), %ebx
jmp L4
L4:
pop %ebx
pop %edi
pop %esi
mov %ebp, %esp
add $100, %esp
pop %ebp
ret
