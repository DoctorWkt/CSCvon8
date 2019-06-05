# These were generated automatically

SOOXXOO_XX:
		STO B istie		# User move 7
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOOXXXOOX_:
		STO B istie		# User move 9
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOOXXXO___:
		STO A board+8		# User move 7
		PPR smjump+1 SOOXXXOOX_-99
		JMP printboard
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOOXXX_O__:
		STO A board+8		# User move 6
		PPR smjump+1 SOOXXXOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOOXXX__O_:
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOOXXX___O:
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SOOX_X____:
		STO A board+7		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 7
		PPR smjump+1 SOOXXX_O__-66
		JMP printboard
		STO A board+4		# User move 8
		PPR smjump+1 SOOXXX__O_-66
		JMP printboard
		STO A board+4		# User move 9
		PPR smjump+1 SOOXXX___O-66
		JMP printboard
SOXOOXXXO_:
		STO B istie		# User move 9
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXOOX_X__:
		STO A board+8		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 8
		PPR smjump+1 SOXOOXXXO_-99
		JMP printboard
		STO A board+8		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOXOXO_XOX:
		STO B istie		# User move 6
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXOXXO_OX:
		STO B istie		# User move 7
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXOXX_OOX:
		STO B istie		# User move 6
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXOXX_O__:
		STO A board+8		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOXOXX__O_:
		STO A board+9		# User move 6
		PPR smjump+1 SOXOXXO_OX-77
		JMP printboard
		STO A board+6		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOXOX_OXOX:
		STO B istie		# User move 5
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXO_XOXOX:
		STO B istie		# User move 4
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXO_XO__X:
		STO A board+8		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 8
		PPR smjump+1 SOXOXXO_OX-77
		JMP printboard
SOXO_XXXOO:
		STO B istie		# User move 4
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXO_XX__O:
		STO A board+8		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SOXO_X_XO_:
		STO A board+6		# User move 4
		PPR smjump+1 SOXOOXXXO_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		PPR smjump+1 SOXO_XOXOX-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		PPR smjump+1 SOXO_XXXOO-44
		JMP printboard
SOXO_X____:
		STO A board+8		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 7
		PPR smjump+1 SOXOXX_O__-66
		JMP printboard
		STO A board+4		# User move 8
		PPR smjump+1 SOXOXX__O_-66
		JMP printboard
		STO A board+6		# User move 9
		PPR smjump+1 SOXO_XX__O-44
		JMP printboard
SOXXXOOO_X:
		STO B istie		# User move 8
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXXXOO_OX:
		STO B istie		# User move 7
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXXXO_OOX:
		STO B istie		# User move 6
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXXX_OOOX:
		STO B istie		# User move 5
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOXX_XO__O:
		STO A board+7		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SOX_OOXXOX:
		STO B istie		# User move 3
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOX_OXOX__:
		STO A board+8		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOX_OX_XO_:
		STO A board+6		# User move 3
		PPR smjump+1 SOXOOXXXO_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOX_OX_X_O:
		STO A board+8		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SOX_XOOXOX:
		STO B istie		# User move 3
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOX_XXOOOX:
		STO B istie		# User move 3
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SOX_XXOO__:
		STO A board+8		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		PPR smjump+1 SOX_XXOOOX-33
		JMP printboard
		STO A board+8		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOX_X__OOX:
		STO A board+5		# User move 3
		PPR smjump+1 SOXOXX_OOX-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 5
		PPR smjump+1 SOXXXO_OOX-66
		JMP printboard
		STO A board+3		# User move 6
		PPR smjump+1 SOXXX_OOOX-55
		JMP printboard
SOX__O_XOX:
		STO A board+4		# User move 3
		PPR smjump+1 SOXOXO_XOX-66
		JMP printboard
		STO A board+6		# User move 4
		PPR smjump+1 SOX_OOXXOX-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		PPR smjump+1 SOX_XOOXOX-33
		JMP printboard
SOX__XOXO_:
		STO A board+9		# User move 3
		PPR smjump+1 SOXO_XOXOX-44
		JMP printboard
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SOX__XO___:
		STO A board+8		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 4
		PPR smjump+1 SOX_OXOX__-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 8
		PPR smjump+1 SOX__XOXO_-33
		JMP printboard
		STO A board+3		# User move 9
		PPR smjump+1 SOXX_XO__O-44
		JMP printboard
