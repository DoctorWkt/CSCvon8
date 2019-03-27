# Program to do a 16-bit add on two
# values and print out the inputs
# and outputs in hex.

xlo:	EQU $8000
xhi:	EQU $8001
ylo:	EQU $8002
yhi:	EQU $8003
reslo:	EQU $8004
reshi:	EQU $8005
hexarg: EQU $8006

main:	LCA $23		# Set X to $2345
	STA xhi
	LCA $45
	STA xlo

	LCA $11		# Set Y to $1111
	STA yhi
	LCA $FF
	STA ylo

	LDA xhi		# Print X out
	STA hexarg
	JSR prhex
	LDA xlo
	STA hexarg
	JSR prhex

	LCA '+'		# Print out a '+'
	OUTA

	LDA yhi		# Print Y out
	STA hexarg
	JSR prhex
	LDA ylo
	STA hexarg
	JSR prhex

	LCA '='		# Print out a '='
	OUTA

	LDA xlo		# Calculate low result
	LDB ylo		# and jump if carry
	A=A+BJC acarry
	STA reslo
	LDA xhi		# Calculate high result
	LDB yhi
	A=A+B
	STA reshi
	JMP preslt
acarry:	STA reslo
	LDA xhi		# Calc hi result with carry
	LDB yhi
	A=A+B+1
	STA reshi
preslt: LDA reshi	# Print result out
	STA hexarg
	JSR prhex
	LDA reslo
	STA hexarg
	JSR prhex
	LCA $0A		# and newline
	OUTA

end:	JMP end

# prhex function: Print the value in A
# out as two hex digits
prhex:	LDA hexarg	# Load a copy of A
	LCB $04		# Get high nibble of A
	A=A>>BL
	LCB $09
	JA>B AtoFhi	# Skip if in range A to F
	LCB $30		# Otherwise add '0'
	JMP putchi	# and print it
AtoFhi:	LCB $37		# Add 55 to get it in 'A' to 'F'
putchi: A=A+B
	OUTA

	LDA hexarg	# Get A back again
	LCB $0F		# Get the low nibble of A
	A=A&B
	LCB $09
	JA>B AtoFlo	# Skip if in range A to F
	LCB $30		# Otherwise add '0'
	JMP putclo	# and print it
AtoFlo:	LCB $37		# Add 55 to get it in 'A' to 'F'
putclo: A=A+B
	OUTA
# xyz:	JMP xyz
	RTS prhex
