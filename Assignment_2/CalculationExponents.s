.section .data
fmt:    .string "Result of ((2^3)+2)^7 = %ld\n"

.section .bss
res:    .quad 0

.section .text
.global main
.extern printf

main:
  # Compute 2^3
   movq $2, %rax
   movq $3, %rcx
   call power

  # Add 2 (result = 8+2 = 10)
   addq $2, %rax

  # Compute (10^7)
   movq $7, %rcx
   call power

  # Store result in res
   movq %rax, res

  # Print result using printf
   movq $fmt, %rdi   # Format string
   movq res, %rsi    # Value to print
   xorq %rax, %rax   # Clear RAX for variadic function
   call printf

  # Exit
   movq $60, %rax
   xorq %rdi, %rdi
   syscall

power:
  # Compute %rax^%rcx (Exponentiation by Squaring)
   pushq %rbx        # Save rbx
   movq %rax, %rbx   # Base in rbx
   movq $1, %rax     # Initialize result to 1

.loop:
   testq %rcx, %rcx  # Check if exponent is zero
   jz .done
   
   testq $1, %rcx    # Check if exponent is odd
   jz .even
   
   # If odd, multiply result by base
   imulq %rbx, %rax
   
.even:
   # Square the base
   imulq %rbx, %rbx
   
   # Divide exponent by 2
   shrq $1, %rcx
   
   jnz .loop        # Continue if exponent not zero

.done:
   popq %rbx        # Restore rbx
   ret

.section .note.GNU-stack,"",@progbits
