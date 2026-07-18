.text
.globl	_foo, _foo_resolver, _abs

_foo:
	ret

_foo_resolver:
	// EXPORT_SYMBOL_FLAGS_STUB_AND_RESOLVER
	.symbol_resolver	_foo
	ret

// EXPORT_SYMBOL_FLAGS_KIND_ABSOLUTE
_abs = 0xfffff

// EXPORT_SYMBOL_FLAGS_KIND_THREAD_LOCAL
.section	__DATA,__thread_data,thread_local_regular
.p2align	2, 0x0
_tls$tlv$init:
	.long	3

.section	__DATA,__thread_vars,thread_local_variables
.globl	_tls
_tls:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_tls$tlv$init

// EXPORT_SYMBOL_FLAGS_WEAK_DEFINITION
.text
.globl	_weak
.weak_definition	_weak
_weak:
	ret

.subsections_via_symbols
