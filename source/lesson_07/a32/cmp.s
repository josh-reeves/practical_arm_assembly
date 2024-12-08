.global _start

	/* https://developer.arm.com/documentation/ddi0403/d/Application-Level-Architecture/Instruction-Details/Alphabetical-list-of-ARMv7-M-Thumb-instructions/CMP--register- */

_start:
	/* The Compare command (cmp) subtracts a value from the value stored in a 
	 * register and sets the condition flags in the cpsr register depending on
	 * whether the result is positive, negative or zero. This can be used to
	 * determine which, if either, of the two values is greater. The raw result
	 * of the calculation is discarded.
	 *
	 * The flag that is set depends on the result of the calcuation:
	 * 		- If the second value is larger than the first value and the result
	 *			is negative, the negative condition flag, N is
	 *		  	set to 1.
	 *		- If the first value is larger than the second value and the result
	 *			is positive, the carry condition flag, C [29], is set to 1, 
	 *			indicating that nothing needed to be borrowed to perform the 
	 *			subtration.
	 *		- If the first and second value are the same and the result is zero,
	 *			the zero condition flag, Z [30], and the carry condition flag, 
	 *			C [29], are both set to 1.*/

	// Moves the value 3 (00000000000000000000000000000011) into register r0:
	mov r0, #0x3 
	
	/* The below compares the value store in r0 (3) to the value 5 to determine
	 * which is greater. This comparison is done by subtracting the value in the 
	 * first register from the one in the second register:
	 *   00000000000000000000000000000011
	 * - 00000000000000000000000000000101
	 *	----------------------------------
	 *	 11111111111111111111111111111110
	 */
	cmp r0, #0x5
    
	/* The below just moves the value from the CPSR register into r0 and shifts
	 * it so that bits 29, 30 and 31 are the rightmost bits and appear in the
	 * exit code:*/
	mrs r0, cpsr 

	/* Because the N flag was set to 1 before the shift, this will be 4 in 
	 * decimal:*/
	lsr r0, #0x1D 
				   
	mov r7, #0x1
	swi 0

