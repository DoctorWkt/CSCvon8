# Second working program.
#
hello:	NOP
	LCA 'H'
	OUT A
L1:	JOU L1
	LCA 'e'
	OUT A
L2:	JOU L2
	LCA 'l'
	OUT A
L3:	JOU L3
	OUT A
L4:	JOU L4
	LCA 'o'
	OUT A
L5:	JOU L5
	LCA $0A
	OUT A
L6:	JOU L6
end:	JMP $FFFF
