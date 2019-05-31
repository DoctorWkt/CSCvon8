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

main:	NOP
	LCA $23		# Set X to $2345
	STO A xhi
	LCA $45
	STO A xlo

	LCA $11		# Set Y to $1111
	STO A yhi
	LCA $FF
	STO A ylo

	LDA xhi		# Print X out
	STO A hexarg
	JSR prhex
	LDA xlo
	STO A hexarg
	JSR prhex

	LCA '+'		# Print out a '+'
	OUT A
L1:	JOU L1

	LDA yhi		# Print Y out
	STO A hexarg
	JSR prhex
	LDA ylo
	STO A hexarg
	JSR prhex

	LCA '='		# Print out a '='
	OUT A
L2:	JOU L2

	LDA xlo		# Calculate low result
	LDB ylo		# and jump if carry
	TST A+B JC acarry
	STO A+B reslo
	LDA xhi		# Calculate high result
	LDB yhi
	STO A+B reshi
	JMP preslt
acarry:	STO A+B reslo
	LDA xhi		# Calc hi result with carry
	LDB yhi
	STO A+B+1 reshi
preslt: LDA reshi	# Print result out
	STO A hexarg
	JSR prhex
	LDA reslo
	STO A hexarg
	JSR prhex
	LCA $0A		# and newline
	OUT A
L3:	JOU L3

end:	JMP $FFFF

# prhex function: Print the value in A
# out as two hex digits
prhex:	LDA hexarg	# Load a copy of A
	LCB $04		# Get high nibble of A
	LDA A>>B
	LCB $09
	JGT AtoFhi	# Skip if in range A to F
	LCB $30		# Otherwise add '0'
	JMP putchi	# and print it
AtoFhi:	LCB $37		# Add 55 to get it in 'A' to 'F'
putchi: LDA A+B
	OUT A
L4:	JOU L4

	LDA hexarg	# Get A back again
	LCB $0F		# Get the low nibble of A
	LDA A&B
	LCB $09
	JGT AtoFlo	# Skip if in range A to F
	LCB $30		# Otherwise add '0'
	JMP putclo	# and print it
AtoFlo:	LCB $37		# Add 55 to get it in 'A' to 'F'
putclo: LDA A+B
	OUT A
L5:	JOU L5
# xyz:	JMP xyz
	RTS prhex
