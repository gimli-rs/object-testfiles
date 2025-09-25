; Comprehensive OMF test file that demonstrates all identified parser issues
; Build with: wasm -ml -fo=comprehensive_test.obj comprehensive_test.asm

.model small
.386

; ========================================
; Segment definitions for various test scenarios
; ========================================

_TEXT	segment	word public 'CODE'
_TEXT	ends

_DATA	segment word public 'DATA'
_DATA	ends

CONST	segment word public 'DATA'
CONST	ends

_BSS	segment word public 'BSS'
_BSS	ends

; Group definition to test GROUP handling
DGROUP	group	_DATA, CONST, _BSS

; ========================================
; Code segment with various relocation types
; ========================================

_TEXT	segment
	assume	cs:_TEXT, ds:DGROUP

; Test 1: Thread subrecords and F/T bit handling
; This generates FIXUPP with thread definitions
test_threads proc near
	; Establish thread subrecords
	mov	ax, seg DGROUP		; Group reference
	mov	ds, ax

	; External references that may use threads
	mov	bx, offset external_var
	call	external_func

	; Far pointer that should generate fixup
	les	di, dword ptr far_ptr
	ret
test_threads endp

; Test 2: M-bit (segment-relative vs PC-relative)
test_mbit proc near
	; PC-relative jumps (M=0)
	jmp	short next_label
next_label:
	call	near_func

	; Segment-relative offsets (M=1)
	mov	ax, offset data_item
	mov	bx, offset test_threads

	; Direct memory reference (M=1)
	mov	cx, [data_item]

	ret
test_mbit endp

near_func proc near
	xor	ax, ax
	ret
near_func endp

; Test 3: Frame Method 3 (would need special encoding)
; Note: OpenWatcom assembler may optimize this differently
test_frame proc near
	; Attempt to generate explicit frame references
	db	0EAh			; Far JMP opcode
	dw	0			; Offset
	dw	0040h			; Frame number < 0x80

	db	0EAh			; Far JMP
	dw	0			; Offset
	dw	1234h			; Frame number > 0x80

	ret
test_frame endp

_TEXT	ends

; ========================================
; Data segment with various patterns
; ========================================

_DATA	segment

; Test data for relocations
data_item	dw	1234h
far_ptr		dd	test_threads		; Far pointer

; Test for LIDATA generation (if supported by assembler)
; Note: WASM typically generates LEDATA, not LIDATA
buffer1		db	100 dup(0)		; Repeated pattern
buffer2		dw	50 dup(0FFFFh)		; Repeated words

; References that generate fixups
code_refs	dw	offset test_threads
		dw	offset test_mbit
		dw	seg _TEXT

_DATA	ends

; ========================================
; BSS segment (uninitialized data)
; ========================================

_BSS	segment
uninit_data	dw	100 dup(?)
_BSS	ends

; ========================================
; COMDEF - Common definitions
; ========================================

; These generate COMDEF records
comm	near	shared_var:word:1
comm	far	shared_array:byte:256

; ========================================
; Absolute symbols - these should generate PUBDEF with segment_index == 0
; ========================================

; BIOS data area addresses
BIOS_TIMER_TICKS	EQU	046Ch		; Absolute address 0040:006C
BIOS_KEYBOARD_FLAGS	EQU	0417h		; Absolute address 0040:0017
VIDEO_MEMORY		EQU	0B800h		; Video memory segment (frame number)

; ========================================
; External declarations for fixup generation
; ========================================

extern	external_var:word
extern	external_func:near

; ========================================
; Public symbols
; ========================================

public	test_threads
public	test_mbit
public	data_item

	end	test_threads
