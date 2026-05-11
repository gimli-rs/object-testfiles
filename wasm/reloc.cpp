// Use --target=wasm64 for 64-bit relocations.
// Use -fPIC for relative relocations.
// Use -matomics for TLS relocations.
// Use -g for DWARF relocations.

extern void external_func(void);
static void static_func(void) {}

int global_int = 1;

struct point { int x; int y; };
struct point global_point = { 1, 2 };

thread_local int tls_counter = 0;

// R_WASM_MEMORY_ADDR_I32
int *data_ptr_to_global = &global_int;
// R_WASM_MEMORY_ADDR_I32, addend=4
int *data_ptr_with_addend = &global_int + 1;

// R_WASM_TABLE_INDEX_I32
void (*data_func_ptr)(void) = external_func;

// llvm.global.annotations section
// R_WASM_FUNCTION_INDEX_I32
__attribute__((annotate("my_annotation")))
void relocs(void) {
    // global.get 0:
    // R_WASM_GLOBAL_INDEX_LEB __stack_pointer+0

    // call 0
    // R_WASM_FUNCTION_INDEX_LEB _Z13external_funcv+0
    external_func();

    // i32.const 1
    // R_WASM_TABLE_INDEX_SLEB _Z13external_funcv+0
    void (*fp)(void) = external_func;

    // With -fPIC:
    // i32.const 0
    // R_WASM_TABLE_INDEX_REL_SLEB _ZL11static_funcv+0
    void (*fp2)(void) = static_func;

    // call_indirect 0
    // R_WASM_TYPE_INDEX_LEB 0+0
    // R_WASM_TABLE_NUMBER_LEB __indirect_function_table+0
    fp();

    // i32.store 0
    // R_WASM_MEMORY_ADDR_LEB global_int+0
    global_int = 3;
    // i32.store 8
    // R_WASM_MEMORY_ADDR_LEB global_point+4
    global_point.y = 3;

    // i32.const 0
    // R_WASM_MEMORY_ADDR_SLEB global_int+0
    int *p = &global_int;

    // i32.const 12
    // R_WASM_MEMORY_ADDR_TLS_SLEB tls_counter+0
    // global.get 1
    // R_WASM_GLOBAL_INDEX_LEB __tls_base+0
    // DWARF: R_WASM_GLOBAL_INDEX_I32
    tls_counter = 3;

    // catch 0
    // R_WASM_TAG_INDEX_LEB __cpp_exception+0
    try { external_func(); } catch (...) { }
}