SOX__X_XOO:
		STO A board+6		# User move 3
		PPR smjump+1 SOXO_XXXOO-44
		JMP printboard
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
SOX__X___O:
		STO A board+6		# User move 3
		PPR smjump+1 SOXO_XX__O-44
		JMP printboard
		STO A board+7		# User move 4
		PPR smjump+1 SOX_OX_X_O-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SOXX_XO__O-44
		JMP printboard
		STO A board+8		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 8
		PPR smjump+1 SOX__X_XOO-33
		JMP printboard
SOX____XO_:
		STO A board+5		# User move 3
		PPR smjump+1 SOXO_X_XO_-44
		JMP printboard
		STO A board+5		# User move 4
		PPR smjump+1 SOX_OX_XO_-33
		JMP printboard
		STO A board+9		# User move 5
		PPR smjump+1 SOX__O_XOX-33
		JMP printboard
		STO A board+5		# User move 6
		PPR smjump+1 SOX__XOXO_-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 9
		PPR smjump+1 SOX__X_XOO-33
		JMP printboard
SO_XXOO__X:
		STO A board+8		# User move 2
		PPR smjump+1 SOOXXOO_XX-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		PPR smjump+1 SOXXXOOO_X-88
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 SOXXXOO_OX-77
		JMP printboard
SO_XXXOOOX:
		STO B istie		# User move 2
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SO_XXXOOXO:
		STO B istie		# User move 2
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SO_XXXOO__:
		STO A board+8		# User move 2
		PPR smjump+1 SOOXXXOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		PPR smjump+1 SO_XXXOOOX-22
		JMP printboard
		STO A board+8		# User move 9
		PPR smjump+1 SO_XXXOOXO-22
		JMP printboard
SO_XXXO_O_:
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 7
		PPR smjump+1 SO_XXXOOOX-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SO_XXXO__O:
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		PPR smjump+1 SO_XXXOOXO-22
		JMP printboard
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SO_XX_O___:
		STO A board+5		# User move 2
		PPR smjump+1 SOOXXXO___-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 5
		PPR smjump+1 SO_XXOO__X-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 7
		PPR smjump+1 SO_XXXOO__-22
		JMP printboard
		STO A board+5		# User move 8
		PPR smjump+1 SO_XXXO_O_-22
		JMP printboard
		STO A board+5		# User move 9
		PPR smjump+1 SO_XXXO__O-22
		JMP printboard
SO__OX_X__:
		STO A board+3		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 3
		PPR smjump+1 SOXOOX_X__-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		PPR smjump+1 SOX_OXOX__-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 9
		PPR smjump+1 SOX_OX_X_O-33
		JMP printboard
SO__XX_OOX:
		STO A board+6		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		PPR smjump+1 SOX_XXOOOX-33
		JMP printboard
SO__XX_O__:
		STO A board+6		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 3
		PPR smjump+1 SOXOXX_O__-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		PPR smjump+1 SOX_XXOO__-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SO__XX__O_:
		STO A board+3		# User move 2
		PPR smjump+1 SOOXXX__O_-66
		JMP printboard
		STO A board+6		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SO_XXXO_O_-22
		JMP printboard
		STO A board+6		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SO___X____:
		STO A board+3		# User move 2
		PPR smjump+1 SOOX_X____-44
		JMP printboard
		STO A board+2		# User move 3
		PPR smjump+1 SOXO_X____-44
		JMP printboard
		STO A board+7		# User move 4
		PPR smjump+1 SO__OX_X__-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		PPR smjump+1 SOX__XO___-33
		JMP printboard
		STO A board+4		# User move 7
		PPR smjump+1 SO__XX_O__-22
		JMP printboard
		STO A board+4		# User move 8
		PPR smjump+1 SO__XX__O_-22
		JMP printboard
		STO A board+2		# User move 9
		PPR smjump+1 SOX__X___O-33
		JMP printboard
SXOOOOXXX_:
		STO B istie		# User move 9
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOOOXXX_O:
		STO B istie		# User move 8
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOOXX_O__:
		STO A board+9		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXOOXX__O_:
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXOOX_X__O:
		STO A board+7		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+5		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SXOOX_____:
		STO A board+7		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+5		# User move 7
		PPR smjump+1 SXOOXX_O__-66
		JMP printboard
		STO A board+5		# User move 8
		PPR smjump+1 SXOOXX__O_-66
		JMP printboard
		STO A board+6		# User move 9
		PPR smjump+1 SXOOX_X__O-55
		JMP printboard
