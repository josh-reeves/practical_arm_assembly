.globl _start

_start:

	mov r0, #0X28
	lsl r0, r0, #0X1

	mov r7, #0x1
	swi 0



