#!/bin/bash
export build_dir="build";
export src_dir=".";

truncate -s 1440k $build_dir/main_floppy.img; # creating empty .IMG file

nasm -f bin $src_dir/main.asm -o $build_dir/main.bin # build main.asm to .BIN
cp $build_dir/main.bin $build_dir/main_floppy.img; # main.BIN => main_floppy.IMG

