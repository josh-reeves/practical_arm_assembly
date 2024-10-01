.global _start

.text
_start:
	ldr r0 =var1
	ldr r1 [r0]
.data
var1: .word 5
var2: .word 6 
