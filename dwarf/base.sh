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
clang++-18 $CFLAGS base.cpp -o base-clang-split-v4 -g2 -gdwarf-4 -gsplit-dwarf -fdebug-macro -fdebug-types-section
# llvm-dwp doesn't create .debug_macinfo.dwo
dwp -e base-clang-split-v4 -o base-clang-split-v4.dwp
clang++-18 $CFLAGS base.cpp -o base-clang-split-v5 -g2 -gdwarf-5 -gsplit-dwarf -fdebug-macro -fdebug-types-section
llvm-dwp-18 -e base-clang-split-v5 -o base-clang-split-v5.dwp
