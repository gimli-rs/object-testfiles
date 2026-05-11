set -e
WASI_VERSION=33
WASI_VERSION_FULL=${WASI_VERSION}.0
WASI_SDK=wasi-sdk-${WASI_VERSION_FULL}-x86_64-linux
wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/${WASI_SDK}.tar.gz
tar xvf ${WASI_SDK}.tar.gz
export WASI_SDK_PATH=`pwd`/${WASI_SDK}
CXX="${WASI_SDK_PATH}/bin/clang++ --sysroot=${WASI_SDK_PATH}/share/wasi-sysroot"
CXXFLAGS="-fdebug-prefix-map=`pwd`=/object/testfiles/wasm -matomics -fwasm-exceptions -g"
$CXX $CXXFLAGS -c reloc.cpp -o reloc.o
$CXX $CXXFLAGS -c reloc.cpp -o reloc-wasm64.o --target=wasm64
$CXX $CXXFLAGS -c reloc.cpp -o reloc-rel.o -fPIC
$CXX $CXXFLAGS -c reloc.cpp -o reloc-rel-wasm64.o -fPIC --target=wasm64
