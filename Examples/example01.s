# First working program!
#
hello:	NOP
	LCA $34
	LCB $23
fred:	LDA A+B
	OUT A
L1:	JOU L1
	LCA $0A
	OUT A
L2:	JOU L2
end:	JMP $FFFF
