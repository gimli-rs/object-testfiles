#!/bin/sh
clang base.c --target=powerpc64-ibm-aix-xcoff -m64 -c -o base.o
clang base.c --target=powerpc64-ibm-aix-xcoff -m64 -o base.xcoff
clang base.c --target=powerpc-ibm-aix-xcoff -m32 -c -o base32.o
clang base.c --target=powerpc-ibm-aix-xcoff -m32 -o base32.xcoff
