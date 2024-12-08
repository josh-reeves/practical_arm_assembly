.global _start

_start:
	/* Unlike shift operations, where bits that "fall off" of a register as the
	 * result of a shift operation (e.g. the leftmost bit of a register that is
	 * shifted 1 bit to the left) are lost, the Rotate Right (ROR) operation 
	 * moves or "rotates" these bits to the left-hand side of the register.
	 *
	 * The Rotate Right operation rotates the value from a register a specified 
	 * number of bits to the right. The number of bits can be specified via 
	 * either an immediate or another register. The source and destination 
	 * register can be the same.
	 *
	 * Note that there is no Rotate Left operation, as any left rotation can be
	 * accomplished via a sufficient number of right rotations.*/

	// Moves the value 9 (00000000000000000000000000001001) into register 0:
	mov r0, #0x9 

	// "Rotates" 9 two bits to the right: 01000000000000000000000000000010:
	ror r0, #0x2 

	mov r7, #0x1
	swi 0

