.globl _start

_start:
	/* The LSL operator shifts the value stored in a register to the left by the 
	 * specified number of bits and stores the result in a specified destination
	 * register. The number of bits to shift by can be provided via either a 
	 * register or an immediate value. The source and destination registers can
	 * be the same. The register will be padded with zeros. Bits that "fall off" 
	 * the register are lost.*/
	mov r0, #0x8

	/* Shifts the value stored in r0 - 00000000000000000000000000000010 (2) - to
	 * the left by 2 bits. The result will be 00000000000000000000000000001000 
	 * (2). This is effectively the same as multiplying the source value by two
	 * the number of times specified by the shift value:*/
	lsl r0, #0x12

	mov r7, #0x1
	swi 0

