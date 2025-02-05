.global _start

_start:
	mov r0, #0x42

	/* The orr instruction performs a bitwise and comparison on the bits of two
	 * provided values and stores the result in a provided register. It takes
	 * three arguments:
	 *	1. The destination register.
	 *	2. The first comparison value.
	 *	3. The second comparison value.
	 *
	 * One of the provided comparisons may be either a register or an immediate.
	 * The destination register can be the same as one of the source registers.
	 * If the third argument is omitted, the first argument will be assumed to
	 * be both the destination and the first comparison value.
	 *
	 * For each pair of bits in the provided comparison values, the or
	 * comparison will return 1 if either of the input bits is set to 1.*/
	
	/* Performs a bitwise or comparison on the value stored in r0 and 38 and
	 * stores the result in r0:*/
	orr r0, #0x26

	mov r7, #0x1
	swi 0
	
