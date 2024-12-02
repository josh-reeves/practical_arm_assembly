.global _start

_start:
	// a32 stores the first four arguments passed into a function call in registers r0 - r3. Additional arguments are pushed onto the stack.
	mov r0, #0x4 // argument 1
	mov r1, #0x5 // argument 2

	/* ARM function calls typically use r0 for the return value. Because the registers used to pass data into the function call can by modified by the function
	 * itself, it's the caller's responsibility to preserve their state prior to the function call and restore it afterward. This can be done by store the
	 * registers' values on the stack. For convenience, the push instruction is used below to push the values of r0 and r1 onto the top of the stack.*/
	push {r0, r1}
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
	add r0, r1
	/* The branch exchange instruction (BX) branches execution to the address and instruction specified by a provided register. Here it's used to return
	 * execution to the instruction after the bl instruction call under the start label by referencing the lr register. This register was set with the address of
	 * the next instruction under that label when the branch with link instruction was executed.*/
	bx lr

end:
	// End program execution:
	mov r7, #0x1
	swi 0
