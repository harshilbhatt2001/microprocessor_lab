; Program to sort in descending order
	AREA DESCENDING, CODE, READONLY
ENTRY
		mov r8, #4
		ldr r1, =CVALUE
		ldr r2, =DVALUE
; load values from code region and store in data region
loop0	ldr r0, [r1], #4
		str r0, [r2], #4
		subs r8, r8, #1
		bne loop0
start1	mov r5, #3
		mov r7, #0
		ldr r2, =DVALUE
loop	ldr r3, [r2], #4
		ldr r4, [r2]
		cmp r4, r3
		; if r3 > r4 go to loop2
		blt loop2
		str r3, [r2], #-4
		str r4, [r2]
		mov r7, #1
		add r2, #4
loop2	subs r5, r5, #1
		cmp r5, #0
		bne loop
		cmp r7, #0
		bne start1
s		B	s

CVALUE	DCD	0x44444444
		DCD 0x22222222
		DCD	0x11111111
		DCD	0x33333333
	AREA DATA1, DATA, READWRITE
DVALUE	DCD	0x00000000
	END