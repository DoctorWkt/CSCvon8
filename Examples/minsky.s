# Drawing a sine wave approximation
# using Minsky's circle algorithm
# Thanks to Chris Baird @Chris_J_Baird
# for the suggestion.
# Set your terminal to 132 columns!

X: EQU $8000
Y: EQU $8001

	NOP
	LCA $3A			# Start at X=58 decimal, Y=0
	STO A X
	LCA $00
	STO A Y

loop:	LCB $04			# Do y= y - (x/4)
	LDA X
	LDA A>>BA		# Store X/4 into A
	LDB Y
	LDA B-A
	STO A Y			# Store Y-(X/4) into Y

				# Now do x= x + (y/4)
	LCB $04
	LDA Y
	LDA A>>BA
	LDB X
	LDA A+B
	STO A X
				# Print X + 59 spaces
	LDB X
	LCA $3B
	LDB A+B			# B= X + 59
	LCA $20			# Load a ' ' into A
sploop:	OUT A
L1:	JOU L1
	LDB B-1
	JBN spend		# B--, exit when it's negative
	JMP sploop

spend:	LCA '*'			# Print out "*\n"
	OUT A
L2:	JOU L2
	LCA $0A
	OUT A
L3:	JOU L3
	JMP loop		# and go back & do it all again
