.global _start

_start:
	mov r0, #0x3
	mov r1, #0x3

	@The CPSR register holds values (flags) that represent the current state of the running program. CPSR register flags are NOT set by default. An istruction's {s} option must be present to use them:
	subs r0, r0, r1 @The {s} option for the sub{s} command is used to so the CPSR regiser gets set.

	mov r7, #0x1
	swi 0
	

