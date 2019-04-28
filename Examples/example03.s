# Third program. Store a two-digit BCD value
# into a RAM location. Then print it out as
# two ASCII digits followed by a newline.

	NOP
	LCA $35			# Treat this as 35 BCD
	STO A $8002

	LDA $8002		# Reload the value
	LCB $04			# Shift it right 4 bits
	LDA A>>B
	LCB $30			# Add on $30: convert to ASCII
	LDA A+B
	OUT A
L1:	JOU L1

	LDA $8002		# Reload the value
	LCB $0F			# Keep the low nibble
	LDA A&B
	LCB $30			# Add on $30: convert to ASCII
	LDA A+B
	OUT A
L2:	JOU L2
	LCA $0A			# Now a newline
	OUT A
L3:	JOU L3

end:	JMP $FFFF
