.global _start

_start:
	mov x0, #0x12
	mov x1, #0x26

	and x0, x0, x1

	mov x8, #0x5d
	svc 0
