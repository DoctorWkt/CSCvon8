# Drawing a sine wave approximation
# using Minsky's circle algorithm
# Thanks to Chris Baird @Chris_J_Baird
# for the suggestion.
# Set your terminal to 132 columns!

X: EQU $8000
Y: EQU $8001

	LCA $3A			# Start at X=58 decimal, Y=0
	STA X
	LCA $00
	STA Y

loop:	LCB $04			# Do y= y - (x/4)
	LDA X
	A=A>>BA			# Store X/4 into A
	LDB Y
	A=B-A
	STA Y			# Store Y-(X/4) into Y

				# Now do x= x + (y/4)
	LCB $04
	LDA Y
	A=A>>BA
	LDB X
	A=A+B
	STA X
				# Print X + 59 spaces
	LDB X
	LCA $3B
	B=A+B			# B= X + 59
	LCA $20			# Load a ' ' into A
sploop:	OUTA
	B=B-1JN spend		# B--, exit when it's negative
	JMP sploop

spend:	LCA '*'			# Print out "*\n"
	OUTA
	LCA $0A
	OUTA
	JMP loop		# and go back & do it all again
