.global _start

/* The branch statement can be used in combination with labels to create loops. In the program below, the code under the loop label compares the value stored in r0 to an immediate. If the value is r0 is
 * greater than or equal to the immediate, execution jumps to the end label, which ends the program. Otherwise, 1 is added to the value stored in r0 and the branch mnemonic is used without an extension
 * to redirect execution back to the beginning of the loop label:*/
_start:
	mov r0, #0x0 // Move the value 0 into r0.

loop:
	cmp r0, #0x5 // Compare the value stored in register 0 to 5.
	bge end // If the value in r0 is greater than or equal to 5, redirect execution to the end label.

	// If execution jumps to the end label, this portion of code is skipped.
	add r0, #0x1 // Add 1 to the value stored in register 0. Store the result in register 0.

	b loop // Redirect execution to the beginning of the loop label.

end:
	mov r7, #0x1
	swi 0