SXOO_O_XX_:
		STO A board+9		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXOO_XXOXO:
		STO B istie		# User move 4
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOO_XX__O:
		STO A board+7		# User move 4
		PPR smjump+1 SXOOOXXX_O-88
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SXOO_X____:
		STO A board+9		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 7
		PPR smjump+1 SXOOXX_O__-66
		JMP printboard
		STO A board+4		# User move 8
		PPR smjump+1 SXOOXX__O_-66
		JMP printboard
		STO A board+6		# User move 9
		PPR smjump+1 SXOO_XX__O-44
		JMP printboard
SXOXOOXOX_:
		STO B istie		# User move 9
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOXOOX_XO:
		STO B istie		# User move 7
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOXOXO___:
		STO A board+9		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXOXOX_OXO:
		STO B istie		# User move 6
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOXOX__O_:
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+9		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXOXOX___O:
		STO A board+7		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+8		# User move 7
		PPR smjump+1 SXOXOX_OXO-66
		JMP printboard
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SXOXXOOOX_:
		STO B istie		# User move 9
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOXXOO_XO:
		STO B istie		# User move 7
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOXXO_OXO:
		STO B istie		# User move 6
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOX_O_OX_:
		STO A board+6		# User move 4
		PPR smjump+1 SXOXOOXOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		PPR smjump+1 SXOXXOOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 9
		PPR smjump+1 SXOXXO_OXO-66
		JMP printboard
SXOX_O__XO:
		STO A board+6		# User move 4
		PPR smjump+1 SXOXOOX_XO-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		PPR smjump+1 SXOXXOO_XO-77
		JMP printboard
		STO A board+4		# User move 7
		PPR smjump+1 SXOXXO_OXO-66
		JMP printboard
SXOX_XOOXO:
		STO B istie		# User move 4
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXOX_XOO__:
		STO A board+9		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+8		# User move 9
		PPR smjump+1 SXOX_XOOXO-44
		JMP printboard
SXOX_XO_O_:
		STO A board+7		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXOX_XO__O:
		STO A board+7		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		PPR smjump+1 SXOX_XOOXO-44
		JMP printboard
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SXOX__OX_O:
		STO A board+5		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SXO_OOX_X_:
		STO A board+7		# User move 3
		PPR smjump+1 SXOOOOXXX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		PPR smjump+1 SXOXOOXOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		PPR smjump+1 SXOXOOX_XO-77
		JMP printboard
SXO_OXOX__:
		STO A board+9		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXO_OX____:
		STO A board+9		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SXOXOXO___-77
		JMP printboard
		STO A board+9		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 8
		PPR smjump+1 SXOXOX__O_-66
		JMP printboard
		STO A board+3		# User move 9
		PPR smjump+1 SXOXOX___O-66
		JMP printboard
SXO_XOO_X_:
		STO A board+7		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		PPR smjump+1 SXOXXOOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXO__O__X_:
		STO A board+7		# User move 3
		PPR smjump+1 SXOO_O_XX_-44
		JMP printboard
		STO A board+6		# User move 4
		PPR smjump+1 SXO_OOX_X_-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		PPR smjump+1 SXO_XOO_X_-33
		JMP printboard
		STO A board+3		# User move 7
		PPR smjump+1 SXOX_O_OX_-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		PPR smjump+1 SXOX_O__XO-44
		JMP printboard
SXO__X_OXO:
		STO A board+6		# User move 3
		PPR smjump+1 SXOO_XXOXO-44
		JMP printboard
		STO A board+3		# User move 4
		PPR smjump+1 SXOXOX_OXO-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SXOX_XOOXO-44
		JMP printboard
SXO__X_O__:
		STO A board+4		# User move 3
		PPR smjump+1 SXOOXX_O__-66
		JMP printboard
		STO A board+9		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+8		# User move 9
		PPR smjump+1 SXO__X_OXO-33
		JMP printboard
SXO__X_XOO:
		STO A board+4		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
SXO__X__O_:
		STO A board+4		# User move 3
		PPR smjump+1 SXOOXX__O_-66
		JMP printboard
		STO A board+3		# User move 4
		PPR smjump+1 SXOXOX__O_-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SXOX_XO_O_-44
		JMP printboard
		STO A board+9		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		PPR smjump+1 SXO__X_XOO-33
		JMP printboard
SXO__X___O:
		STO A board+6		# User move 3
		PPR smjump+1 SXOO_XX__O-44
		JMP printboard
		STO A board+3		# User move 4
		PPR smjump+1 SXOXOX___O-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SXOX_XO__O-44
		JMP printboard
		STO A board+8		# User move 7
		PPR smjump+1 SXO__X_OXO-33
		JMP printboard
		STO A board+7		# User move 8
		PPR smjump+1 SXO__X_XOO-33
		JMP printboard
