.global _start @Global ensures that the value '_start' is visible outside of the program for the linker. '_start' references a location in memory. Similar to function name.

.section .text

_start:
	mov r0, #0x2a  @Moves an immediate (A constant number embedded into the instruction itself. Can be hex or int.) to the specified register.

	mov r7, #0x1 @Moves immediate into r7 register. Used by kernel to determine which system call is trying to be used.

	swi 0 @Causes a software interrupt  exception. The argument is ignored.

@Other Notes:
	@The number of bits in a processor architecture typically refers to the capacity of the processor's registers.
	@The pc register increments by 4 for each instruction exectued because each instruction is 4 bytes (32 bits) long.

