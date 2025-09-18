; boot.asm - Entry point
[bits 16]
[org 0x7C00]

start:
    cli                     ; Disable interrupts
    mov ax, 0x07C0
    add ax, 288             ; Load segment
    mov ss, ax
    mov sp, 0x7C00
    sti                     ; Enable interrupts

    ; Jump to kernel
    call kernel_main

hang:
    jmp hang

; Kernel entry point placeholder
kernel_main:
    ; We'll switch to 32-bit protected mode here in future
    ret

times 510-($-$$) db 0
dw 0xAA55
