.global _start

_start:
	mov x1, #0x4 // Moves the value 5 into x1.

	cmp x1, #0x5 // Compares the value stored in x1 with the value 5 and updates the condition flags based on the result.

	bmi cond1 // The MI extension indicates that the instruction should only be executed if the N condition flag is set to 1.

cond1:
	mov x0, #0x1

	/* Unless steps are taken to redirect the program's flow, it will continue
	 * until the software interrupt instruction is executed. For this reason the
	 * software interrupt has been placed under it's own label, which we can
	 * force the program to jump to by using the branch mnemonic without any
	 * extensions:*/
	b exit // Jump to exit label.

cond2:
	mov x0, #0x2

	/* Note that the redirection from cond1 is not required at this point, as
	 * execution will continue from here into the end label regardless.*/

exit:
	mov x8, #0x5d
	svc 0

