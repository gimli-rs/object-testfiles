#!/bin/sh
clang -c -arch arm64 -mmacosx-version-min=15.0 imports.c -o imports.o
clang -arch arm64 -mmacosx-version-min=15.0 -rdynamic imports_main.c -o imports_main

# '-interposable' for BIND_SPECIAL_DYLIB_SELF
# '-bundle_loader' for BIND_SPECIAL_DYLIB_MAIN_EXECUTABLE
# '-U _flat_lookup' for BIND_SPECIAL_DYLIB_FLAT_LOOKUP
ld -bundle -arch arm64 -platform_version macos 15.0.0 15.5 \
    -syslibroot $(xcrun --show-sdk-path) -lSystem \
    -bundle_loader imports_main \
    -interposable \
    -U _flat_lookup \
    imports.o -o imports.bundle

rm imports.o imports_main

# LC_DYLD_INFO
clang -c -arch x86_64 -mmacosx-version-min=10.13 imports.c -o imports-x86_64.o
clang -arch x86_64 -mmacosx-version-min=10.13 -rdynamic imports_main.c -o imports_main-x86_64
ld -bundle -arch x86_64 -platform_version macos 10.13.0 10.13 \
    -syslibroot $(xcrun --show-sdk-path) -lSystem \
    -bundle_loader imports_main-x86_64 \
    -interposable \
    -U _flat_lookup \
    imports-x86_64.o -o imports-dyldinfo.bundle
rm imports-x86_64.o imports_main-x86_64
