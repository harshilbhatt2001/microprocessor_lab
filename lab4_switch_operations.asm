; Write a program to interface with switches to perform following operations:
; If SW8 is pressed, turn on, one LED, if SW7 is pressed, turn on, 2 LEDs, if
; SW6 is pressed, turn on, 4 LEDs and turn on, 8 LEDs if SW5 is pressed.
	INCLUDE VICVPB.s
	AREA CHANG, CODE, READONLY
	EXPORT __main
__main
	ENTRY
		ldr r1, =IO0DIR
		ldr r0, =0x00FF0000
		str r0, [r1]
		ldr r2, =IO0SET
		ldr r3, =IO0CLR
		ldr r4, =IO1PIN
		ldr r1, =IO1DIR
		str r0, [r2]
repeat	ldr r5, [r4]
		and r5, #0x00FF0000
		cmp r5, #0x00FF0000
		beq repeat
		cmp r5, #0x007F0000
		bleq led1
		cmp r5, #0x00BF0000
		bleq led2
		cmp r5, #0x00DF0000
		bleq led4
		cmp r5, #0x00FE0000
		bleq led8
		
led1	str r0, [r2]
		ldr r6, =0x00800000
		str r6, [r3]
		b repeat
led2	str r0, [r2]
		ldr r6, =0x00C00000
		str r6, [r3]
		b repeat
led4	str r0, [r2]
		ldr r6, =0x00F00000
		str r6, [r3]
		b repeat
led8	str r0, [r2]
		ldr r6, =0x00FF0000
		str r6, [r3]
		b repeat
		END
			
; SW8 (7F) -> 1 LED
; SW7 (BF) -> 2 LED
; SW6 (DF) -> 4 LED
; SW5 (EF) -> 6 LED
