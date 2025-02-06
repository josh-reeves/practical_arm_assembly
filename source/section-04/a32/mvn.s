.global _start

_start:
	mov r0, #0x42 // Moves the value 66 into r0.

	/* The move and negate instruction (mvn) performs a bitwise negate on a
	 * specified value and moves it into a specified register. It takes two
	 * arguments:
	 *	1. The destination register.
	 *	2. The value to be moved and negated.
	 *
	 * The value can be provided either via a register or an immediate. The
	 * source and destination registers can be the same.
	 *
	 * The bitwise negate operation inverts each bit of the operand, setting
	 * each 0 to 1 and each 1 to 0.*/
	
	/* Performs a bitwise negate operation on the value stored in r0 and stores
	 * the result in r0:*/
	mvn r0, r0

	mov r7, #0x1
	swi 0
