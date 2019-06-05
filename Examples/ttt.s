# An implementation of a Tic Tac Toe game in CSCvon8 assembly.
# Human plays against the computer. Computer will either win or draw.
#
# (c) 2019 Warren Toomey, GPL3

# The board is stored as a 10-byte page-aligned array so that we can
# index into it. Values are either spaces, 'O' or 'X'. Index position
# zero is not used, but it's there so the human can enter numbers 
# 1 to 9.

#define JOUT(x) JOU .; OUT x
#define JINA	JIU .; INA

# Initialise the board and the boolean flags iswin and istie
init:		LCA '1'; STO A board+1
		LCA '2'; STO A board+2
		LCA '3'; STO A board+3
		LCA '4'; STO A board+4
		LCA '5'; STO A board+5
		LCA '6'; STO A board+6
		LCA '7'; STO A board+7
		LCA '8'; STO A board+8
		LCA '9'; STO A board+9
		LCA $00; STO A istie; STO A iswin

# Also reset the initial jump destination. See notes below
		LHA S_________-11
		STO A smjump+1
		LCA S_________-11
		STO A smjump+2

# Print out the top row of the board
printboard:     JOUT('\n');
		JOUT(' '); LDA board+1; JOUT(A); JOUT(' '); JOUT('|')
		JOUT(' '); LDA board+2; JOUT(A); JOUT(' '); JOUT('|')
		JOUT(' '); LDA board+3; JOUT(A);

# Print out the line separating the rows
		LCB rowsepstr
1:		LDA rowsepstr,B
		JAZ 2f
		JOUT(A)
		LDB B+1
		JMP 1b

# Print out the second row of the board
2:		JOUT(' '); LDA board+4; JOUT(A); JOUT(' '); JOUT('|')
		JOUT(' '); LDA board+5; JOUT(A); JOUT(' '); JOUT('|')
		JOUT(' '); LDA board+6; JOUT(A);

# Print out the line separating the rows
		LCB rowsepstr
1:		LDA rowsepstr,B
		JAZ 2f
		JOUT(A)
		LDB B+1
		JMP 1b

# Print out the last row of the board
2:		JOUT(' '); LDA board+7; JOUT(A); JOUT(' '); JOUT('|')
		JOUT(' '); LDA board+8; JOUT(A); JOUT(' '); JOUT('|')
		JOUT(' '); LDA board+9; JOUT(A); JOUT('\n'); JOUT('\n')

# Is there a tie? If so, print out the tie string
		LDA istie
		JAN printtie

# Did the computer win? if so, print out the win string
		LDA iswin
		JAN printwin

# Print out the "enter a move" string
getmove:	LCB movestring
1:		LDA movestring,B
		JAZ 2f
		JOUT(A)
		LDB B+1
		JMP 1b

# Set an initial dummy move
		LCA ' '
		STO A usermove

# Get a key from the user and echo it back out
2:		JINA
		JOUT(A)

# Break out when they hit the Enter key: either CR or LF
		LCB '\n'
		JEQ 3f
		LCB '\r'
		JEQ 3f

# Otherwise store the move and loop back to get the Enter key
		STO A usermove
		JMP 2b

# We get here when the user has entered a move. It's an illegal move if
# it's below '1' or above '9'
3:		LDA usermove
		LCB '1'
		JLT printillegal
		LCB '9'
		JGT printillegal

# So, the move is between 1 to 9. AND off the top ASCII bits to get it in
# the 1 to 9 range
		LCB $0F
		LDB A&B
		STO B usermove

# Now load that position from the board and see if that position is
# empty: not a 'O' and not a 'X'
		LDA board,B
		LCB 'O'
		JEQ printillegal
		LCB 'X'
		JEQ printillegal

# Yes, the move is legal, so store a 'O' at that position
		LDB usermove
		LCA 'O'
		STO A board,B


