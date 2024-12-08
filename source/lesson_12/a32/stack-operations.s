.global _start

_start:
	/* Lesson 10 introduced the concept of the PCS, which, among other things, 
	 * recommends limiting the registers used to pass arguments to procedure 
	 * calls to registers r0 - r3:*/
	mov r0, #0x3 // Argument 1
	mov r1, #0x5 // Argument 2
	mov r2, #0x7 // Argument 3
	mov r3, #0x2 // Argument 4

	/* At this point all of the registers the PCS recommends for passing 
	 * arguments to a procedure have been used. While using additional registers 
	 * may not cause the program to fail outright, other software following the 
	 * PCS standard will not be expecting it, which could cause unexpected 
	 * behavior. Instead, the stack can be utilized to store the additional 
	 * arguments.
	 *
	 * The stack is an area of computer memory with that can be used to store 
	 * data when it wouldn't be possible or appropriate to do so with registers.
	 *
	 * The stack has a variable size. In order to store a value from a register 
	 * on the stack, memory must first be allocated. This, somewhat 
	 * counterintuitively, is actually done by subtracting from the end of the 
	 * stack, which can be located via the Stack Pointer register, sp. The 
	 * reason this adds space to the stack, rather than removing it, is because 
	 * the stack grows downward. When subtracting from the stack pointer, the 
	 * stack pointer is moved down the stack by the number of bytes specified, 
	 * which frees up additional space for use.
	 *
	 * In ARM assembly, an integer value uses 4 bytes of memory. To store two 
	 * additional integer arguments on the stack, 8 bytes of memory will need to 
	 * be allocated:*/

	/* Allocates 8 bytes of memory from the stack by subtracting 8 from the
	 * value stored in the stack pointer:*/
	sub sp, #0x8 

	/* Now that space has been allocated from the stack, the additional
	 * arguments can be stored.*/

	mov r4, #0x9 // Moves the value 9 into r4.

	/* Stores the value from r4 in the location referenced by the 
	 * stack pointer. This is argument 5:*/
	str r4, [sp] 

	mov r4, #0x8 // Moves the value 8 into r4.

	/* Stores the value from r4 in location of referenced by the stack pointer
	 * offset by 4 bytes:*/
	str r4, [sp, #0x4] 

	/* In addition to specifying which registers should be used to pass data 
	 * between procedures, the PCS also provides recommendations for how these 
	 * registers' original values should be preserved. Because registers r0 - r3 
	 * should be used or modified by a procedure, they are termed as
	 * caller-saved: The calling procedure is responsible for preserving their
	 * value. Conversely, registers r4 - r11 are callee-saved: If the called 
	 * procedure modifies them, it is responsible for preserving their original 
	 * values.
	 *
	 * R3 will be used to load the values for arguments 5 and 6, so its value 
	 * should be preserved. For now, this will be done by moving its value into 
	 * r4:*/
	mov r4, r3 // Sets the value of r4 to the value stored in r3.

	/* Branches to the add_nums procedure and sets the link register to the
	 * location of the next instruction from the current procedure:*/
	bl add_nums 

	/* Deallocates the additional 8 bytes of memory that were allocated from the
	 * stack earlier now that they're no longer needed:*/
	add sp, #0x8 

	mov r3, r4 // Restores r3's original value by moving it into r3 from r4.

	b end // Branch to end label.

add_nums:
	add r0, r1 // Add the values from r0 and r1 and store the result in r0.
	add r0, r2 // Add the values from r0 and r2 and store the result in r0.
	add r0, r3 // Add the values from r0 and r3 and store the result in r0.

	// Now the additional arguments stored on the stack can be loaded.

	/* Load the value stored at the location referenced by the stack pointer
	 * into r3:*/
	ldr r3, [sp]
	add r0, r3 // Add the values from r0 and r3 and store the result in r0.

	/* Load the value stored at the location referenced by the stack pointer
	 * offset by 4 bytes into r3:*/
	ldr r3, [sp, #0x4] 

	add r0, r3 // Add the values from r0 and r3 and store the result in r0.

	bx lr // Branch back to the location referenced by the link register.

end:
	mov r7, #0x1
	swi 0
