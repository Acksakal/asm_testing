.section .text
.globl _start
.extern square

_start:
    # Call square(7)
    pushl $7
    call square
    addl $4, %esp            # Clean up the argument from the stack

    cmpl $49, %eax           # Compare result with expected 49
    jne test_failed          # Jump to fail if not equal

    # Test passed
    movl $0, %ebx            # Exit code 0
    jmp exit_program

test_failed:
    movl $1, %ebx            # Exit code 1

exit_program:
    movl $1, %eax            # Syscall: exit
    int $0x80
