; Internal DAC for sine waveform
	INCLUDE VICVPB.s
	AREA CHANG, CODE, READONLY
	EXPORT __main
__main	
	ENTRY
		ldr r0, =PINSEL1
		ldr r1, =DACR
		ldr r2, =0x00080000
		ldr r6, =0xFFFC
		str r2, [r0]
rampup	
		add r4, r4, #4
		str r4, [r1]
		;bl delay
		cmp r4, r6
		blo rampup
rampdown
		subs r4, r4, #4
		str r4, [r1]
		;bl delay
		cmp r4, 0x0
		bhi rampdown
		b rampup

sin	DCD	

delay
		ldr r5, =0x2F
del		subs r5, r5, #1
		bne del
		bx lr
		END