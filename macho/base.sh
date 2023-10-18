#!/bin/sh
clang -c base.c -o base.o
clang base.c -o base
clang -fdebug-prefix-map=`pwd`=/object/testfiles/elf -g -c base.c -o base-debug.o
