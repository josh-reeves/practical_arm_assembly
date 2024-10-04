.global _start

_start:
	mov r0, #0x4
	mov r1, #0x2

	@SUB{S}{<c>}{<q>}  {<Rd>,} <Rn>, <Rm> {, <shift>} subtracts the value of <Rm> from <Rn> and stores the result in <Rd>
	sub r0, r0, r1

	mov r7, #0x1
	swi 0
	
