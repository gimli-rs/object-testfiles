#!/bin/sh
gcc -c base.c -o base.o
gcc base.c -o base -Xlinker --hash-style=both
objcopy --only-keep-debug base base.debug
llvm-objcopy-6.0 --strip-sections base base.strip
gcc-15 -c base.c -o base-sframe.o -Wa,--gsframe
gcc-15 base.c -o base-sframe -Wa,--gsframe
x86_64-linux-gnu-gcc-11 -fcf-protection=full -c base.c -o base-x86_64-gnu-properties.o
aarch64-linux-gnu-gcc -c base.c -o base-aarch64.o
aarch64-linux-gnu-gcc base.c -o base-aarch64
aarch64-linux-gnu-gcc-11 -mbranch-protection=standard -c base.c -o base-aarch64-gnu-properties.o
mips64el-linux-gnuabi64-gcc -c base.c -o base-mips64el.o
mips64el-linux-gnuabi64-gcc base.c -o base-mips64el
loongarch32-unknown-linux-gnu-gcc -c base.c -o base-loongarch32.o
loongarch32-unknown-linux-gnu-gcc base.c -o base-loongarch32
loongarch64-unknown-linux-gnu-gcc -c base.c -o base-loongarch64.o
loongarch64-unknown-linux-gnu-gcc base.c -o base-loongarch64
gcc -fdebug-prefix-map=`pwd`=/object/testfiles/elf -g -c base.c -o base-debug.o
objcopy --compress-debug-sections=zlib-gnu base-debug.o base-debug-zlib-gnu.o
objcopy --compress-debug-sections=zlib base-debug.o base-debug-zlib.o
objcopy --compress-debug-sections=zstd base-debug.o base-debug-zstd.o
gcc -shared -fPIC -o libbase.so base.c -Wl,--default-symver
x86_64-linux-gnu-gcc-13 base.c -o base-relr-x86_64 -Wl,-z,pack-relative-relocs
i686-linux-gnu-gcc-13 base.c -o base-relr-i686 -Wl,-z,pack-relative-relocs
clang-21 -c base.c -o base-crel.o -Wa,--crel,--allow-experimental-crel
