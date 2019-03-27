# Fourth program. Print the printable
# ASCII characters and then stop.

	LCB $7F		# We end when we reach 0x7F
	LCA $20		# Start with a space
loop:	OUTA		# Print A out
	A=A+1		# Increment A
	JA!=B loop	# Loop back until we get to 0x7F
	LCA $0A
	OUTA		# Print a newline
end:	JMP end		# and stop
