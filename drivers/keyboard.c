#include "keyboard.h"

char keyboard_get_char() {
    unsigned char scancode = *(unsigned char*)0x60;
    if(scancode < 0x80) {
        return scancode_to_ascii(scancode);
    }
    return 0;
}

// Simple placeholder
char scancode_to_ascii(unsigned char sc) {
    if(sc >= 0x02 && sc <= 0x0B) return '1' + (sc-0x02);
    return '?';
}
