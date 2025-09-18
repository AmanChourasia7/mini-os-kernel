#include <stdint.h>

#define VGA_ADDRESS 0xB8000
#define WHITE_ON_BLACK 0x0F

void kmain() {
    volatile uint16_t* vga = (uint16_t*)VGA_ADDRESS;
    const char* msg = "Hello, Mini OS!";
    for (int i = 0; msg[i] != '\0'; i++) {
        vga[i] = (uint16_t)msg[i] | (WHITE_ON_BLACK << 8);
    }

    while (1) { __asm__ volatile("hlt"); }
}
