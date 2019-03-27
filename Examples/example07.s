# Seventh program. Add to BCD values and store
# it into a RAM location. Then print it out as
# two ASCII digits followed by a newline.

	LCA $35			# Treat this as 35 BCD
	LCB $47			# Treat this as 47 BCD
	A=A+BCD			# Add them to get 82 BCD
	STA $8002

	LDA $8002		# Reload the value
	LCB $04			# Shift it right 4 bits
	A=A>>BL
	LCB $30			# Add on $30: convert to ASCII
	A=A+B
	OUTA

	LDA $8002		# Reload the value
	LCB $0F			# Keep the low nibble
	A=A&B
	LCB $30			# Add on $30: convert to ASCII
	A=A+B
	OUTA
	LCA $0A			# Now a newline
	OUTA

end:	JMP end
