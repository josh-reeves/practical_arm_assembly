.global _start

_start:
	mov x0, #0x12
	mvn x0, x0

	mov x8, #0x5d
	svc 0
