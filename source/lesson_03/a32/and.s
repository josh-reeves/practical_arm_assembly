.global _start

_start:
	mov r0, #0x42
	and r0, r0, #0x26 //AND{s}{c}{q} {Rd}, Rn, (Rm/#Imm) Performs a bitwise AND operation on the bits of the first and second operands and stores the result in Rd. The second operand can be either a register or an immediate.

	mov r7, #0x1
	swi 0
	

