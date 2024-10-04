.global _start

.data // The .data segment stores complex data that isn't stored in a register for use during program execution. Does not store instructions.
var1: .word 5

.text // The .text portion of the program contains the instructions to execute.
_start:
	/* ARM assembly restricts the operations that are able to access the data segment to load/store type operations.
	 * This means that you can't move a value directly out of memory. It must be loaded first.*/
	ldr r0, =var1 // LDR{<c>}{<q>}  <Rt>, <label> assigns the memory address of the variable specified by label into the register specified by Rt.
	ldr r0, [r0] // LDR{<c>}{<q>}  <Rt>, [<Rn>, {+/-}<Rm>{, <shift>}] loads the value at the memory location specified by [Rn] to the register specified by Rt.

	mov r7, #0x1
	swi 0
	


