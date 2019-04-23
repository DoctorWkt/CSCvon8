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
