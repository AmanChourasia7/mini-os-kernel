# Colab-ready Mini OS Kernel Makefile with _start.asm

ASM=nasm
CC=gcc
LD=ld
CFLAGS=-ffreestanding -O2 -Wall -Wextra -m32
LDFLAGS=-Ttext 0x1000 -m elf_i386

# Build everything
all: kernel.bin

# Final kernel binary depends on bootloader, entry point, and all object files
kernel.bin: boot/boot.asm kernel/entry.o kernel/kernel.o drivers/vga.o drivers/keyboard.o lib/util.o
	$(ASM) -f bin boot/boot.asm -o boot.bin
	$(LD) $(LDFLAGS) -o kernel.elf kernel/entry.o kernel/kernel.o drivers/vga.o drivers/keyboard.o lib/util.o
	cat boot.bin kernel.elf > kernel.bin

# Compile assembly entry point
kernel/entry.o: kernel/entry.asm
	$(ASM) -f elf32 kernel/entry.asm -o kernel/entry.o

# Compile each .c file into its corresponding .o
kernel/kernel.o: kernel/kernel.c kernel/kernel.h drivers/vga.h drivers/keyboard.h lib/util.h
	$(CC) $(CFLAGS) -c kernel/kernel.c -o kernel/kernel.o

drivers/vga.o: drivers/vga.c drivers/vga.h
	$(CC) $(CFLAGS) -c drivers/vga.c -o drivers/vga.o

drivers/keyboard.o: drivers/keyboard.c drivers/keyboard.h
	$(CC) $(CFLAGS) -c drivers/keyboard.c -o drivers/keyboard.o

lib/util.o: lib/util.c lib/util.h
	$(CC) $(CFLAGS) -c lib/util.c -o lib/util.o

# Run kernel in QEMU (graphics mode for visibility)
run: kernel.bin
	qemu-system-x86_64 -drive format=raw,file=kernel.bin

# Clean all generated files
clean:
	rm -f *.bin *.elf kernel/*.o drivers/*.o lib/*.o
