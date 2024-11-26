.global _start

_start:
	/* The branch operation (B) jumps to a specified label depending on the flags set in the CPSR register. The B mnemonic alone simply jumps to the
	 * specified label regardless of any condition. To effectively perform a comparison, the mnemonic must be combined with any of a number of mnemonic
	 * extensions.
	 *
	 * The entire list of extensions can be found at the link below:
	 * https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/Instruction-Details/Conditional-execution
	 */
	mov r0, #0x4 // Moves the value 4 into r0.
	mov r1, #0x5 // Moves the value 5 into r1.
	cmp r1, r0 // Compares the valuee stored in r0 to the value stored in r1 and stores the result in r1
	blt cond1 /* The LT extension indicates that the specified label should be jumped to if the first value from the previous comparison was less than
		   * the second value*/
	bge cond2 /* The GE extension indicates that the specified label should be jumped to if the first value from the previous comparison was greater
		   * than or equal to the second value.*/

cond1:
	mov r0, #0x0 // if the first value is less than the second value, move the value 0 into r0.

	mov r7, #0x1
	swi 0

cond2:
	mov r0, #0x1 // if the first value is greater than or equal to the second value, move the value 1 into r1.

	mov r7, #0x1
	swi 0 /* Note that both conditions have separate swi calls and the start label has none. This is because execution will continue from the end of
	       * whichever label the branch jumps to regardless of whether the other conditions are true unless steps are taken to halt or redirect
	       * execution.*/


