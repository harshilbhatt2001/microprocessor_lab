; Mod-16 up counter
	INCLUDE VICVPB.s
	AREA COUNTER, CODE, READONLY
	EXPORT __main
__main
	ENTRY
		ldr r1, =IO0DIR
		ldr r0, =0x00FF0000
		str r0, [r1]
		ldr r2, =IO0SET
		ldr r3, =IO0CLR
repeat	ldr r4, =0x00000000
next	str r4, [r2]
		ldr r5, =0x2FFFFF
delay	subs r5, r5, #1
		bne delay
		str r0, [r3]
		add r4, r4, #0x00010000
		cmp r4, 0x000F0000
		bne next
		b repeat
	END