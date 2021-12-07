; Write a program to read one byte, one half-word and on word at data memory locations
; starting from 0x40000000 (enter during runtime) and store these data back at data memory
; locations starting from 0x4000001C.
DEST	EQU	0x4000001C
	AREA PROGRAM1, CODE, READONLY
ENTRY
	ldr r1, =SOURCE
	ldr r2, =DEST
	ldrb r0, [r1]
	strb r0, [r2], #2
	ldrh r3, [r1]
	strh r3, [r2], #4
	ldr r4, [r1]
	str r4, [r2]
	
s	B	s

 AREA MEMORY, DATA, READWRITE
SOURCE	

RES SPACE 10
	END