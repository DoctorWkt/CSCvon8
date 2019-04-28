# Sixth example program. This tests that the JSR/RTS
# instructions work. JSR to the printA subroutine to
# print out an 'A' and return. Then print out an 'F'
# and stop.

	NOP
	JSR printA
	LCA 'F'
	OUT A
L1:	JOU L1
x:	JMP $FFFF
	NOP
	NOP
	NOP
printA: LCA 'A'
	OUT A
L2:	JOU L2
	RTS printA
