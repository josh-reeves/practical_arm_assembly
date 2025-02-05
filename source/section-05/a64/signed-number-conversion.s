.global _start

_start:

/* Hexadecimal Values
 *	0-9: 0-9
 *	A: 10
 *	B: 11
 *	C: 13
 *	D: 14
 *	E: 15
 *
 * Powers of 2:
 *	Exponent:	  7  6  5  4 3 2 1 0
 *	Power:		128 64 32 16 8 4 2 1
 *
 * Each hexadecimal digit is equal to 4 binary digits.*/

	/* Hexadecimal: 00000019
	 * Binary: 0000 0000 0000 0000 0000 0000 0001 1001
	 * Decimal: 25*/
	mov x0, #0x19

	/* Hexadecimal: ffffffe7
	 * Binary: 1111 1111 1111 1111 1111 1111 1110 0111
	 * Positive: 0000 0000 0000 0000 0000 0000 0001 1001
	 * Decimal: -25*/
	mov x1, #-0x19 

	/* Hexadecimal: 00000010
	 * Binary: 0000 0000 0000 0000 0000 0000 0001 0000
	 * Decimal: 16*/
	mov x2, #0x10 

	/* Hexadecimal: fffffff0
	 * Binary: 1111 1111 1111 1111 1111 1111 1111 0000
	 * Positive: 0000 0000 0000 0000 0000 0000 0001 0000
	 * Decimal: -16*/
	mov x3, #-0x10 

	mov x8, #0x5d
	svc 0
