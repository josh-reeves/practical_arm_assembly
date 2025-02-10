.global _start

_start:
	mov r0, #0x49 // Moves the value 73 into r0.
	mov r1, #0x27 // Moves the value 39 into r1.
	mov r2, #0x13 // Moves the value 19 into r2.

	/* Lesson 12 introduced the concept of memory allocation. As explained in 
	 * that lesson, memory from the stack must be allocated before it can be 
	 * safely used to store data. This process typically requires calculating 
	 * the amount of memory needed in bytes, subtracting that many bytes from 
	 * the location referenced by the stack pointer and then storing the desired 
	 * data, offsetting its location as needed.
	 *
	 * ARM Assembly provides another way to accomplish this via the Push and Pop
	 * commands. The push command stores a specified list of registers on the 
	 * stack in numerical order, allocating memory as needed:*/
	push {r0, r1, r2} // Pushes registers r0, r1 and r2 onto the stack.

	/* The Pop command retrieves registers from the stack in numerical order, 
	 * deallocating memory as appropriate:*/
	pop {r0, r1, r2} // Pops registers r0, r1 and r2 off of the stack.

end:
	mov r7, #0x1
	swi #0x0
