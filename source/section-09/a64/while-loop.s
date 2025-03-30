
.global _start

_start:
	mov x0, #0x0

loop:
	/* The branch statement can be used in combination with labels to create
	 * loops. The code below compares the value stored in x0 to an immediate.
	 * If the value is x0 is greater than or equal to the immediate, execution
	 * jumps to the eixt label, which ends the program. Otherwise, 1 is added to
	 * the value stored in x0 and the branch mnemonic is used without an
	 * extension to redirect execution back to the beginning of the loop label.*/

	cmp x0, #0x5 // Compare the value stored in register x0 (0) to 5.

	/* If the value in x0 is greater than or equal to 5, redirect execution
	 * to the exit label:*/
	bge exit

	// If execution jumps to the end label, this portion of code is skipped.

	// Add 1 to the value stored in register x0. Store the result in register x0:
	add x0, x0, #0x1

	b loop // Redirect execution to the beginning of the loop label.

exit:
	mov x8, #0x5d
	svc 0

