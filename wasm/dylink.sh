CFLAGS="--target=wasm32 -fPIC -fvisibility=default -nostdlib"
LDFLAGS="--experimental-pic -shared --no-entry"

clang-22 $CFLAGS -c dylink.c -o dylink.o
wasm-ld-22 $LDFLAGS dylink.o -o dylink.wasm

clang-22 $CFLAGS -matomics -mbulk-memory -c dylink.c -o dylink-shared-memory.o
wasm-ld-22 $LDFLAGS --shared-memory --max-memory=65536 dylink-shared-memory.o -o dylink-shared-memory.wasm

clang-22 $CFLAGS -g -c dylink.c -o dylink-debug.o
wasm-ld-22 $LDFLAGS dylink-debug.o -o dylink-debug.wasm
