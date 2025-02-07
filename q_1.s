.global _start

.section .text
_start:
    # Load the initial value into %rbx
    movq $3, %rbx          # rbx = 3
    movq %rbx, %rax        # rax = 3 (copy from rbx)

    # Add %rbx and store result in %rcx
    addq %rbx, %rcx        # rcx = 3 + 3 = 6

    # Multiply %rcx by %rbx and store in %rdx
    movq %rcx, %rdx        # rdx = 6 (from rcx)
    mulq %rbx              # rdx = 6 * 3 = 18

    # Add %rcx to %rdx and store result in %rsi
    addq %rcx, %rdx        # rdx = 18 + 6 = 24

    # Multiply %rdx by 4 and store result in %rdi
    movq $4, %r8           # r8 = 4
    mulq %r8               # rdx = 24 * 4 = 96

    # Store result in %rdi for the exit code
    movq %rdx, %rdi

    # Set the exit system call number
    movq $60, %rax         # Exit syscall number
    syscall
