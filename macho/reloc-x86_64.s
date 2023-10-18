	.text
_g1:
	// X86_64_RELOC_BRANCH
	call _g2 + 20
_g2:
	// X86_64_RELOC_SIGNED
	movl _g1 + 20(%rip), %eax
	// X86_64_RELOC_SIGNED_1, extern=1
	movb  $0x12, _g1(%rip)
	// X86_64_RELOC_SIGNED_2, extern=1
	movw  $0x1234, _g1(%rip)
	// X86_64_RELOC_SIGNED_4, extern=1
	movl  $0x12345678, _g1(%rip)
	// X86_64_RELOC_SIGNED_1, extern=0
	movb  $0x12, L1(%rip)
	// X86_64_RELOC_SIGNED_2, extern=0
	movw  $0x1234, L1(%rip)
	// X86_64_RELOC_SIGNED_4, extern=0
	movl  $0x12345678, L1(%rip)
	// X86_64_RELOC_GOT_LOAD
	movq _g1@GOTPCREL(%rip), %rax
	// X86_64_RELOC_GOT
	pushq _g1@GOTPCREL(%rip)
	// X86_64_RELOC_TLV
	movq _g1@TLVP(%rip), %rax

	.data
L1:
	// X86_64_RELOC_UNSIGNED, extern=1
	.quad _g1 + 20
	// X86_64_RELOC_UNSIGNED, extern=0
	.quad L1 + 20
	// X86_64_RELOC_UNSIGNED, X86_64_RELOC_SUBTRACTOR
	.quad _g1 - _g2 + 20