SXO___OX__:
		STO A board+4		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+5		# User move 4
		PPR smjump+1 SXO_OXOX__-33
		JMP printboard
		STO A board+4		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 9
		PPR smjump+1 SXOX__OX_O-44
		JMP printboard
SXO_______:
		STO A board+4		# User move 3
		PPR smjump+1 SXOOX_____-55
		JMP printboard
		STO A board+5		# User move 4
		PPR smjump+1 SXO_OX____-33
		JMP printboard
		STO A board+8		# User move 5
		PPR smjump+1 SXO__O__X_-33
		JMP printboard
		STO A board+7		# User move 6
		PPR smjump+1 SXO___OX__-33
		JMP printboard
		STO A board+5		# User move 7
		PPR smjump+1 SXO__X_O__-33
		JMP printboard
		STO A board+5		# User move 8
		PPR smjump+1 SXO__X__O_-33
		JMP printboard
		STO A board+5		# User move 9
		PPR smjump+1 SXO__X___O-33
		JMP printboard
SXXOOOXXO_:
		STO B istie		# User move 9
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXXOOOXX_O:
		STO B istie		# User move 8
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXXOOX_O__:
		STO A board+8		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+8		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXXOO_XXOO:
		STO B istie		# User move 5
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXXO_OXXOO:
		STO B istie		# User move 4
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXXO_O_XO_:
		STO A board+6		# User move 4
		PPR smjump+1 SXXOOOXXO_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX_OOXXOO:
		STO B istie		# User move 3
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SXX_OOX_O_:
		STO A board+7		# User move 3
		PPR smjump+1 SXXOOOXXO_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX_OOX__O:
		STO A board+7		# User move 3
		PPR smjump+1 SXXOOOXX_O-88
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SXX_OXOO__:
		STO A board+8		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX_OXO_O_:
		STO A board+9		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX_O__OOX:
		STO A board+5		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
SXX_O__O__:
		STO A board+5		# User move 3
		PPR smjump+1 SXXOOX_O__-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX_XOO_O_:
		STO A board+7		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX__O_XOO:
		STO A board+4		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
SXX__O__O_:
		STO A board+7		# User move 3
		PPR smjump+1 SXXO_O_XO_-44
		JMP printboard
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SXX___OOOX:
		STO A board+5		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+3		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
SX_OOOXX__:
		STO A board+8		# User move 2
		PPR smjump+1 SXOOOOXXX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 8
		PPR smjump+1 SXXOOOXXO_-99
		JMP printboard
		STO A board+2		# User move 9
		PPR smjump+1 SXXOOOXX_O-88
		JMP printboard
SX_OOXXOXO:
		STO B istie		# User move 2
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SX_OOXXXOO:
		STO B istie		# User move 2
		JMP printboard; NOP; NOP; NOP; NOP; NOP
SX_OOXX__O:
		STO A board+7		# User move 2
		PPR smjump+1 SXOOOXXX_O-88
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		PPR smjump+1 SX_OOXXOXO-22
		JMP printboard
		STO A board+7		# User move 8
		PPR smjump+1 SX_OOXXXOO-22
		JMP printboard
SX_OOX____:
		STO A board+9		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 7
		PPR smjump+1 SXXOOX_O__-66
		JMP printboard
		STO A board+9		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 9
		PPR smjump+1 SX_OOXX__O-22
		JMP printboard
SX_O_O_X__:
		STO A board+4		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 4
		PPR smjump+1 SX_OOOXX__-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_XOOXO__:
		STO A board+9		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_XOXOO__:
		STO A board+9		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_XOXO_O_:
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_XOXO__O:
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SX_XO___O_:
		STO A board+5		# User move 2
		PPR smjump+1 SXOXOX__O_-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_XO____O:
		STO A board+5		# User move 2
		PPR smjump+1 SXOXOX___O-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SX_XXOOO__:
		STO A board+8		# User move 2
		PPR smjump+1 SXOXXOOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_XXOO__O:
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SX_X_O_O__:
		STO A board+8		# User move 2
		PPR smjump+1 SXOX_O_OX_-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_X_O___O:
		STO A board+8		# User move 2
		PPR smjump+1 SXOX_O__XO-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SX_X__OO__:
		STO A board+5		# User move 2
		PPR smjump+1 SXOX_XOO__-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_X__O_O_:
		STO A board+5		# User move 2
		PPR smjump+1 SXOX_XO_O_-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
