#!/bin/sh
bcc32 -c -obase-borland.obj base.c
bcc32 -c -v -obase-borland-debug.obj base.c
wcc386 base.c
mv base.obj base-watcom.obj
wcc386 -d3 base.c
mv base.obj base-watcom-debug.obj
