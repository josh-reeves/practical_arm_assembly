.global _start

_start:
	mov x0, #0x3
	mov x1, #0x3

	subs x0, x0, x1

	mrs x0, nzcv
	lsr x0, x0, #0x1d

	mov x8, #0x5d
	svc 0
