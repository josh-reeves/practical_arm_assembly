.global _start

_start:
	mov x0, #0x2a

	mov x8, 0x5d //Note that for A64 register x8 is used to store the syscall number. The "exit" syscall number has also been changed from 1 (0x1) to 93 (0x5d).
	svc 0
	

