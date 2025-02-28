# The code is pretty straightforward. We first compute 2^3, then add 2 to the result. Next, we compute (10^7) and store the result in the  res  variable. Finally, we print the result using  printf . 
# Compile and run the program: 
# $ as -o CalculationExponents.o CalculationExponents.s
# $ gcc -o CalculationExponents CalculationExponents.o
# $ ./CalculationExponents

.section .data
fmt:    .string "Result: %ld\n"

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

    # Add 2 (result = 10)
    addq $2, %rax

    # Compute (10^7)
    movq $7, %rcx
    call power

    # Store result in res
    movq %rax, res

    # Print result using printf
    movq $fmt, %rdi    # Format string
    movq res, %rsi     # Value to print
    xorq %rax, %rax    # Clear RAX for variadic function
    call printf

    # Exit
    movq $60, %rax
    xorq %rdi, %rdi
    syscall

power:
    # Compute %rax^%rcx (Exponentiation by Squaring)
    movq %rax, %rbx  # Base
    movq $1, %rax    # Result
.loop:
    testq %rcx, %rcx
    jz .done
    imulq %rbx, %rax  # Multiply result by base
    loop .loop
.done:
    ret

.section .note.GNU-stack,"",@progbits 
 

