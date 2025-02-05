.global _start

_start:
	mov r0, #0x4 // Moves the value 4 into r0.
	
	/* The Add command (add) adds a specified value to the value stored in a 
	 * specified register. It takes three arguments:
	 *	1. The destination register.
	 *	2. The first value to add.
	 *	3. The sceond value to add.
	 *
	 * The values can be provided via either immediates or registers. The
	 * destination register may be the same as one of the operand registers. If
	 * only two values are provided, the first will be assumed to be both the
	 * destination and the first operand.*/

	/* Adds the value 3 to the value currently stored in r0 and stores the
	 * result in r0:*/
	add r0, #3

	// Adds the value stored in r0 to itself and stores the result in r0:
	add r0, r0

	mov r7, #0x1
	swi 0

// Other Notes:
	// - The exit code is stored in the last 8 bits of the r0 register.
	


