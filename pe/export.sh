# link.exe can't create a forward-by-ordinal export, so use lld-link.
clang-22 -c --target=x86_64-pc-windows-msvc export.c -o export.obj
lld-link-22 export.obj /DLL /NOENTRY /NODEFAULTLIB /DEF:export.def /OUT:export.dll
