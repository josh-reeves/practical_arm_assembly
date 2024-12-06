.global _start

_start:
	/* In ARM assembly, a block of code that performs a specific task is often referred to as a procedure. This is the equivalent of a function or method in
	 * other languages, and it's not uncommon for such control structures to be assembled as a prodcedure call.
	 *
	 * While not strictly enforced by the language itself, it's recommended that procedure calls in ARM assembly adhere to the official Procedure Call Standard
	 * (PCS). Procedure Calls Standards ensure interopability between separately complied subroutines. In projects involving both ARM Assembly and C, for
         * example, the C code will often be assembled according to the PCS.
	 *
	 * The PCS conventions reserve the first four registers, r0 - r3, for use by the called procedure. This includes the passing of arguments. Below, registers
	 * r1 and r2 are used to store the first two arguments for the procedure call:*/
	mov r1, #0x4 // Argument 1
	mov r2, #0x5 // Argument 2

	/* The branch with link instruction (BL) branches execution to the specified label. Unlike the branch instruction, however, the branch with link instruction
	 * stores the address of the next instruction from the current procedure in the lr register. This can then be used to return execution to the calling branch
	 * via the branch exchange instruction.*/
	bl add_nums

	b end // Branch to the end label.

add_nums:
	// Convention typically reserves r0 for a procedures return value:
	add r0, r1, r2 // Adds the values stored in r1 and r2 together and stores the result in r0.

	/* The branch exchange instruction (BX) branches execution to the address and instruction specified by a provided register. Here it's used to return
	 * execution to the instruction after the bl instruction call under the start label by referencing the lr register. This register was set with the address of
	 * the next instruction under that label when the branch with link instruction was executed.*/
	bx lr

end:
	// End program execution:
	mov r7, #0x1
	swi 0
