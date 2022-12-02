cl /c base.c /Fobase-bigobj.obj /bigobj
cl /c base.c /Fobase-GL.obj /GL
gcc -c base.c -o base-bigobj.o -Wa,-mbig-obj
