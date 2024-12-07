.global _start

/* Assembly code can be broken into segments:
 *	- Data segments hold data for use during program execution.
 *	- Text segments contain executable code.*/

.data
var1: .word 5

.text
_start:
	/* ARM assembly restricts the operations that are able to access memory to 
	 * load/store type operations. This means that infomration stored in the 
	 * data segment can't be directly accessed or manipulated without being 
	 * loaded into a register first.
	 *
	 * This can be accomplished with the Load Register (ldr) command. The ldr 
	 * command loads information store in memory into a register. It takes two
	 * arguments:
	 *	- The first argument is the register in which the data will be stored.
	 *	- The second argument is the location in memory from which data loaded.
	 *
	 * Because the location of var1 isn't known, the ldr command can also be 
	 * used to load the memory location of a specified variable by appending the
	 * = character to the variables name:*/
	ldr r0, =var1 /* The Load Register command assigns the memory address of 
				   * variable var1 to r0.*/
				   
	ldr r0, [r0] /* Now the ldr command is used to load the value stored at the 
				  * memory location specified by r0 and stores it in r0.*/

end:
	mov r7, #0x1
	swi 0
	
