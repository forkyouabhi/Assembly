.global _start

.section .data
byte_val:    .byte 0x1F                # Define a byte (8-bit)
word_val:    .2byte 0x1F1F             # Define a word (16-bit)
dword_val:   .4byte 0x1F1F1F1F         # Define a double-word (32-bit)
qword_val:   .8byte 0x1F1F1F1F1F1F1F1F # Define a quadword (64-bit)

.section .text
_start:
    # Load and store a byte
    movb byte_val(%rip), %al           # Load byte into lower 8-bit of AL
    movb %al, byte_val(%rip)           # Store it back to memory

    # Load and store a word
    movw word_val(%rip), %ax           # Load word into AX
    movw %ax, word_val(%rip)           # Store it back to memory

    # Load and store a double-word
    movl dword_val(%rip), %eax         # Load double-word into EAX
    movl %eax, dword_val(%rip)         # Store it back to memory

    # Load and store a quadword
    movq qword_val(%rip), %rax         # Load quadword into RAX
    movq %rax, qword_val(%rip)         # Store it back to memory

    # Exit the program
    movq $60, %rax                     # syscall number for exit
    xor %rdi, %rdi                     # status code 0
    syscall                            # make syscall to exit
