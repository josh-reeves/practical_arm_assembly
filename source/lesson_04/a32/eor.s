.global _start

_start:
	mov r0, #0x42
	eor r0, r0, #0x26 //Performs a bitwise Exclusive-OR  operation on the bits of the first and second operands and stores the result in Rd. The second operand can be a register or immediate.

	mov r7, #0x1
	swi 0
	