SX_X__O__O:
		STO A board+7		# User move 2
		PPR smjump+1 SXOX__OX_O-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
SX__OOX___:
		STO A board+8		# User move 2
		PPR smjump+1 SXO_OOX_X_-33
		JMP printboard
		STO A board+7		# User move 3
		PPR smjump+1 SX_OOOXX__-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		PPR smjump+1 SX_XOOXO__-22
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 SXX_OOX_O_-33
		JMP printboard
		STO A board+2		# User move 9
		PPR smjump+1 SXX_OOX__O-33
		JMP printboard
SX__OXO___:
		STO A board+3		# User move 2
		PPR smjump+1 SXOXOXO___-77
		JMP printboard
		STO A board+9		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 7
		PPR smjump+1 SXX_OXOO__-33
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 SXX_OXO_O_-33
		JMP printboard
		STO A board+3		# User move 9
		PPR smjump+1 SX_XOXO__O-22
		JMP printboard
SX__OX_OXO:
		STO A board+3		# User move 2
		PPR smjump+1 SXOXOX_OXO-66
		JMP printboard
		STO A board+2		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
SX__OX_O__:
		STO A board+9		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 3
		PPR smjump+1 SXXOOX_O__-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		PPR smjump+1 SXX_OXOO__-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+8		# User move 9
		PPR smjump+1 SX__OX_OXO-22
		JMP printboard
SX__OX_XOO:
		STO A board+3		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+6		# User move 3
		PPR smjump+1 SX_OOXXXOO-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
SX__OX___O:
		STO A board+3		# User move 2
		PPR smjump+1 SXOXOX___O-66
		JMP printboard
		STO A board+6		# User move 3
		PPR smjump+1 SX_OOXX__O-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 SX_XOXO__O-22
		JMP printboard
		STO A board+8		# User move 7
		PPR smjump+1 SX__OX_OXO-22
		JMP printboard
		STO A board+7		# User move 8
		PPR smjump+1 SX__OX_XOO-22
		JMP printboard
SX__O_____:
		STO A board+5		# User move 2
		PPR smjump+1 SXO_OX____-33
		JMP printboard
		STO A board+5		# User move 3
		PPR smjump+1 SX_OOX____-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 5
		PPR smjump+1 SX__OOX___-22
		JMP printboard
		STO A board+5		# User move 6
		PPR smjump+1 SX__OXO___-22
		JMP printboard
		STO A board+2		# User move 7
		PPR smjump+1 SXX_O__O__-33
		JMP printboard
		STO A board+3		# User move 8
		PPR smjump+1 SX_XO___O_-22
		JMP printboard
		STO A board+3		# User move 9
		PPR smjump+1 SX_XO____O-22
		JMP printboard
SX__XOO___:
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+7		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 7
		PPR smjump+1 SX_XXOOO__-22
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 SXX_XOO_O_-33
		JMP printboard
		STO A board+3		# User move 9
		PPR smjump+1 SX_XXOO__O-22
		JMP printboard
SX___O____:
		STO A board+8		# User move 2
		PPR smjump+1 SXO__O__X_-33
		JMP printboard
		STO A board+7		# User move 3
		PPR smjump+1 SX_O_O_X__-22
		JMP printboard
		STO A board+6		# User move 4
		PPR smjump+1 SX__OOX___-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 6
		PPR smjump+1 SX__XOO___-22
		JMP printboard
		STO A board+3		# User move 7
		PPR smjump+1 SX_X_O_O__-22
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 SXX__O__O_-33
		JMP printboard
		STO A board+3		# User move 9
		PPR smjump+1 SX_X_O___O-22
		JMP printboard
S_OXXOO_X_:
		STO A board+9		# User move 1
		PPR smjump+1 SOOXXOO_XX-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		PPR smjump+1 SXOXXOOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 9
		PPR smjump+1 SXOXXOO_XO-77
		JMP printboard
S_OXXXOOOX:
		STO B istie		# User move 1
		JMP printboard; NOP; NOP; NOP; NOP; NOP
S_OXXXOOXO:
		STO B istie		# User move 1
		JMP printboard; NOP; NOP; NOP; NOP; NOP
S_OXXXOO__:
		STO A board+8		# User move 1
		PPR smjump+1 SOOXXXOOX_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		PPR smjump+1 S_OXXXOOOX-11
		JMP printboard
		STO A board+8		# User move 9
		PPR smjump+1 S_OXXXOOXO-11
		JMP printboard
