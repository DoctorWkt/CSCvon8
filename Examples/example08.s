# Eighth program. Doesn't work on Icarus, only Verilator and csim.
# Read from the UART and echo the characters. Also print
# an initial 'A' so you know it's doing something.

	NOP
	LCA $41		# Print an A
	OUT A
	JOU .		# Wait until it is printed
L1:	JIU .		# Loop while no input characters
	INA		# Read a character in from the UART
	OUT A		# and echo it back out
	JOU .		# Wait until it is printed
	JMP L1		# and do it all again
