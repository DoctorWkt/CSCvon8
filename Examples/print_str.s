# An example of how to store a string in ROM memory,
# get the index to its base and then print it out.

	NOP
	LCB hello		# Start at the base of hello
loop:	LDA hello,B		# Get a character
	JAZ end			# Exit if NUL
	OUT A			# Print it out
	JOU .			# Wait for UART
	LDB B+1
	JMP loop
end:	LCA $0A			# Finally print a newline
	OUT A
	JOU .
	JMP $FFFF
hello:	STR "ABCDEFGH"
#
# This is just a test of the HEX pseudo-op
fred:	HEX "01 02 03 04 AB AC AD AE AF"