S_OXXXO_O_:
		STO A board+7		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 7
		PPR smjump+1 S_OXXXOOOX-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S_OXX_OX_O:
		STO A board+5		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
S_OXX_O___:
		STO A board+5		# User move 1
		PPR smjump+1 SOOXXXO___-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 5
		PPR smjump+1 S_OXXOO_X_-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 7
		PPR smjump+1 S_OXXXOO__-11
		JMP printboard
		STO A board+5		# User move 8
		PPR smjump+1 S_OXXXO_O_-11
		JMP printboard
		STO A board+7		# User move 9
		PPR smjump+1 S_OXX_OX_O-11
		JMP printboard
S_XOOXOXOX:
		STO B istie		# User move 1
		JMP printboard; NOP; NOP; NOP; NOP; NOP
S_XOOXXXOO:
		STO B istie		# User move 1
		JMP printboard; NOP; NOP; NOP; NOP; NOP
S_XOOX_XO_:
		STO A board+6		# User move 1
		PPR smjump+1 SOXOOXXXO_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		PPR smjump+1 S_XOOXOXOX-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		PPR smjump+1 S_XOOXXXOO-11
		JMP printboard
S_XOXOOXOX:
		STO B istie		# User move 1
		JMP printboard; NOP; NOP; NOP; NOP; NOP
S_XO_X_OOX:
		STO A board+4		# User move 1
		PPR smjump+1 SOXOXX_OOX-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
S_XO_X_O__:
		STO A board+4		# User move 1
		PPR smjump+1 SOXOXX_O__-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SXXOOX_O__-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		PPR smjump+1 S_XO_X_OOX-11
		JMP printboard
		STO A board+8		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S_XO__OXOX:
		STO A board+4		# User move 1
		PPR smjump+1 SOXOX_OXOX-55
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 4
		PPR smjump+1 S_XOOXOXOX-11
		JMP printboard
		STO A board+4		# User move 5
		PPR smjump+1 S_XOXOOXOX-11
		JMP printboard
S_XO__XXOO:
		STO A board+5		# User move 1
		PPR smjump+1 SOXO_XXXOO-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SXXOO_XXOO-55
		JMP printboard
		STO A board+1		# User move 5
		PPR smjump+1 SXXO_OXXOO-44
		JMP printboard
S_XO___XO_:
		STO A board+5		# User move 1
		PPR smjump+1 SOXO_X_XO_-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 4
		PPR smjump+1 S_XOOX_XO_-11
		JMP printboard
		STO A board+1		# User move 5
		PPR smjump+1 SXXO_O_XO_-44
		JMP printboard
		STO A board+9		# User move 6
		PPR smjump+1 S_XO__OXOX-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		PPR smjump+1 S_XO__XXOO-11
		JMP printboard
S_XXO__XOO:
		STO A board+5		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
S_XXXOO_O_:
		STO A board+9		# User move 1
		PPR smjump+1 SOXXXOO_OX-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S_XX_O_OOX:
		STO A board+6		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
S_XX__OXOO:
		STO A board+5		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 5
		STO B iswin
		JMP printboard; NOP; NOP
S_X_OOXXO_:
		STO A board+9		# User move 1
		PPR smjump+1 SOX_OOXXOX-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 3
		PPR smjump+1 SXXOOOXXO_-99
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 9
		PPR smjump+1 SXX_OOXXOO-33
		JMP printboard
S_X_OXOXO_:
		STO A board+3		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 3
		PPR smjump+1 S_XOOXOXOX-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S_X_O__XO_:
		STO A board+5		# User move 1
		PPR smjump+1 SOX_OX_XO_-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 3
		PPR smjump+1 S_XOOX_XO_-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 5
		PPR smjump+1 S_X_OOXXO_-11
		JMP printboard
		STO A board+5		# User move 6
		PPR smjump+1 S_X_OXOXO_-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		PPR smjump+1 S_XXO__XOO-11
		JMP printboard
S_X_XOOXO_:
		STO A board+9		# User move 1
		PPR smjump+1 SOX_XOOXOX-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S_X__XOOOX:
		STO A board+4		# User move 1
		PPR smjump+1 SOX_XXOOOX-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
S_X__XOO__:
		STO A board+8		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SXX_OXOO__-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		PPR smjump+1 S_X__XOOOX-11
		JMP printboard
		STO A board+8		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S_X___OXO_:
		STO A board+5		# User move 1
		PPR smjump+1 SOX__XOXO_-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 3
		PPR smjump+1 S_XO__OXOX-11
		JMP printboard
		STO A board+5		# User move 4
		PPR smjump+1 S_X_OXOXO_-11
		JMP printboard
		STO A board+4		# User move 5
		PPR smjump+1 S_X_XOOXO_-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 9
		PPR smjump+1 S_XX__OXOO-11
		JMP printboard
