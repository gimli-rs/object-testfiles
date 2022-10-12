#!/bin/sh
clang base.c --target=powerpc-ibm-aix-xcoff -c -o base.o
clang base.c --target=powerpc-ibm-aix-xcoff -o base.xcoff
