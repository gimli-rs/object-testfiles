clang-16 --target=wasm32 -nostdlib -c global.c -o global-wasm32.o
wasm-ld-16 \
	--no-entry \
	--export-all \
	--allow-undefined \
	global-wasm32.o \
	-o global-wasm32

clang-16 --target=wasm64 -nostdlib -c global.c -o global-wasm64.o
wasm-ld-16 \
	-mwasm64 \
	--no-entry \
	--export-all \
	--allow-undefined \
	global-wasm64.o \
	-o global-wasm64
wasm-ld-16 \
	-mwasm64 \
	--no-entry \
	--export-all \
	--allow-undefined \
	--import-memory \
	global-wasm64.o \
	-o global-wasm64-import

