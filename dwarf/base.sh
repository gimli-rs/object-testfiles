CFLAGS="-fdebug-prefix-map=`pwd`=/object/testfiles/dwarf -O3"
g++-13 $CFLAGS base.cpp -o base-gcc-g1 -g1
g++-13 $CFLAGS base.cpp -o base-gcc-g2 -g2
g++-13 $CFLAGS base.cpp -o base-gcc-macro -g3
clang++-18 $CFLAGS base.cpp -o base-clang-g1 -g1
clang++-18 $CFLAGS base.cpp -o base-clang-g2 -g2
clang++-18 $CFLAGS base.cpp -o base-clang-macinfo -gdwarf-4 -fdebug-macro
clang++-18 $CFLAGS base.cpp -o base-clang-macro -gdwarf-5 -fdebug-macro
g++-13 $CFLAGS base.cpp -o base-gcc-split -g2 -gsplit-dwarf
llvm-dwp -e base-gcc-split -o base-gcc-split.dwp
