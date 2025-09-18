# Mini OS Kernel

**Author:** Aman Chourasia

## 🎯 Design Philosophy

This project isn’t just about writing code, it’s about understanding the foundations of how an operating system works from the ground up. My goal with this mini kernel is to experiment, learn, and push the limits of low-level programming. Every line of C and Assembly here is crafted with clarity, minimalism, and control in mind.

Key principles guiding this project:

* **Simplicity:** Keep each component small and understandable.
* **Transparency:** Expose what’s happening at every stage of the boot and runtime process.
* **Modularity:** Make it easy to swap, upgrade, or extend parts of the kernel without breaking everything.
* **Learning-first:** Prioritize understanding over feature completeness — a kernel that teaches is better than a kernel that just runs.

This project is as much a personal exploration as it is a technical challenge — a playground to really *feel* what it takes to run a machine from scratch.

---

## ✨ Features

* GRUB-based bootloader (multiboot compliant)
* Kernel core in C with low-level Assembly
* Basic hardware drivers:

  * VGA text display
  * Keyboard input
  * Serial console (for debug output)
* Memory management: segmentation + paging
* Simple command-line shell

---

## 📂 Project Layout

```
mini-os-kernel/
│── boot/        # Bootloader and entry assembly
│── kernel/      # Core kernel (C + ASM)
│── drivers/     # Device drivers (keyboard, VGA, etc.)
│── lib/         # Utility functions
│── docs/        # Notes and design details
│── Makefile     # Build system
```

---

## 🚀 Build & Run

### Requirements

* Linux build environment
* `gcc` (cross-compiler: i686-elf-gcc recommended)
* `nasm` assembler
* GNU `ld` linker
* `grub` bootloader tools
* `qemu-system-x86_64` for testing

### Commands

```bash
make        # build kernel
make run    # run in QEMU
```

---

## 📌 Roadmap

* File system support (FAT12/FAT32)
* System calls
* Process scheduler (multitasking)
* User-space program execution
* Basic networking (future stage)

---

## 📜 License

**All Rights Reserved**
Copyright © Aman Chourasia, 2025

This project and its source code are the exclusive property of **Aman Chourasia**.
No part of this project may be copied, modified, distributed, or used in any form without explicit written permission from the author.

For inquiries about usage rights or special permissions, please contact:
**contact@amanchourasia.in**
