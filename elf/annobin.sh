gcc-13 -fplugin=./annobin.so base.c -fplugin-arg-annobin-note-format=string -o annobin-strtab
gcc-13 -fplugin=./annobin.so base.c -fplugin-arg-annobin-note-format=note -o annobin-note
