global _start
extern kmain

section .text
_start:
    cli                 ; disable interrupts
    call kmain          ; jump to C kernel
.halt:
    hlt                 ; stop CPU
    jmp .halt           ; infinite loop
