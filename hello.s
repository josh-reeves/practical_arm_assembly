.global _start


.section .text

_start:
	mov r0, #0x2a  @Moves an immediate (A constant number embedded into the instruction itself. Can be hex or int.) to the specified register.

	mov r7, #0x1 @Moves immediate into r7 register. Used by kernel to determine which system call is trying to be used.

	swi 0 @Causes a software interrupt  exception. The argument is ignored.
