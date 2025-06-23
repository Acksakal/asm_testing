.section .text
.globl square

# int square(int x)
square:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax      # eax = x
    imull %eax, %eax        # eax = x * x
    popl %ebp
    ret
