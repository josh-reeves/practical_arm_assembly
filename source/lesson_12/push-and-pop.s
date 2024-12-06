.global _start

_start:
	/* Lesson 11 introduced the concept of memory allocation. As explained in that lesson, memory from the stack must be allocated before it can
	 * be safely used to store data. This process typically requires calculating the amount of memory needed in bytes, subtracting that many
	 * bytes from the location referenced by the stack pointer and then storing the desired data, offsetting its location as needed.
	 *
	 */

end:
	mov r7, #0x1
	swi #0x0
