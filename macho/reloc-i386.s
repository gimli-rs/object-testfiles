	.subsections_via_symbols
	.text
_g1:
	// GENERIC_RELOC_VANILLA, pcrel=1, extern=1
	call _g0 + 20
	// GENERIC_RELOC_VANILLA, pcrel=1, extern=0
	call _g2
	// GENERIC_RELOC_VANILLA, pcrel=1, scattered
	call _g2 + 20

	.p2align 2
	.globl _g2
_g2:
_g3:
	ret

	.data
	// GENERIC_RELOC_VANILLA, pcrel=0, extern=1
	.long _g0 + 20
	// GENERIC_RELOC_VANILLA, pcrel=0, extern=0
	.long _g2
	// GENERIC_RELOC_VANILLA, pcrel=0, scattered
	.long _g2 + 20
	// GENERIC_RELOC_SECTDIFF, GENERIC_RELOC_PAIR
	.long _g2 - _g1 + 20
	// GENERIC_RELOC_LOCAL_SECTDIFF, GENERIC_RELOC_PAIR
	.long _g3 - _g1 + 20
