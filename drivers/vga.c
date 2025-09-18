#include "vga.h"

unsigned short* vga_buffer = (unsigned short*)0xB8000;
int vga_index = 0;

void vga_clear() {
    for(int i=0;i<80*25;i++) vga_buffer[i] = 0x0F20; // white on black
    vga_index = 0;
}

void vga_putchar(char c) {
    if(c == '\n') vga_index += 80 - (vga_index % 80);
    else vga_buffer[vga_index++] = (0x0F << 8) | c;
}

void vga_print(const char* str) {
    while(*str) vga_putchar(*str++);
}
