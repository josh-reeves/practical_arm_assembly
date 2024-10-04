.global _start

.data
var1: .word 0

.text
_start:
	mov r0, #0x40

	/* In order to store a value in the data store, a location in memory must be provided.
	 * To obtain this location, we can use the LDR operation to obtain the location of a variable.*/
	ldr r1, =var1
	str r0, [r1]  // STR{<c>}{<q>}  <Rt>, [<Rn>, <Rm>{, <shift>}] stores the specified in  Rt in the memory location supplied by Rn.

	ldr r0, [r1] // Reloads the value we just stored into r0 so that it can be queried via the exit code.

	mov r7, #0x1
	swi 0
	

