# Warren's monitor ROM for the CSCvon8 CPU
# (c) 2019, GPL3

#define printstr(x)  LHA x; STO A strptr; LCA x; STO A strptr+1; JSR puts
#define putc(x)	     LCA x; JOU .; OUT A
#define getc(x)	     JIU .; INA; STO A x
#define JOUT(x)	     JOU .; OUT x
#define JINA	     JIU .; INA 

main:	NOP			# Six NOPs are needed for the CPU to
	NOP			# "settle down" after Reset# goes high
	NOP
	NOP
	NOP
	NOP
	LCB $00			# Print out the welcome message
1:	LDA welcome,B
	JAZ prompt
	JOUT(A)
	LDB B+1
	JMP 1b

prompt:	putc('>')		# Print out the prompt
	putc(' ')
	getc(cmdchar)		# Get the command letter and
	JOUT(A)			# echo it out to the user
	LCB '\n'		# Loop when we get a newline
	JEQ prompt
	LCB '\r'		# Loop when we get a carriage return
	JEQ prompt

	STO 0 hexcnt		# Set count of hex chars to zero
sploop: JINA			# Get further characters and echo them
	JOUT(A)
	LCB ' '			# Skip spaces
	JEQ sploop
	LCB '\n'		# Exit when we get a newline
	JEQ docmd
	LCB '\r'		# Exit when we get a carriage return
	JEQ docmd
	
	LDB hexcnt		# Assume it's a hex digit, store it
	STO A hexchar,B
	STO B+1 hexcnt		# Increment the counter
	LCA $03
	JEQ waitnl		# Exit loop when B==3 (highest offset)
	JMP sploop		# Otherwise loop back

waitnl: JINA			# Echo chars until a '\n' or '\r'
	JOUT(A)
	LCB '\n'
	JEQ cvtaddr
	LCB '\r'
	JEQ cvtaddr
	JMP waitnl

cvtaddr: JSR hexcvt		# Convert the four characters into an address

docmd:	JOUT('\n')

	LDA cmdchar		# Get the command character
	LCB '?'			# ?, print the usage
	JEQ printusage
	LCB 'D'			# D and d, dump memory
	JEQ dump
	LCB 'd'
	JEQ dump
	LCB 'R'			# R and r, run code at addr
	JEQ run
	LCB 'r'
	JEQ run
	LCB 'C'			# C and c, change memory
	JEQ change
	LCB 'c'
	JEQ change
	LCB 'X'			# X and x, exit csim
	JEQ terminate
	LCB 'x'
	JEQ terminate
newprompt:
	JOUT('\r')
	JOUT('\n')
	JMP prompt

terminate:
	JMP $FFFF

printusage:
	printstr(usage)
	JMP prompt

run:	LCB $70			# Set a JMP instruction
	STO B jmpaddr		# at the jmpaddr and go there
	JMP jmpaddr
	JMP prompt

dump:	LCB $0F			# Set a count of 15, which will be 16
	STO B count
	LDB addr		# Print out the address in hex
	STO B hexchar
	JSR prhex
	LDB addr+1
	STO B hexchar
	JSR prhex
	JOUT(':')
	JOUT(' ')
1:	LIA addr		# Get a byte through the pointer
	STO A hexchar
	JSR prhex		# Print it in hex
	JOUT(' ')		# followed by a space
	LDB count		# Decrement the count
	LDB B-1
	JBN 2f			# Exit when we get to $FF
	STO B count
	LDB addr+1		# Keep going, so move the pointer up
	STO B+1 addr+1
	JMP 1b			# and loop back

2:	JOUT('\r')
	JOUT('\n')		# End of loop, print a newline
	LDB addr+1		# Also bump up the address for the next dump
	STO B+1 addr+1
	TST B+1 JC 3f
	JMP prompt
3:	LDB addr
	STO B+1 addr
	JMP prompt

change:
	printstr(setstr)
changeloop:
	JINA			# Get a character and echo it
	JOUT(A)
	LCB ' '
	JEQ changeloop		# Start afresh for spaces and newlines
	LCB '\n'
	JEQ changeloop
	LCB '\r'
	JEQ changeloop
	LCB 'Z'			# If we get a 'Z' or 'z', end of changes
	JEQ newprompt
	LCB 'z'
	JEQ newprompt
	STO A hexchar		# Store first hex nibble, do it again
	JINA			# Get a character and echo it
	JOUT(A)
	LCB ' '
	JEQ changeloop		# Start afresh for spaces and newlines
	LCB '\n'
	JEQ changeloop
	LCB '\r'
	JEQ changeloop
	LCB 'Z'			# If we get a 'Z' or 'z', end of changes
	JEQ newprompt
	LCB 'z'
	JEQ newprompt
	STO A hexchar2		# Store second hex nibble

	JSR bytecvt		# Convert to a single byte in cmdchar
	LDA cmdchar
	SIA addr		# Store the byte through the addr pointer

	LDB addr+1		# Increment the addr pointer
	STO B+1 addr+1
	TST B+1 JC 1f
	JMP changeloop