S_X____OOX:
		STO A board+4		# User move 1
		PPR smjump+1 SOX_X__OOX-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 3
		PPR smjump+1 S_XO_X_OOX-11
		JMP printboard
		STO A board+1		# User move 4
		PPR smjump+1 SXX_O__OOX-33
		JMP printboard
		STO A board+3		# User move 5
		PPR smjump+1 S_XX_O_OOX-11
		JMP printboard
		STO A board+1		# User move 6
		PPR smjump+1 SXX___OOOX-33
		JMP printboard
S_X____XOO:
		STO A board+5		# User move 1
		PPR smjump+1 SOX__X_XOO-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 3
		PPR smjump+1 S_XO__XXOO-11
		JMP printboard
		STO A board+3		# User move 4
		PPR smjump+1 S_XXO__XOO-11
		JMP printboard
		STO A board+1		# User move 5
		PPR smjump+1 SXX__O_XOO-33
		JMP printboard
		STO A board+3		# User move 6
		PPR smjump+1 S_XX__OXOO-11
		JMP printboard
S_X_____O_:
		STO A board+7		# User move 1
		PPR smjump+1 SOX____XO_-33
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 3
		PPR smjump+1 S_XO___XO_-11
		JMP printboard
		STO A board+7		# User move 4
		PPR smjump+1 S_X_O__XO_-11
		JMP printboard
		STO A board+1		# User move 5
		PPR smjump+1 SXX__O__O_-33
		JMP printboard
		STO A board+7		# User move 6
		PPR smjump+1 S_X___OXO_-11
		JMP printboard
		STO A board+9		# User move 7
		PPR smjump+1 S_X____OOX-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+7		# User move 9
		PPR smjump+1 S_X____XOO-11
		JMP printboard
S__OXXO_OX:
		STO A board+2		# User move 1
		PPR smjump+1 SOXOXXO_OX-77
		JMP printboard
		STO A board+1		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
S__OXX__O_:
		STO A board+6		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 2
		PPR smjump+1 SXOOXX__O_-66
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		PPR smjump+1 S__OXXO_OX-11
		JMP printboard
		STO A board+6		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+6		# User move 9
		STO B iswin
		JMP printboard; NOP; NOP
S__O_XO__X:
		STO A board+2		# User move 1
		PPR smjump+1 SOXO_XO__X-44
		JMP printboard
		STO A board+1		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
S__O_XXXOO:
		STO A board+4		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SX_OOXXXOO-22
		JMP printboard
S__O_XX__O:
		STO A board+2		# User move 1
		PPR smjump+1 SOXO_XX__O-44
		JMP printboard
		STO A board+4		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SX_OOXX__O-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+4		# User move 7
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+4		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
S__O_X____:
		STO A board+2		# User move 1
		PPR smjump+1 SOXO_X____-44
		JMP printboard
		STO A board+1		# User move 2
		PPR smjump+1 SXOO_X____-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SX_OOX____-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 6
		PPR smjump+1 S__O_XO__X-11
		JMP printboard
		STO A board+2		# User move 7
		PPR smjump+1 S_XO_X_O__-11
		JMP printboard
		STO A board+4		# User move 8
		PPR smjump+1 S__OXX__O_-11
		JMP printboard
		STO A board+6		# User move 9
		PPR smjump+1 S__O_XX__O-11
		JMP printboard
S__XOXO___:
		STO A board+7		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 2
		PPR smjump+1 SXOXOXO___-77
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		PPR smjump+1 SX_XOXOO__-22
		JMP printboard
		STO A board+1		# User move 8
		PPR smjump+1 SX_XOXO_O_-22
		JMP printboard
		STO A board+1		# User move 9
		PPR smjump+1 SX_XOXO__O-22
		JMP printboard
S__XXOO___:
		STO A board+9		# User move 1
		PPR smjump+1 SO_XXOO__X-22
		JMP printboard
		STO A board+8		# User move 2
		PPR smjump+1 S_OXXOO_X_-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		PPR smjump+1 SX_XXOOO__-22
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 S_XXXOO_O_-11
		JMP printboard
		STO A board+1		# User move 9
		PPR smjump+1 SX_XXOO__O-22
		JMP printboard
