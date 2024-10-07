.global _start

_start:
	mov r0, #0x42
	orr r0, r0, #0x26

	mov r7, #0x1
	swi 0
