# Example program #10. Test that the SIA and SIB
# instructions work. fred and jim are byte pointers.
# Store 'W' through the fred pointer to memory, then
# load directly from memory and print out the letter.
# Ditto with the jim pointer.

	NOP
	LCA 'W'				# Store a 'W' through the fred
	SIA fred			# pointer.
	LDA $9000			# Load back from $9000 and
	OUT A				# print out the character
	LCB 'T'				# Ditto with the jim pointer
	SIB jim
	LDB $ABCD
	OUT B
	OUT '\n'
	JMP $FFFF

fred:	HEX "90 00"			# Pointer to $9000
jim:	HEX "AB CD"			# Pointer to $ABCD