S__X_XOOXO:
		STO A board+2		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 2
		PPR smjump+1 SXOX_XOOXO-44
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
S__X_XO__O:
		STO A board+2		# User move 1
		PPR smjump+1 SOXX_XO__O-44
		JMP printboard
		STO A board+7		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 4
		PPR smjump+1 SX_XOXO__O-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+8		# User move 7
		PPR smjump+1 S__X_XOOXO-11
		JMP printboard
		STO A board+7		# User move 8
		STO B iswin
		JMP printboard; NOP; NOP
S__X__O___:
		STO A board+4		# User move 1
		PPR smjump+1 SO_XX_O___-22
		JMP printboard
		STO A board+4		# User move 2
		PPR smjump+1 S_OXX_O___-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+5		# User move 4
		PPR smjump+1 S__XOXO___-11
		JMP printboard
		STO A board+4		# User move 5
		PPR smjump+1 S__XXOO___-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 7
		PPR smjump+1 SX_X__OO__-22
		JMP printboard
		STO A board+1		# User move 8
		PPR smjump+1 SX_X__O_O_-22
		JMP printboard
		STO A board+1		# User move 9
		PPR smjump+1 SX_X__O__O-22
		JMP printboard
S____X_OOX:
		STO A board+4		# User move 1
		PPR smjump+1 SO__XX_OOX-22
		JMP printboard
		STO A board+1		# User move 2
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+1		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
S____X_OXO:
		STO A board+2		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 2
		PPR smjump+1 SXO__X_OXO-33
		JMP printboard
		STO A board+2		# User move 3
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+2		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
S____X_O__:
		STO A board+4		# User move 1
		PPR smjump+1 SO__XX_O__-22
		JMP printboard
		STO A board+1		# User move 2
		PPR smjump+1 SXO__X_O__-33
		JMP printboard
		STO A board+2		# User move 3
		PPR smjump+1 S_XO_X_O__-11
		JMP printboard
		STO A board+1		# User move 4
		PPR smjump+1 SX__OX_O__-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+2		# User move 6
		PPR smjump+1 S_X__XOO__-11
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+9		# User move 8
		PPR smjump+1 S____X_OOX-11
		JMP printboard
		STO A board+8		# User move 9
		PPR smjump+1 S____X_OXO-11
		JMP printboard
S____X_XOO:
		STO A board+3		# User move 1
		STO B iswin
		JMP printboard; NOP; NOP
		STO A board+1		# User move 2
		PPR smjump+1 SXO__X_XOO-33
		JMP printboard
		STO A board+6		# User move 3
		PPR smjump+1 S__O_XXXOO-11
		JMP printboard
		STO A board+3		# User move 4
		STO B iswin
		JMP printboard; NOP; NOP
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		STO B iswin
		JMP printboard; NOP; NOP
S____X___O:
		STO A board+2		# User move 1
		PPR smjump+1 SOX__X___O-33
		JMP printboard
		STO A board+1		# User move 2
		PPR smjump+1 SXO__X___O-33
		JMP printboard
		STO A board+6		# User move 3
		PPR smjump+1 S__O_XX__O-11
		JMP printboard
		STO A board+1		# User move 4
		PPR smjump+1 SX__OX___O-22
		JMP printboard
		JMP $FFFF; NOP; NOP; NOP
		NOP; NOP; NOP; NOP; NOP
		STO A board+3		# User move 6
		PPR smjump+1 S__X_XO__O-11
		JMP printboard
		STO A board+8		# User move 7
		PPR smjump+1 S____X_OXO-11
		JMP printboard
		STO A board+7		# User move 8
		PPR smjump+1 S____X_XOO-11
		JMP printboard
S_________:
		STO A board+5		# User move 1
		PPR smjump+1 SO___X____-22
		JMP printboard
		STO A board+1		# User move 2
		PPR smjump+1 SXO_______-33
		JMP printboard
		STO A board+5		# User move 3
		PPR smjump+1 S__O_X____-11
		JMP printboard
		STO A board+1		# User move 4
		PPR smjump+1 SX__O_____-22
		JMP printboard
		STO A board+1		# User move 5
		PPR smjump+1 SX___O____-22
		JMP printboard
		STO A board+3		# User move 6
		PPR smjump+1 S__X__O___-11
		JMP printboard
		STO A board+5		# User move 7
		PPR smjump+1 S____X_O__-11
		JMP printboard
		STO A board+2		# User move 8
		PPR smjump+1 S_X_____O_-11
		JMP printboard
		STO A board+5		# User move 9
		PPR smjump+1 S____X___O-11
		JMP printboard
