; Internal DAC for square waveform
	INCLUDE VICVPB.s
	AREA CHANG, CODE, READONLY
	EXPORT __main
__main	
	ENTRY
		ldr r0, =PINSEL1
		ldr r1, =DACR
		ldr r2, =0x00080000
		str r2, [r0]
		ldr r3, =0xFFFF
back	str r3, [r1]
		bl delay
		str r4, [r1]
		bl delay
		b back
delay
		ldr r5, =0x2FFF
up		subs r5, r5, #1
		bne up
		bx lr
		END