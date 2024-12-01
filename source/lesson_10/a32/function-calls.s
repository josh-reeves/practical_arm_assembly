.global _start

_start:
	// a32 stores the first four arguments passed into a function call in registers r0 - r3. Additional arguments are pushed onto the stack.
	mov r0, #0x1 // argument 1
	mov r1, #0x1 // argument 2

	/* The branch with link instruction (BL) branches execution to the specified label. Unlike the branch instruction, however, the branch with link instruction
	 * stores the address of the next instruction from the current branch in the lr register. This can be used to return execution to the calling branch
	 * via the branch exchange instruction.*/
	bl add_nums

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
