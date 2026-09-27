#!/bin/sh
bcc32 -P -c -ocomdat-borland.obj comdat.cc
bcc32 -P -c -v -ocomdat-borland-debug.obj comdat.cc
wpp386 comdat.cc
mv comdat.obj comdat-watcom.obj
wpp386 -d3 comdat.cc
mv comdat.obj comdat-watcom-debug.obj
