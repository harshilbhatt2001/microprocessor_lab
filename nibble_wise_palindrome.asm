; program to verify that word read from memory is nibble-wise palindrome
	AREA NIBBLEPAL, CODE, READONLY
ENTRY
	LDR R0, =NUMBER
	LDR	R1, [R0]
	AND R2, R1, #0xF
	MOV R2, R2, LSL#12
	AND R3, R1, #0xF0
	MOV R3, R3, LSL#4
	ORR R2, R3
	AND R4, R1, #0xF00
	MOV R5, R5, LSR#12
	ORR R2, R5
	AND R5, R1, #0xFF00
	CMP R2, R5
	MOVEQ R8, #0xFFFFFFFF
s	B	s			 	
	AREA DATA1, DATA, READWRITE
NUMBER DCW	0x1221
	END