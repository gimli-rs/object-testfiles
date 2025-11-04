#!/bin/sh
TMP=$(mktemp -d)
llvm-mc exports.s -filetype=obj -o "$TMP/exports.o"

# Generate a dylib with a stub-and-resolver entry as well as re-exported +
# aliased symbol entry (dyld_stub_binder is defined in libSystem, hence it
# is getting re-exported by our -alias flag here).
ld -dylib -arch arm64 -platform_version macos 15.0.0 15.5 \
    -syslibroot $(xcrun --show-sdk-path) -lSystem \
    "$TMP/exports.o" -o libexports.dylib \
    -alias dyld_stub_binder my_stub_binder

rm -rf "$TMP"
