.globl tigermain
.type tigermain, @function
tigermain:
push %ebp
mov %esp, %ebp
sub $100, %esp
push %ebx
push %edi
push %esi
L11:
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
mov %eax, %ebx
pop %edx
pop %ecx
pop %eax
mov %ebx, %ebx
mov %ebx, (%ebx)
mov $~104, %ebx
	movl	-4(%ebp), %edi # load pseudo-register
mov %edi, %ebx
add %ebx, %ebx
movl (%ebx), %ebx
jmp L10
L10:
pop %esi
pop %edi
pop %ebx
mov %ebp, %esp
pop %ebp
ret
