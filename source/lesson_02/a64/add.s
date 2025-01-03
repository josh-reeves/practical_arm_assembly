.global _start

_start:
	mov x1, #0x26
	mov x2, #0x12

	add x0, x1, #0x12

	mov x8, #0x5d
	svc 0


