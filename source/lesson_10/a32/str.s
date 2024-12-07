.global _start

.data
var1: .word 0

.text
_start:
	mov r0, #0x40 // Moves the hexadecimal value 64 into r0.

	/* Because access to the data segment is restricted to load and store operations, the Store Register (str) command must be used to store data
	 * there. The Store Register command is used to store data at a specified location in memory and takes two arguments:
	 *	- The first argument is specifies the register containing the data to be stored.
	 *	- The second argument specifies the memory location at which to store the data.
	 *
	 * To obtain this location, the Load Register command will be used to obtain the location of a declared variable:.*/
	ldr r1, =var1 // Loads the value of the variable var1 into register r1.
	str r0, [r1]  // Stores the value of r0 at the memory location specified by the value of r1*/

	ldr r0, [r1] // Reloads the value that was just stored in r0 so that it can be queried via the exit code.

end:
	mov r7, #0x1
	swi #0x0
	

