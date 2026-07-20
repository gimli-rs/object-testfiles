llvm-dlltool-22 -m i386:x86-64 -d export.def -l export.lib -D export.dll
llvm-dlltool-22 -m i386:x86-64 -d delay.def -l delay.lib -D delay.dll
clang-22 -c --target=x86_64-pc-windows-msvc import.c -o import.obj
lld-link-22 import.obj export.lib delay.lib /DELAYLOAD:delay.dll \
    /SUBSYSTEM:CONSOLE /ENTRY:mainCRTStartup /NODEFAULTLIB /OUT:import.exe
rm export.lib delay.lib import.obj
