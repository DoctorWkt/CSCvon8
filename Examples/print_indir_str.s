# Example program to store the address of a string in a pointer,
# then access all the characters of the string through the pointer,
# i.e. address indirection.

	NOP
	LHA	string		# Fill in the pointer
	STO	A hiptr
	LCA	string
	STO 	A loptr
	JSR 	puts		# Print out the string and stop
	JMP 	$FFFF

# Given a string pointer in hiptr/loptr, print out the string.
# This will destroy loptr in the process.

puts:	LIA	hiptr		# Get character through the ptr
	JAZ endputs		# Exit when we get the NUL character
	JOU 	.		# Print out the character
	OUT	A
	LDB	loptr		# Increment the low byte of the pointer
	STO	B+1 loptr
	JMP	puts		# and loop back
endputs: RTS	puts

string:	STR "ABC\tDEF\"G\nHIJK\n"	# Test the escaped characters, too

	ORG $8000
hiptr:	HEX "00"		# These to be filled in later
loptr:	HEX "00"
