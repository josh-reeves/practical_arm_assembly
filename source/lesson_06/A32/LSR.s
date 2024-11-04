.global _start

_start:

	mov r0, #0x28
	lsr r0, r0, #0x1

	mov r7, #0x1
	swi 0


