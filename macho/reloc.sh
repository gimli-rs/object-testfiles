#!/bin/sh
llvm-mc-16 -n -triple i386-apple-darwin reloc-i386.s -filetype=obj -o reloc-i386.o
llvm-mc-16 -n -triple x86_64-apple-darwin reloc-x86_64.s -filetype=obj -o reloc-x86_64.o
llvm-mc-16 -n -triple thumbv7-apple-darwin reloc-arm.s -filetype=obj -o reloc-arm.o
llvm-mc-16 -n -triple arm64-apple-darwin reloc-aarch64.s -filetype=obj -o reloc-aarch64.o
