gcc-13 -shared -fPIC -o libexports.so exports.c -Wl,--version-script=exports.map
