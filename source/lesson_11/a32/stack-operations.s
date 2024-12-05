.global _start

_start:
	// Lesson 10 introduced the concept of the PCS, which, among other things, recommends limiting the registers used to pass arguments to procedure calls to r0 - r3:
	mov r0, #0x3 // Arg 1
	mov r1, #0x5 // Arg 2
	mov r2, #0x7 // Arg 3
	mov r3, #0x2 // Arg 4

	/* At this point all of the registers the PCS recommends for passing arguments to a procedure have been used. While using additional registers may not cause the program
	 * to fail outright, other software following the PCS standard will not be expecting it, which could cause unexpected behavior. Instead, the stack can be utilized to
	 * store the additional arguments.
	 *
	 * In order to store a value from a register on the stack, memory must first be allocated from the stack. This, somewhat counterintuitively, is actually done by
	 * from the end of the stack, which can be located via the Stack Pointer register, sp. The reason this adds space to the stack, rather than removing it, is because the
	 * stack grows downward. When you're subtracting from the stack pointer, you're actually moving it down the stack by the number of bytes specified, which frees up
	 * additional space for use.
	 *
	 * In ARM assembly, an integer value uses 4 bytes of memory. To store two additional integer arguments on the stack, 8 bytes of memory will need to be allocated:*/
	sub sp, #0x8 // Allocates 8 bytes of memory from the stack by subtracting 8 from the value stored in the stack pointer.

	// Now that space has been allocated from the stack, the additional arguments can be stored:
	mov r4, #0x9 // Moves the value 9 into r4.
	str r4, [sp] // Stores the value from r4 in the location referenced by the stack pointer. This is argument 5.

	mov r4, #0x8 // Moves the value 8 into r4.
	str r4, [sp, #0x4] // Stores the value from r4 in location of referenced by the stack pointer offset by 4 bytes.

	// R3 will be used to load the stored values, so its value should be preserved by the caller. In this instance, we'll do this by storing its value in r4:
	mov r4, r3 // Moves the value from r3 into r4.

	bl add_nums // Branches to the add_nums procedure and sets the link register to the location of the next instruction from the current procedure.

	add sp, #0x8 // Deallocates the additional 8 bytes of memory that were allocated from the stack earlier now that they're no longer needed.

	mov r3, r4 // Restores r3's original value by moving it into r3 from r4.

	b end // Branch to end label.

add_nums:
	add r0, r1 // Add the values from r0 and r1 and store the result in r0.
	add r0, r2 // Add the values from r0 and r2 and store the result in r0.
	add r0, r3 // Add the values from r0 and r3 and store the result in r0.

	// Now the additional arguments stored on the stack can be loaded:
	ldr r3, [sp] // Load the value stored at the location referenced by the stack pointer into r3.
	add r0, r3 // Add the values from r0 and r3 and store the result in r0.

	ldr r3, [sp, #0x4] // Load the value stored at the location referenced by the stack pointer offset by 4 bytes into r3.
	add r0, r3 // Add the values from r0 and r3 and store the result in r0.

	bx lr // Branch back to the location referenced by the link register.

end:
	mov r7, #0x1
	swi 0
