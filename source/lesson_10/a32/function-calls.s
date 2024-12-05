.global _start

_start:
	/* While it isn't enforced by the language itself, it's recommended that procedure calls in ARM assembly adhere to the official Procedure Call Standard
	 * (PCS). Procedure Calls Standards ensure interopability between separately complied subroutines. In projects involving both ARM Assembly and C, for
         * example, the C code will often be assembled according to the PCS.
	 *
	 * The PCS conventions reserve the first four registers, r0 - r3, for use by the called procedure. This includes the passing of arguments. Additional
	 * arguments should be stored in the stack:*/
	mov r0, #0x4 // argument 1
	mov r1, #0x5 // argument 2

	/* Because the first four registers can be used by the called procedure. Their state should be preserved prior to the procedure call. For this reason,
	 * these registers are referred to as Caller-Saved. Conversely, registers r4 - r11 are Callee-Saved: If they are modified by a procdedure, the procedure
	 * should be responsible for preserving their state.*/
	push {r0, r1} // The values of r0 and r1 are pushed onto the stack for preservation.

	/* The branch with link instruction (BL) branches execution to the specified label. Unlike the branch instruction, however, the branch with link instruction
	 * stores the address of the next instruction from the current branch in the lr register. This can be used to return execution to the calling branch
	 * via the branch exchange instruction.*/
	bl add_nums

	/* The pop instruction is used below to retrieve the values pushed onto the top of the stack prior to the function call. Typically these values would be
	 * restored to their original registers. Here, because we are using the exit code, which is stored in r0, to evaluate the result of the program, we restore
	 * the original values to r4 and r5.*/
	pop {r4, r5}

	b end // Branch to the end label.

add_nums:
	/* Convention typically reserves r0 for a procedures return value:*/
	add r0, r1 // Adds the values stored in r0 and r1 together and stores the result in r0.

	/* The branch exchange instruction (BX) branches execution to the address and instruction specified by a provided register. Here it's used to return
	 * execution to the instruction after the bl instruction call under the start label by referencing the lr register. This register was set with the address of
	 * the next instruction under that label when the branch with link instruction was executed.*/
	bx lr

end:
	// End program execution:
	mov r7, #0x1
	swi 0
