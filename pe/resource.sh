x86_64-w64-mingw32-windres resource.rc -O coff -o resource.res
x86_64-w64-mingw32-gcc base.o resource.res -o resource.exe
