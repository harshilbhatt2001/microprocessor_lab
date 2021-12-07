; DOES NOT WORK
; Display 8-bit johnson counter
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
repeat	MOV r4, 0x00100000
next	str r4, [r2]
		ldr r5, =0x2FFFFF
delay	subs r5, r5, #1
		bne delay
		str r0, [r3]
		mov r4, r4, ASR #1
		cmp r4, #0x01000000
		bne next
		b repeat
	END