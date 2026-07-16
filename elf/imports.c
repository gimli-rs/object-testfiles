// STT_FUNC
extern int global_func(void);
// STB_WEAK
__attribute__((weak)) extern int weak_func(void);
// STT_OBJECT
extern int global_data;
// STT_TLS
extern __thread int tls_var;

// Version default and non-default
extern int versioned_func(void);
extern int versioned_func_old(void);
__asm__(".symver versioned_func_old, versioned_func@VERS_1");

int use_imports(void) {
	global_func();
	if (weak_func) {
		weak_func();
	}

	versioned_func();
	versioned_func_old();

	return global_data + tls_var;
}
