// STT_FUNC
int global_func(void) {
	return 1;
}

// STB_WEAK
__attribute__((weak)) int weak_func(void) {
	return 2;
}

// STT_OBJECT
int global_data = 3;

// STT_TLS
__thread int tls_var = 4;

// STT_GNU_IFUNC
static int ifunc_impl(void) {
	return 5;
}
static void *ifunc_resolver(void) {
	return (void *)ifunc_impl;
}
int ifunc_func(void) __attribute__((ifunc("ifunc_resolver")));

// SHN_ABS
__asm__(".globl abs_sym\n\t.set abs_sym, 0xfffff\n");

// Version default and non-default
__asm__(".symver versioned_func_v1, versioned_func@VERS_1");
__asm__(".symver versioned_func_v2, versioned_func@@VERS_2");
int versioned_func_v1(void) {
	return 7;
}
int versioned_func_v2(void) {
	return 8;
}
