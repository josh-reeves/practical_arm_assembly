.globl _start

_start:
	/* The LSR operator shifts the value stored in a register to the right by 
	 * the specified number of bits and stores the result in a specified 
	 * destination register. The number of bits to shift by can be provided via 
	 * either a register or an immediate value. The source and destination
	 * registers can be the same. The register will be padded with zeros. Bits
	 * that "fall off" the register are lost.*/
	mov x0, #0X8

	/* Shifts the value stored in r0 - 00000000000000000000000000001000 (8) - to
	 * the right by 2 bits. The result will be 00000000000000000000000000000010 
	 * (2). This is effectively the same as dividing the source value by two the
	 * number of times specified by the shift value:*/
	lsr x0, x0, #0x12

	mov x8, #0x5d
	svc 0

