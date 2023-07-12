#!/bin/bash
nasm -f elf32 main.asm -o build/main.o
ld -m elf_i386 build/main.o -o build/main
./build/main
