.global _start

_start:
	mov r0, #0x4
	mov r1, #0x2

	@MUL{S}{<c>}{<q>}  <Rd>, <Rn>{, <Rm>} multiplies the value of <Rn> by <RM> and stores the result in <Rd>. If <Rm> is omitted, <Rd> is used in its place. This command only works with registers:
	mul r0, r1

	mov r7, #0x1
	swi 0
	
@Other Notes:
	@Unlike with add and sub, the value of <Rd> and <Rm> cannot be the same.
	

