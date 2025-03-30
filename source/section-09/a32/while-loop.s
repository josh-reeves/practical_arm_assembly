.global _start

_start:
	mov r0, #0x0

loop:
	/* The branch statement can be used in combination with labels to create
	 * loops. The code below compares the value stored in r0 to an immediate.
	 * If the value is r0 is greater than or equal to the immediate, execution
	 * jumps to the eixt label, which ends the program. Otherwise, 1 is added to
	 * the value stored in r0 and the branch mnemonic is used without an
	 * extension to redirect execution back to the beginning of the loop label.*/

	cmp r0, #0x5 // Compare the value stored in register r0 (0) to 5.

	/* If the value in r0 is greater than or equal to 5, redirect execution
	 * to the exit label:*/
	bge exit

	// If execution jumps to the end label, this portion of code is skipped.

	// Add 1 to the value stored in register r0. Store the result in r0:
	add r0, r0, #0x1

	b loop // Redirect execution to the beginning of the loop label.

exit:
	mov r7, #0x1
	svc 0

