.globl _start

_start:
	mov r0, #0x4
	mov r1, #0x2

	@ADD{S}<c> <Rd>, <Rn>, <Rm>{, <shift>} adds the value stored in <Rm> to the value stored in <Rn> and stores the result in <Rd>:
	add r0, r0, r1

	mov r7, #0x1
	swi 0

@Other Notes:
	@According to official docs. The PC register can be used for either operand.
	@The mov command can also take a register for its second argument.
	

