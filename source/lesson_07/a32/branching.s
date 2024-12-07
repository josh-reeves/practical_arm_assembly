.global _start

_start:
	/* The branch operation (b) jumps to a specified label depending on the 
	 * flags set in the cpsr register. The B mnemonic alone simply jumps to the
	 * specified label regardless of any condition. To effectively perform a 
	 * comparison, the mnemonic must be combined with any of a number of 
	 * mnemonic extensions.
	 *
	 * The entire list of extensions can be found at the link below:
	 * https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/Instruction-Details/Conditional-execution */
	mov r0, #0x4 // Moves the value 4 into r0.
	mov r1, #0x5 // Moves the value 5 into r1.
	
	cmp r1, r0 /* Compares the valuee stored in r0 to the value stored in r1 and
				* stores the result in r1*/
	
	blt cond1 /* The LT extension indicates that the specified label should be
			   * jumped to if the first value from the previous comparison was
			   * less than the second value*/
	
	/* The GE extension indicates that the specified label should be executed
	 * next if the first value from the previous comparison was greater than or
	 * equal to the second value.*/
	bge cond2 // Jump to label cond2 if the value in r1 > the value in r0.

cond1:
	mov r0, #0x0

	mov r7, #0x1
	swi 0

	/* Unless steps are taken to redirect the program's flow, it will continue 
	 * until the software interrupt instruction is executed. For this reason the
	 * software interrupt has been placed under it's own label, which we can
	 * force the program to jump to by using the branch mnemonic without any 
	 * extensions:*/
	b end // Jump to label end.

cond2:
	mov r0, #0x1 /* If the first value is greater than or equal to the second 
				  * value, move the value 1 into r1.*/

	/* Note that the redirection from cond1 is not required at this point, as
	 * execution will continue from here into the end label regardless.*/

end:
	mov r7, #0x1
	swi 0

