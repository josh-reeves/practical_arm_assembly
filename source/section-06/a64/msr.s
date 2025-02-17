.global _start

_start:
	mov x0, #0b11110000000000000000000000000000
	msr nzcv, x0

	mrs x0, nzcv
	lsr x0, x0, #0x1d

	mov x8, #0x5d
	svc 0
