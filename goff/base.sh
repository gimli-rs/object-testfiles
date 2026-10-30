#!/bin/sh
clang base.c --target=s390x-ibm-zos -m64 -c -o base.o
clang foo.c --target=s390x-ibm-zos -m64 -c -o foo.o

CFLAGS="-fdebug-prefix-map=`pwd`=/object/testfiles/goff"
clang-24 symbol.c $CFLAGS --target=s390x-ibm-zos -m64 -c -g -o symbol.o
