# Example 11 to demonstrate the PPR put pointer instruction
#
# We take one jump, print out a '1'. Then we modify the original jump
# and take it a second time. This time it points to new code which will
# print '2'.

#define JOUT(x)	     JOU .; OUT x

	NOP
sm:	JMP here		# Firstly, jump past the JMP $FFFF
	JMP $FFFF

here:	JOUT('1'); JOUT('\n')	# Print out a 1
	PPR sm+1 there		# Change the JMP at label sm
	JMP sm			# and jump back to it
	JMP $FFFF

there:  JOUT('2'); JOUT('\n')   # Print out a 2
	JMP $FFFF
