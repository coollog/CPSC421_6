.globl tigermain
.type tigermain, @function
tigermain:
push %ebp
mov %esp, %ebp
sub $104, %esp
push %ebx
push %edi
push %esi
L1:
mov $~104, %ebx
mov %ebp, %ebx
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
mov %ebp, %ebx
add %ebx, %ebx
movl (%ebx), %ebx
mov $1, %ebx
mov %ebx, %eax
jmp L0
L0:
pop %esi
pop %edi
pop %ebx
mov %ebp, %esp
pop %ebp
ret
