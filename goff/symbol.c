extern __attribute__((visibility("default"))) int extern_default_data;
extern __attribute__((visibility("hidden"))) int extern_hidden_data;
int initialized_data = 42;
int uninitialized_data;
int weak_initialized_data __attribute__((weak)) = 43;
int weak_uninitialized_data __attribute__((weak));
__attribute__((visibility("default"))) int exported_initialized_data = 44;
static int static_initialized_data = 45;
static int static_uninitialized_data;

struct empty {};
__attribute__((visibility("default"))) struct empty default_empty_data;
__attribute__((visibility("hidden"))) struct empty hidden_empty_data;
static struct empty static_empty_data;

extern int extern_data;

const unsigned char global_read_only_table[256] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
    [128] = 128, [255] = 255,
};
static const unsigned char static_read_only_table[4] = {
    0, 1, 2, 3,
};

extern void extern_function(void);
extern void weak_extern_function(void) __attribute__((weak));
__attribute__((weak)) int weak_function(void) { return 1; }

int *data_pointer = &initialized_data;
void (*function_pointer)(void) = extern_function;

static long static_function(struct empty *e) {
    return (long)e;
}

__attribute__((visibility("default"))) long default_function(struct empty *e) {
    return (long)e;
}

__attribute__((visibility("hidden"))) int hidden_function(int a) {
    extern_function();
    if (weak_extern_function)
        weak_extern_function();
    weak_function();
    return
        extern_default_data
        + extern_hidden_data
        + initialized_data
        + uninitialized_data
        + weak_initialized_data
        + weak_uninitialized_data
        + exported_initialized_data
        + static_initialized_data
        + static_uninitialized_data
        + default_function(&default_empty_data)
        + static_function(&hidden_empty_data)
        + static_function(&static_empty_data)
        + extern_data
        + global_read_only_table[a & 0xff]
        + static_read_only_table[a & 0x3]
        + *data_pointer;
}
