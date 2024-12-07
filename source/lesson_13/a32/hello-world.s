.global _start

.data
	/* The .ascii directive provides a string literal without a null terminating
	 * character:*/
	hello: .ascii "Hello World!\n"
	
	/* The below is something of a trick. The '.' character references the 
	 * current location in memory. The length in byes of the hello directive can
	 * then be subtracted from that location to obtain the length of the 
	 * string:*/
	length: .word . - hello

.text
_start:
	ldr r2, =length // Loads the location of the length directive into r2.

	/* For ARM Assembly running on a linux system, the syscode for outputting a
	 * string to the console is 4. This code reqiures 3 arguments:
	 *	1. R0 holds a descriptor. For console output, this should be set to 1.
	 *	2. R1 holds a pointer to the string to be printed.
	 *	3. R2 holds the number of characters to output to the console.*/
	mov r0, #0x1 // Moves the value 1 into r0.
	ldr r1, =hello // Loads a pointer to the hello directive into r1.
	ldr r2, [r2] /* Loads the value referenced by the pointer formerly loaded
				  * into r2 into r2.*/
	mov r7, #0x4 // Moves 4 into r7. This is the syscall for string output.
	swi 0 // Executes a software interrupt with the above syscall code.

// Ends program execution:
end:
	mov r7, #0x1
	swi 0
