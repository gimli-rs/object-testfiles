lib /def:import_msvc_x64.def /machine:x64 /nologo
lib /def:import_msvc_x86.def /machine:x86 /nologo
lib /def:import_msvc_arm64ec.def /machine:arm64ec /nologo
lib import_msvc_x64.lib import_msvc_x86.lib import_msvc_arm64ec.lib /out:import_msvc.lib /nologo
rm import_msvc_*.lib
rm *.exp
