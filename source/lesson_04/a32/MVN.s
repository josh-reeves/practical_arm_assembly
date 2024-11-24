.global _start

_start:
	mov r1, #0x42
	mvn r0, r1 //MVN{s} Rd, (Rm/#Imm): Performs a bitwise Negate operation on the bits of the second operand and stores the result in Rd. The second operand can be either a register or an immediate.

	mov r7, #0x1
	swi 0

