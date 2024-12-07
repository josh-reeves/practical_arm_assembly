.global _start

.data
	hello: .ascii "Hello World!\n"
	length: .word . - hello

.text
_start:
	ldr r3, =length

	mov r0, #0x1
	ldr r1, =hello
	ldr r2, [r3]
	mov r7, #0x4
	swi 0

end:
	mov r7, #0x1
	swi 0
