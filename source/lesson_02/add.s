.global _start

_start:
	mov r0, #0x4 @Moves the value 4 into r0.
	
	@(ADD{S}<c> <Rd>, <Rn>, #<const>) Adds the value of <const> to the value stored in <Rn> and stores the result in <Rd>:
	add r0, r0, #3 @We deviate from the material and store result in r0. Seems to work fine and allows result of calculation to be queried via exit code. See additional notes for more.

	mov r7, #0x1
	swi 0

@Additional Notes:
	@The exit code is stored in the last 8 bits of the r0 register.


