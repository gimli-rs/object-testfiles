#!/bin/sh
clang -c -arch arm64 -mmacosx-version-min=15.0 exports.s -o exports.o

# Add a re-exported + aliased symbol entry.
ld -r -arch arm64 -platform_version macos 15.0.0 15.5 \
    exports.o -o exports.o \
    -alias dyld_stub_binder my_stub_binder

ld -dylib -arch arm64 -platform_version macos 15.0.0 15.5 \
    -syslibroot $(xcrun --show-sdk-path) -lSystem \
    exports.o -o libexports.dylib
