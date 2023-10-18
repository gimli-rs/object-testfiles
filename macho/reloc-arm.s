	.subsections_via_symbols
	.text
	.arm
_g1:
	// ARM_RELOC_BR24, extern=1
	bl _g0 + 20
	// ARM_RELOC_BR24, extern=0
	bl _g2
	// ARM_RELOC_BR24, scattered
	bl _g2 + 20
	// ARM_RELOC_HALF, length=0
        movw r0, :lower16:(_g0 + 20)
	// ARM_RELOC_HALF, length=1
        movt r0, :upper16:(_g0 + 20)

	.p2align 2
	.globl _g2
	.thumb
_g2:
_g3:
	// ARM_THUMB_RELOC_BR22, extern=1
	bl _g0 + 20
	// ARM_THUMB_RELOC_BR22, extern=0
	bl _g2
	// ARM_THUMB_RELOC_BR22, scattered
	bl _g2 + 20
	// ARM_RELOC_HALF, length=2
        movw r0, :lower16:(_g0 + 20)
	// ARM_RELOC_HALF, length=3
        movt r0, :upper16:(_g0 + 20)

	.data
	// ARM_RELOC_VANILLA, extern=1
	.long _g0 + 20
	// ARM_RELOC_VANILLA, extern=0
	.long _g2
	// ARM_RELOC_VANILLA, scattered
	.long _g2 + 20
	// ARM_RELOC_SECTDIFF, ARM_RELOC_PAIR
	.long _g2 - _g1 + 20
	// ARM_RELOC_SECTDIFF, ARM_RELOC_PAIR
	// TODO: should be ARM_RELOC_LOCAL_SECTDIFF, ARM_RELOC_PAIR?
	.long _g3 - _g1 + 20
