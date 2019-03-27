
# CSCvon8 Assembler Documentation

Warren Toomey,  27th March, 2019

## Introduction

>*As the CSCvon8 CPU is still under development, this document may deviate
from the current status of the assembler cas and the simulator csim.*

The *cas* assembler reads a single text file with CSCvon8 assembly
source, and assembles it into the file to load into the Instruction ROM,
*instr.rom*. This file can then be copied into the *Verilog* folder to be
simulated with the Verilog version of the CSCvon8 CPU.

The current command-line syntax to run *cas* is:

	cas [-d] inputfile

The *-d* flag enables debugging output.

## Assembly Syntax

The assembler ignores blank lines, and discards text from a hash character
'#' onwards. Otherwise, each line from the input file has one or more
space-separated words on it. The general syntax is the following:

>[label:] instruction [additional operands]

## Labels

The optional label is a single alphanumeric word terminated by a colon
':'. If the instruction is the pseudo-op EQU, then the label is set to
the value of the literal constant in the additional operands (or 0 if
there is no literal constant on the line).

If the instruction is not the pseudo-op EQU, then the label is set to
the value of the Program Counter (PC) for this line of code.

## Instructions

Because CSCvon8 is a microcoded architecture, the list of high-level
instructions depends upon the contents of the Decode ROM and the
microinstruction sequences therein. You should look at the file *opcodes*
which lists the current high-level instructions defined by the
*microcode* file. Each line in *opcodes* has the opcode number, the number of
bytes in memory that the instruction occupies, and the opcode name for
the instruction.

## Pseudo-instructions

The assembler defines some other pseudo-instructions (one so far):

| Pseudoinstruction | Meaning |
|--------------------------|-------------|
| EQU | give a value to a label |

## Additional Operand: Literal Values

A literal value can be expressed in several ways:
 - four hex digits preceded by a dollar sign, e.g. $23AB. This represents an unsigned 16-bit value. 
 - two hex digits preceded by a dollar sign, e.g. $4D. This is used to express an 8-bit unsigned value which can be loaded into a register.
 - a single ASCII character surrounded by single quotes, e.g. 'F'. Note that, because of the space-separated rule, the literal character ' ' cannot be parsed. There is, as yet, no support for escaped literal characters such as '\n'.
 - a previously defined label name. The value of the label is substitued for its name.
 - an indexed address of the format "$XX00,B" where XX are two hex
 digits. The other two hex digits must be zero characters.

The assembler supports the "label,A"  and "label,B" syntax. This has
the effect of appending the register letter to the end of the opcode name.
Example: LDA $2000,B becomes LDAB $2000. This requires that the *microcode*
file contain index instructions with the -A and -B suffix.

## Example Code

Here is at least one example program to help you visualise the CSCvon8
assembly syntax.  Note that the Verilog CSCvon8 simulator will stop when
a jump instruction jumps back to itself.

    # Fifth program. Store ASCII characters
    # in an array in memory, read them back,
    # and print them.
    #
    
            LCA $7F         # We end when we reach 0x7F
            LCB $20         # Start with a space
    loop1:  STB $8000,B     # Store B in $8000+B
            B=B+1           # Increment B
            JA!=B loop1     # Loop back until we get to 0x7F
    
            LCB $20         # Start with a space
    loop2:  LDA $8000,B     # Load the stored value back in
            JA!=B nl        # Stop when we get something we didn't store
            OUTA            # Print it out
            B=B+1           # Increment B
            JMP loop2
    
    nl:     LCA $0A
            OUTA            # Print a newline
    end:    JMP end         # and stop