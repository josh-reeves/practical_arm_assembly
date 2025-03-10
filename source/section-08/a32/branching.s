.global _start

_start:
	mov r1, #0x4 // Moves the value 5 into r1.

	cmp r1, #0x5 // Compares the value stored in r1 with the value 5 and updates the condition flags based on the result.

	bmi cond1 // The MI extension indicates that the instruction should only be executed if the N condition flag is set to 1.

cond1:
	mov r0, #0x1

	/* Unless steps are taken to redirect the program's flow, it will continue
	 * until the software interrupt instruction is executed. For this reason the
	 * software interrupt has been placed under it's own label, which we can
	 * force the program to jump to by using the branch mnemonic without any
	 * extensions:*/
	b exit // Jump toexit label.

cond2:
	mov r0, #0x2

	/* Note that the redirection from cond1 is not required at this point, as
	 * execution will continue from here into the end label regardless.*/

exit:
	mov r7, #0x1
	svc 0

