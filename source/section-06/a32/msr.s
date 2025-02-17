.global _start

_start:
	msr cpsr, #0b11110000000000000000000000000000

	mrs r0, cpsr
	lsr r0, #0x1d

	mov r7, #0x1
	svc 0
