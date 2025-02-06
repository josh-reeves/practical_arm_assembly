.global _start

_start:
	mov r0, #0x3
	mov r1, #0x3

	/* The Application Program Status Register is an alias for the Current
	 * Program Status Register (cpsr). The bits of the cpsr register serve as 
	 * flags indicating the current state of the running program based on
	 * previously executed instructions (e.g. carry, zero, negative, overflow,
	 * etc.). This status can then be used for conditional branching.
	 *
	 * While some instructions will update the cpsr outright, others require an
	 * optional 's' flag to be added to an instruction's mnemonic. This includes
	 * most basic arithmetic instructions. (i.e. "add" will not update the cpsr,
	 * but "adds" will.) */

	/* The subs command is used to subract the value stored in r1 from the value
	 * stored in r0. the inclusion of the 's' flag results in the cpsr being
	 * updated based on the result:*/
	subs r0, r1

	/* The below just moves the value from the CPSR register into r0 and shifts
	 * it so that bits 29, 30 and 31 are the rightmost bits and appear in the
	 * exit code:*/
	mrs r0, cpsr 

	lsr r0, #0x1D 

	mov r7, #0x1
	swi 0
	

