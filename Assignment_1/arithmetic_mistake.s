.global _start

.section .text
_start:
    # Perform various arithmetic functions
    movq $3, %rbx          # Use %rbx for the initial value
    movl %rbx, %rax        # Mistake: movl is for 32-bit, but %rax is 64-bit

    addq %rbx, %rax        # Add %rbx to %rax
    mulq %rbx              # Multiply %rax by %rbx

    movq $2, %rcx          # Use %rcx for new value
    addq %rcx, %rax        # Add %rcx to %rax

    movq $4, %rdx          # Use %rdx for another value
    mulq %rdx              # Multiply %rax by %rdx
    movq %rax, %rdi        # Move result to %rdi for exit code
    
    # Set the exit system call number
    movq $60, %rax         # Exit syscall number
    syscall                # Perform the exit syscall
