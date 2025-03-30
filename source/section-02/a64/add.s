.global _start

_start:
	mov x0, #0x0
	mov x1, #0x26

	add x0, x1, #0x12

	mov x8, #0x5d
	svc 0


