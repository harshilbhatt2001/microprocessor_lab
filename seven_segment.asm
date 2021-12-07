; Program to interface seven segment display
	INCLUDE VICVPB.s
	AREA DISPLAY, CODE, READONLY
	EXPORT __main
__main
	ENTRY
		ldr r1, =IO0DIR
		ldr r0, =0xF0FF0000
		str r0, [r1]
		ldr r2, =IO0SET
		ldr r3, =IO0CLR
s		str r0, [r3]
		ldr r1, =0x803F0000
		str r1, [r2]
		bl delay
		ldr r1, =0x40060000
		str r1, [r2]
		bl delay
		ldr r1, =0x205B0000
		str r1, [r2]
		bl delay
		ldr r1, =0x104F0000
		str r1, [r2]
		bl delay
		
delay
		ldr r5, =0x2FF
wait	subs r5, r5, #1
		bne wait
		bx lr
	END