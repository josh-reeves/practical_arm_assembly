.global _start

_start:
	mov r0, #0x4 // Moves the value 4 into r0.
	mov r1, #0x2 // Moves the value 2 into r2.

	/* The subtract instruction (sub) subtracts a specified value from the value
	 * stored in a specified register. It takes three arguments:
	 *	1. The destination register.
	 *	2. The value to subtract from.
	 *	3. The value to subtract.
	 *
	 * The values can be provided via either immediates or registers. The
	 * destination register may be the same as one of the operand registers. If
	 * only two values are provided, the first will be assumed to be both the
	 * destination and the first operand.*/

	/* Subtracts the value stored in r1 from the value stored in r0 and stores
	 * the result in r0:*/
	sub r0, r1

	mov r7, #0x1
	swi 0
	
