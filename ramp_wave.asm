; Internal DAC (10 bit) for ramp waveform
	INCLUDE VICVPB.s
	AREA CHANG, CODE, READONLY
	EXPORT __main
__main	
	ENTRY
		ldr r0, =PINSEL1
		ldr r1, =DACR
		ldr r2, =0x00080000
		str r2, [r0]
back	mov r4, r3, lsl #6
		str r4, [r1]
		add r3, r3, #1
		b back
		END