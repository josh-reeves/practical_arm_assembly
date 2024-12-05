.global _start

_start:
	// In Lesson 10, it was mentioned that the first four registers, R0 - R3, are used for function arguments:
	mov r0, #0x3
	mov r1, #0x5
	mov r2, #0x7
	mov r3, #0x2

	// At this point, 

	mov r4, #0x9

end:
	mov r7, #0x1
	swi 0
