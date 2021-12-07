; Program to separate an array ten numbers into even array and odd array
EVEN	EQU 0x40000000
ODD		EQU	0x40000080
	AREA SEPERATE, CODE, READONLY
ENTRY
	ldr	r1, =num_array
	ldr r2, =EVEN
	ldr r3, =ODD
	mov r5, #10
next_element
	ldr r0, [r1], #4
	and r4, r0, 0x01
	cmp r4, 0x0
	beq even
odd	str r0, [r3], #4
	b continue
even	
	str r0, [r2], #4
continue
	subs r5, r5, #1
	bne next_element
s	B	s
num_array	DCD	0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0x0
	END