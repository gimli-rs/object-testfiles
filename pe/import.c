__declspec(dllimport) int exported_named(void);
__declspec(dllimport) int exported_ordinal(void);
__declspec(dllimport) int delayed(void);

// Stub to avoid need for MSVC runtime.
void *__delayLoadHelper2(void *pidd, void *ppfnIATEntry) {
    return 0;
}

int mainCRTStartup(void) {
    return exported_named() + exported_ordinal() + delayed();
}
