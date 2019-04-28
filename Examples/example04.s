# Fourth program. Print the printable
# ASCII characters and then stop.

	NOP
	LCB $7F		# We end when we reach 0x7F
	LCA $20		# Start with a space
loop:	OUT A		# Print A out
L1:	JOU L1
	LDA A+1		# Increment A
	JNE loop	# Loop back until we get to 0x7F
	LCA $0A
	OUT A		# Print a newline
L2:	JOU L2
end:	JMP $FFFF	# and stop
