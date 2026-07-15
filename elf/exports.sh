#!/bin/sh
# Shared library that exercises every ELF export case handled by the unified
# read API: Address/Absolute/Tls/Resolver targets, global/weak binding,
# default/protected visibility, and default/hidden symbol versions.
gcc -shared -fPIC -o libexports.so exports.c -Wl,--version-script=exports.map