1:	LDB addr
	STO B+1 addr
	JMP changeloop


## puts subroutine
##
puts:	LIA strptr		# Get character through the ptr
	JAZ 1f			# Exit when we get the NUL character
	JOU .			# Print out the character
	OUT A
	LDB strptr+1		# Increment the low byte of the pointer
	STO B+1 strptr+1
	JMP puts		# and loop back
1:	RTS puts

## hexcvt subroutine. Given four hex digits stored in the hexchar
#	buffer, convert them into a 16-bit big endian address
#	stored in addr.
hexcvt: LDB hexchar		# Get the first character
	LCA $3F			# Add on $3F
	LDA A+B
	JAN 1f			# If -ve, was A-F
	LDA B
	JMP 2f			# Otherwise, was a 0-9 char
1:	LCB $0A			# Add on $0A to convert char to nibble
	LDA A+B
2:	LCB $04
	STO addr A<<B		# Save top nibble into addr

	LDB hexchar2		# Repeat the process on the 2nd char
	LCA $3F			# Add on $3F
	LDA A+B
	JAN 3f			# If -ve, was A-F
	LDA B
	JMP 4f			# Otherwise, was a 0-9 char
3:	LCB $0A			# Add on $0A to convert char to nibble
	LDA A+B
4:	LCB $0F			# Get the low nibble
	LDB A&B
	LDA addr
	STO addr A|B		# Combine both nibbles and store

	LDB hexchar3		# Repeat the process on the 3rd char
	LCA $3F			# Add on $3F
	LDA A+B
	JAN 5f			# If -ve, was A-F
	LDA B
	JMP 6f			# Otherwise, was a 0-9 char
5:	LCB $0A			# Add on $0A to convert char to nibble
	LDA A+B
6:	LCB $04
	STO addr+1 A<<B		# Save top nibble into addr

	LDB hexchar4		# Repeat the process on the 4th char
	LCA $3F			# Add on $3F
	LDA A+B
	JAN 7f			# If -ve, was A-F
	LDA B
	JMP 8f			# Otherwise, was a 0-9 char
7:	LCB $0A			# Add on $0A to convert char to nibble
	LDA A+B
8:	LCB $0F			# Get the low nibble
	LDB A&B
	LDA addr+1
	STO addr+1 A|B		# Combine both nibbles and store
	RTS hexcvt

## bytecvt subroutine. Given two hex digits stored in the hexchar
#	buffer, convert them into a 8-bit value stored in cmdchar
bytecvt:
	LDB hexchar		# Get the first character
	LCA $3F			# Add on $3F
	LDA A+B
	JAN 1f			# If -ve, was A-F
	LDA B
	JMP 2f			# Otherwise, was a 0-9 char
1:	LCB $0A			# Add on $0A to convert char to nibble
	LDA A+B
2:	LCB $04
	STO cmdchar A<<B	# Save top nibble into addr

	LDB hexchar2		# Repeat the process on the 2nd char
	LCA $3F			# Add on $3F
	LDA A+B
	JAN 3f			# If -ve, was A-F
	LDA B
	JMP 4f			# Otherwise, was a 0-9 char
3:	LCB $0A			# Add on $0A to convert char to nibble
	LDA A+B
4:	LCB $0F			# Get the low nibble
	LDB A&B
	LDA cmdchar
	STO cmdchar A|B		# Combine both nibbles and store
	RTS bytecvt

# prhex function: Print the value in hexchar
# out as two hex digits
prhex:	LDA hexchar	# Load a copy of A
	LCB $04		# Get high nibble of A
	LDA A>>B
	LCB $09
	JGT 1f		# Skip if in range A to F
	LCB $30		# Otherwise add '0'
	JMP 2f		# and print it
1:	LCB $37		# Add 55 to get it in 'A' to 'F'
2:	LDA A+B
	JOUT(A)

	LDA hexchar	# Get A back again
	LCB $0F		# Get the low nibble of A
	LDA A&B
	LCB $09
	JGT 1f		# Skip if in range A to F
	LCB $30		# Otherwise add '0'
	JMP 2f		# and print it
1:	LCB $37		# Add 55 to get it in 'A' to 'F'
2:	LDA A+B
	JOUT(A)
	RTS prhex

# String constants
	 PAG
welcome: STR "[2J[HCSCvon8 Monitor, $Revision: 1.15 $, type ? for help\n\n"
usage:	 STR "Usage: D dump, C change, R run, ? help, X exit\n"
setstr:	 STR "Enter space separated hex digits, end with Z\n\n"

	  ORG $FF00
hexchar:  HEX "00"		# Place to store four hex chars, page aligned
hexchar2: HEX "00"
hexchar3: HEX "00"
hexchar4: HEX "00"
strptr:	  HEX "00"		# String pointer for puts
	  HEX "00"
cmdchar:  HEX "00"		# Command character
hexcnt:	  HEX "00"		# Count of hex chars left to store
jmpaddr:  HEX "00"
addr:	  HEX "80"		# Address used by all commands
	  HEX "00"
count:	  HEX "00"		# 16-bit counter, used when loading a program
	  HEX "00"
