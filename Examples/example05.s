# Fifth program. Store ASCII characters
# in an array in memory, read them back,
# and print them.
#

	LCA $7F		# We end when we reach 0x7F
	LCB $20		# Start with a space
loop1:	STB $8000,B	# Store B in $8000+B
	B=B+1		# Increment B
	JA!=B loop1	# Loop back until we get to 0x7F

	LCB $20		# Start with a space
loop2:	LDA $8000,B	# Load the stored value back in
	JA!=B nl	# Stop when we get something we didn't store
	OUTA		# Print it out
	B=B+1		# Increment B
	JMP loop2

nl:	LCA $0A
	OUTA		# Print a newline
end:	JMP end		# and stop
