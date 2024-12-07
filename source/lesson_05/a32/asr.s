.globl _start

_start:
	/* The Arithemetic Shifth Right (ASR) operator shifts the value stored in a 
	 * register to the right by the specified number of bits and stores the 
	 * result in a specified destination register. Unlike the LSR operator, 
	 * however, the ASR operator pads the register with the value of the sign 
	 * bit. The number of bits to shift by can be provided via either register 
	 * or an immediate value. The source and destination registers can be the
	 * same.
     *
	 * Because two's compliment is used to represent signed values, the LSR operator, which pad's the byte with zeros, would remove
	 * the sign bit. Because the ASR operator pads the register with the sign bit, it allows bits to be shifted right without the sign
	 * being lost the register will be padded with sign bit to ensure that the result maintains the sign of the source.
	 *
	 * As with the other shift operators, bits that "fall off" the end of the register are lost.*/
	mov r0, #-0X8
	asr r0, r0, #0X2 /* Shifts the value stored in r0 - 11111111111111111111111111111000 (-8) - to the right by 2 bits. The result
		          * will be 11111111111111111111111111111110 (-2). Unlike the LSR operator, the sign bit is respected.*/
	mov r7, #0x1
	swi 0

