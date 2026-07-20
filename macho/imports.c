extern int dup(int);
__attribute__((weak_import)) extern int close(int);
extern int main_executable();
extern int flat_lookup();

int interposable(void) { return 1; }

__attribute__((weak)) int weak_lookup(void) { return 2; }

void use_imports(void) {
    // Regular import
    dup(0);
    // N_WEAK_REF
    close(0);
    // BIND_SPECIAL_DYLIB_SELF
    interposable();
    // BIND_SPECIAL_DYLIB_MAIN_EXECUTABLE
    main_executable();
    // BIND_SPECIAL_DYLIB_FLAT_LOOKUP
    flat_lookup();
    // BIND_SPECIAL_DYLIB_WEAK_LOOKUP
    weak_lookup();
}
