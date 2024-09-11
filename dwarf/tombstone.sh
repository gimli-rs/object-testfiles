CFLAGS="-fdebug-prefix-map=`pwd`=/object/testfiles/dwarf -ffunction-sections -Wl,-gc-sections -O3 -gdwarf-4"
g++-13 $CFLAGS tombstone.cpp -o tombstone-loc-0 -fuse-ld=bfd
g++-13 $CFLAGS tombstone.cpp -o tombstone-loc-addend -fuse-ld=gold
g++-13 $CFLAGS tombstone.cpp -o tombstone-loc-1 -fuse-ld=lld -B /usr/lib/llvm-16/bin
g++-13 $CFLAGS tombstone.cpp -o tombstone-loc-max -fuse-ld=lld -B /usr/lib/llvm-16/bin -z dead-reloc-in-nonalloc='.debug_*=0xffffffffffffffff' -z dead-reloc-in-nonalloc=.debug_loc=0xfffffffffffffffe -z dead-reloc-in-nonalloc=.debug_ranges=0xfffffffffffffffe

CFLAGS="-fdebug-prefix-map=`pwd`=/object/testfiles/dwarf -ffunction-sections -Wl,-gc-sections -O3 -gdwarf-5"
g++-13 $CFLAGS tombstone.cpp -o tombstone-loclists-0 -fuse-ld=bfd
g++-13 $CFLAGS tombstone.cpp -o tombstone-loclists-addend -fuse-ld=gold
g++-13 $CFLAGS tombstone.cpp -o tombstone-loclists-max -fuse-ld=lld -B /usr/lib/llvm-16/bin -z dead-reloc-in-nonalloc='.debug_*=0xffffffffffffffff' -z dead-reloc-in-nonalloc=.debug_loc=0xfffffffffffffffe -z dead-reloc-in-nonalloc=.debug_ranges=0xfffffffffffffffe
