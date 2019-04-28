# Fifth program. Store ASCII characters
# in an array in memory, read them back,
# and print them.
#
	NOP
	LCA $7F		# We end when we reach 0x7F
	LCB $20		# Start with a space
loop1:	STO B $8000,B	# Store B in $8000+B
	LDB B+1		# Increment B
	JNE loop1	# Loop back until we get to 0x7F

	LCB $20		# Start with a space
loop2:	LDA $8000,B	# Load the stored value back in
	JNE nl		# Stop when we get something we didn't store
	OUT A		# Print it out
L1:	JOU L1
	LDB B+1		# Increment B
	JMP loop2

nl:	LCA $0A
	OUT A		# Print a newline
L2:	JOU L2
end:	JMP $FFFF	# and stop
