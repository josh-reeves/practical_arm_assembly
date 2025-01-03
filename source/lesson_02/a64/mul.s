.global _start

_start:
	mov x1, #0x5
	mov x2, #0x10

	mul x0, x1, x2

	mov x8, #0x5d
	svc 0
