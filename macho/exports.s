.text
.globl	_foo, _foo_resolver

_foo:
    ret

_foo_resolver:
     //  This causes ld to generate the stub-and-resolver export trie node.
	.symbol_resolver	_foo
	ret

.subsections_via_symbols
