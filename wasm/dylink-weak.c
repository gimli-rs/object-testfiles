extern int weak_undef(void) __attribute__((weak));
__attribute__((weak)) int weak_data = 1;
__attribute__((weak)) _Thread_local int weak_tls = 2;
__attribute__((weak)) int weak_func(void) { return 3; }

int get(void) {
    return (weak_undef ? weak_undef() : 0) + weak_data + weak_tls + weak_func();
}
