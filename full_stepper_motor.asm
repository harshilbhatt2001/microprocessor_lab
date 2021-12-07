; Stepper motor, full step (1.8 deg)
	INCLUDE VICVPB.s
	AREA MOTOR, CODE, READONLY
	EXPORT __main
__main
	ENTRY
		ldr r1, =IO0DIR
		ldr r0, =0xF000
		str r0, [r1]
		ldr r2, =IO0SET
		ldr r3, =IO0CLR
s		ldr r5, =0x8000
back	str r0, [r3]
		str r5, [r2]
		ldr r4, =0x2FFF
delay	subs r4, r4, #1
		bne delay
		mov r5, r5, LSR #1
		cmp r5, #0x800
		bne back
		b	s
		END