# Now we get to the fun part where the computer makes a move.
# This is done as follows. Just before the human makes a move,
# the nine board values combined make the current state of the game.
# Based on this state and the human's move, there is an optimal
# move that the computer can make to answer it.
#
# Below is a single JMP instruction. This is going to be modified in
# two ways. Firstly, we add on a multiple of the user move, so that
# we jump to the code that deals with that specific user move.
#
# Secondly, in the code that we jump to, we know both the user's move
# and the computer's move, so we know what the board state will be
# after the computer's move. Therefore, we can _modify_ the JMP destination
# to point to the code to deal with the next user's move based on this
# next board state.
#
# So, at the actual JMP destination, the code does these things:
#  1. Make the best computer move, or set istie, or set iswin
#  2. Update the JMP destination to reflect the new board state
#  3. Jump back here to print the board out and get the next user move
#
# We can set A to the value 'X' and B (to raise istie or iswin flags) before
# we take the jump. So, the above actions can be done with these lines of code:
#
#	STO A <one board position> or STO B istie or STO B iswin
#	PPR sm+1 <new jump destination>
#	JMP printboard
#
# That's 11 bytes for each action, so we multiply the usermove by 11
# and add this to the jump destination. 
#
# Now, there could be up to nine possible user moves for each board
# state, but only when the board is empty. Yes, we could encode 99 bytes
# to deal with each board state, but that's wasteful of RAM. Instead
# we encode enough instructions to deal with the lowest AND highest
# valid user move for this board state. Example:
#
# Say the user can only make valid moves 3, 4, 6 and 7. We would encode
# handling for move 3, move 4, empty, move 6 and move 7. We would then
# calculate a jump destination 33 bytes below the move 3 destination
# so that B*11 is a minimum of 33 and it will find the first hander.
#
# All of the handling code is generated automatically. Behind the
# scenes there is a script to generate all board states, the user
# move, the best computer move and the result: next board or win or draw.
# A second script parses this and generates the handling code below.

# B still has the user's move. Multiply it by 11 decimal. It will now
# be 11, 22, 33 ... 99
		LCA $0B
		LDB A*B
		LDA smjump+2
		STO A+B smjump+2	# Add B to smjump+2
		TST A+B JC 1f		# Carry, so do the carry code
		JMP 2f			# Otherwise skip it
1:		LDA smjump+1
		STO A+1 smjump+1	# Ripple carry to high dest byte

2:

# Before we do the jump, set B to $80 so we can toggle the iswin or istie
# flags. Also set A to the character 'X' to be stored on the board
		LCA 'X'
		LCB $80

# And finally, here is the self-modifying jump which takes us to the
# specific code to handle the last user move. Changed by the above code.
# It initially points at the code for an empty board. The -11 is there to
# offset the base so that the lowest move, 1, hits the base correctly.

smjump:		JMP S_________-11

# We include the generated code from a second file
#include "tttmoves.s"


# The rest of the code below has the small snippets of code
# to print out messages to the user

# Print out the "illegal move" message and
# go back to get another move
printillegal:
		LCB illegalstr
1:		LDA illegalstr,B
		JAZ getmove
		JOUT(A)
		LDB B+1
		JMP 1b

# Print out the "is a tie" message
printtie:
		LCB tiestring
1:		LDA tiestring,B
		JAZ getenter
		JOUT(A)
		LDB B+1
		JMP 1b

# Print out the "computer win" message
printwin:
		LCB winstring
1:		LDA winstring,B
		JAZ getenter
		JOUT(A)
		LDB B+1
		JMP 1b

# Get the enter key from the user, could be a CR or a NL
getenter:	JINA
		LCB '\n'
		JEQ init
		LCB '\r'
		JEQ init
		JMP getenter


# Variables and strings below

		PAG
board:		HEX "30 31 32 33 34 35 36 37 38 39"
iswin:		HEX "00"
istie:		HEX "00"
usermove:	HEX "00"
rowsepstr:	STR "\n---+---+---\n"
tiestring:	STR "The game is a tie.\nHit Enter to start a new game: "
winstring:	STR "The computer has won.\nHit Enter to start a new game: "
movestring:	STR "Enter a move (1-9): "
illegalstr:	STR "That is not a legal move, try again\n"
