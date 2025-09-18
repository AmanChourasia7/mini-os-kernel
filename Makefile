# Simple build system for Mini OS Kernel

ASM=nasm
CC=i686-elf-gcc
LD=i686-elf-ld
CFLAGS=-ffreestanding -O2 -Wall -Wextra -m32
LDFLAGS=-Ttext 0x1000 -m elf_i386

BUILD=build

all: kernel.bin

kernel.bin: boot/boot.asm kernel/kernel.c drivers/vga.c drivers/keyboard.c lib/util.c
	$(ASM) -f bin boot/boot.asm -o boot.bin
	$(CC) $(CFLAGS) -c kernel/kernel.c drivers/vga.c drivers/keyboard.c lib/util.c
	$(LD) $(LDFLAGS) -o kernel.elf kernel/kernel.o drivers/vga.o drivers/keyboard.o lib/util.o
	cat boot.bin kernel.elf > kernel.bin

run: kernel.bin
	qemu-system-x86_64 -drive format=raw,file=kernel.bin

clean:
	rm -f *.bin *.o *.elf
