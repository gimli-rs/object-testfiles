xcrun --sdk watchos clang -arch armv7k -mwatchos-version-min=7.0 \
    -dynamiclib -Wl,-fixup_chains -o fixup-chains-armv7k.dylib fixup-chains.c
xcrun clang -arch arm64 -mmacosx-version-min=12.0 \
    -dynamiclib -Wl,-fixup_chains -o fixup-chains-arm64.dylib fixup-chains.c
xcrun clang -arch arm64e -mmacosx-version-min=12.0 \
    -dynamiclib -Wl,-fixup_chains -o fixup-chains-arm64e.dylib fixup-chains.c
xcrun clang -arch x86_64 -mmacosx-version-min=10.13 \
    -dynamiclib -o fixup-dyldinfo.dylib fixup-chains.c
