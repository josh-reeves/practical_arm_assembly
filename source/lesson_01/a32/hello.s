.global _start // Global ensures that the value '_start' is visible outside of the program for the linker. '_start' references a location in memory. Similar to function name.

_start:
	/* The Move command (mov) is used to set the value of a register by 
	 * "moving" a value into it. Registers are small, high-speed storage 
	 * locations built into the CPU. They are typically used for storing and 
	 * manipulating the data a program is actively working with.
	 *
	 * The AArch32 execution state leveraged to execute a32 instructions
	 * provides access to the following registers:
	 *	- 13 general purpose registers: r0 - r12.
	 *	- 2 registers that perform a special function but can be manipulated in 
	 *		the same manner as general purpose registers and used as such:
	 *		lr and sp.
	 *	- 1 program counter (pc) register.
	 *	- 1 application program status register (apsr/cpsr).*
	 *
	 * The move command takes two arguments:
	 *	1. The first is the destination register in which the specified value
	 *		will be set.
	 *	2. The second can be either an immediate (A constant number embedded 
	 *		into the instruction itself. Can be hex or int.) or the value from
	 *		another register.*/
	
	// Moves an immediate into the specified register, r0:
	mov r0, #0x2a  

	/* Moves immediate into r7 register. The r7 register is used by kernel to
	 * determine which call to invoke with the swi command:*/
	mov r7, #0x1 
	swi 0 // Causes a software interrupt exception. The argument is ignored.

/* Other Notes:
*	- The number of bits in a processor architecture typically refers to, among
*		other things, the capacity of the processor's registers.
*	
*	- The pc register increments by 4 for each instruction exectued because each
*		instruction is 4 bytes (32 bits) long.*/
