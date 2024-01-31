#!/bin/sh
clang -c nostd.c --target=mipsel-unknown-elf -mabi=o32 -o nostd-mipsel.o
mipsel-unknown-elf-ld --entry=0 nostd-mipsel.o -o nostd-mipsel
