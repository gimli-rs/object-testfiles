CFLAGS="-fdebug-prefix-map=`pwd`=/object/testfiles/dwarf -O3"
g++-13 $CFLAGS cold.cpp -o cold -fprofile-generate
./cold
g++-13 $CFLAGS cold.cpp -o cold -fprofile-use -g
