.global _start

_start:
	mov r0, #0x4
	mov r1, #0x2

	/* The multiply instruction (mul) multiplies a specified value by the value
	 * stored in a specified register. It takes three arguments:
	 *	1. The destination register.
	 *	2. The register containing the first value to multiply.
	 *	3. The register containing the second value to multiply..
	 *
	 * The values must be provided by registers. If both registers are provided,
	 * the destination register may not be the same as one of the operand 
	 * registers. If only two values are provided, the first will be assumed to
	 * be both the destination and the first operand.*/

	/* Multiplies the value stored in r0 by the value stored in r1 and stores
	 * the result in r0:*/
	mul r0, r1

	mov r7, #0x1
	swi 0	
	