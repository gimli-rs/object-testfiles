#!/bin/sh
clang base.c --target=s390x-ibm-zos -m64 -c -o base.o
clang foo.c --target=s390x-ibm-zos -m64 -c -o foo.o
