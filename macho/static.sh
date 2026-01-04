#!/bin/sh
# Generate minimal static binaries with LC_UNIXTHREAD for entry point testing.

# ARM64 static binary
cat > /tmp/static_entry_arm64.s << 'ASM'
.global _main
.align 4
_main:
    mov x0, #0
    mov x16, #1
    svc #0x80
ASM
clang -arch arm64 -static -nostdlib -e _main /tmp/static_entry_arm64.s -o static-aarch64
rm /tmp/static_entry_arm64.s

# x86 (i386) static binary
cat > /tmp/static_entry_x86.s << 'ASM'
.global _main
.align 4
_main:
    xorl %eax, %eax
    ret
ASM
clang -arch i386 -static -nostdlib -e _main /tmp/static_entry_x86.s -o static-x86 2>/dev/null || echo "i386 not supported"
rm -f /tmp/static_entry_x86.s
