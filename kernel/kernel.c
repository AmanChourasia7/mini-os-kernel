#include "../drivers/vga.h"
#include "../drivers/keyboard.h"

void kernel_main() {
    vga_clear();
    vga_print("Mini OS Kernel Booted!\n");
    while(1) {
        char c = keyboard_get_char();
        if(c) {
            vga_putchar(c);
        }
    }
}
