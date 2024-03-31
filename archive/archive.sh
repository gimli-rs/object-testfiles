for i in a b c; do
    printf "void ${i}_one() {}\nvoid ${i}_two() {}" | gcc -c -x c - -o ${i}.o
done
llvm-ar --format=gnu rcs gnu.a a.o b.o c.o
llvm-ar --format=bsd rcs bsd.a a.o b.o c.o
llvm-ar --format=gnu --thin rcs thin.a a.o b.o c.o
rm a.o b.o c.o
