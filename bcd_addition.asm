; PROBABLY WRONG
; Program to add two four digit Binary Coded Decimal numbers
	AREA ADDITION, CODE, READONLY
ENTRY
	ldr r1, number1
	ldr r2, number2
	add r3, r1, r2
	cmp r3, #9
	bhi add6
	b continue
add6
	add r3, r3, #6
continue
s	B	s
number1	DCD	5
number2	DCD	6
	END