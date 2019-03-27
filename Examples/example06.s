	JSR printA
	LCA 'F'
	OUTA
x:	JMP x
	NOP
	NOP
	NOP
printA: LCA 'A'
	OUTA
	RTS printA
