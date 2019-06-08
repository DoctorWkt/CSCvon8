
# CSCvon8 Assembler Documentation

Warren Toomey,  8th Jun 2019

## Introduction

>*As the CSCvon8 CPU is still under development, this document may deviate
from the current status of the assembler cas and the simulator csim.*

The *cas* assembler reads a single text file with CSCvon8 assembly
source, and assembles it into the file to load into the Instruction ROM,
*instr.rom*. This file can then be copied into the *Verilog* folder to be
simulated with the Verilog version of the CSCvon8 CPU.

The current command-line syntax to run *cas* is:

        cas [-d] [-r] inputfile

The *-d* flag enables debugging output. The *-r* flag assembles the program
to run from RAM and not from ROM. It also tells the assembler to create
a "hex" version of the output which you can upload to the Monitor ROM.

## Assembly Syntax

The assembler ignores blank lines, and discards text from a hash character
'#' onwards. Otherwise, each line from the input file has one or more
space-separated words on it. The general syntax is an optional label
followed by an instruction and additional arguments. Then, optionally a
semicolon and another instruction and additional arguments.

>[label:] instruction [additional operands] [; instruction [ [additional operands] ] ; ...

You can also have a label on a line by itself with no instructions.

## Labels

The optional label is a single alphanumeric word terminated by a colon
':'. If the instruction is the pseudo-op EQU, then the label is set to
the value of the literal constant in the additional operands (or 0 if
there is no literal constant on the line).

If the instruction is not the pseudo-op EQU, then the label is set to
the value of the Program Counter (PC) for this line of code.

The assembler supports relative forward and backward labels, which
do not pollute the global namespace. These are numeric labels like
_1:_, _2:_, _3:_ etc. In an instruction, the label _1f_ jumps forward to
the nearest _1:_ label; the label _2b_ jumps backwards to the nearest _2:_ label.

## Instructions

Because CSCvon8 is a microcoded architecture, the list of high-level
instructions depends upon the contents of the Decode ROM and the
microinstruction sequences therein. You should look at the file *opcodes*
which lists the current high-level instructions defined by the
*microcode* file. Each line in *opcodes* has the opcode number, the number of
bytes in memory that the instruction occupies, and the opcode name for
the instruction.

## Additional Operand: Literal Values

A literal value can be expressed in several ways:
 - four hex digits preceded by a dollar sign, e.g. $23AB. This represents
   an unsigned 16-bit value. 
 - two hex digits preceded by a dollar sign, e.g. $4D. This is used to express
   an 8-bit unsigned value which can be loaded into a register.
 - a single ASCII character surrounded by single quotes, e.g. 'F'. There is
   support for '\n', '\t' and '\r'.
 - a previously defined label name. The value of the label is substitued for its name.
 - an indexed address of the format "$XX00,B" where XX are two hex
 digits. The other two hex digits must be zero characters.

The assembler supports the "." syntax as a label that means "the current address".
A common instruction to wait until there is input available on the UART is:

```
        JIU .   # Jump to this instruction if input unavailable
```

The assembler supports the "label,A"  and "label,B" syntax. This uses
the top byte of the label as a base, and indexes at this base with the
given register. Note: the bottom byte of the label is treated as zero!
Note: not all instructions support indexing; read the file *opcodes*
to determine which instructions support indexing.

The assembler also supports the "label+num" and "label-num" syntax.
This adds or subtracts a constant decimal value from the label's value.

## Pseudo-instructions

The assembler defines some other pseudo-instructions (one so far):

| Pseudoinstruction | Meaning |
|--------------------------|-------------|
| EQU | give a value to a label |
| ORG | set the address of the next input line to a specific value |
| STR | Define a NUL-terminated string in memory |
| LHA | Load the high byte of an address or label into A |
| LHB | Load the high byte of an address or label into B |
| PAG | Set the next address so it will on a 256-byte page alignment |

Here are some examples of their use:

```
fred:   EQU $9000               # Fred is a byte stored at $9000

        ORG $4002               # Move down to middle ROM
mystr:  STR "abcdefg"           # Store a string at $4002 onwards
        PAG
        STR "xyz"               # Store a string at $4100 onwards

        ORG $0000               # Back to the start of ROM
        LHA mystr               # Load $40 into A
        LCB mystr               # Load $02 into B
```

## Use of the C Pre-processor

The assembler runs the input file through the C pre-processor
before it is assembled. This allows you to #include other files
amd also create macros. Here are some useful macros:

```
#define getc(x)      JIU .; INA; STO A x
#define JOUT(x)      JOU .; OUT x
#define JINA         JIU .; INA
```

_getc(fred)_ reads a character from the UART and stores it in _fred_.
_JOUT('A')_ waits for the UART to be ready, then outputs an 'A'.
_JINA_ reads a character from the UART into the A register.
 
## Example Code

Here is at least one example program to help you visualise the CSCvon8
assembly syntax.  Note that the _csim_ and Verilog CSCvon8 simulators
will stop when a jump instruction jumps to location $FFFF.


```
# Fifth program. Store ASCII characters
# in an array in memory, read them back,
# and print them.
#

        LCA $7F         # We end when we reach 0x7F
        LCB $20         # Start with a space
1:      STO B $9000,B   # Store B in $9000+B
        LDB B+1         # Increment B
        JNE 1b          # Loop back until we get to 0x7F

        LCB $20         # Start with a space
2:      LDA $9000,B     # Load the stored value back in
        JNE nl          # Stop when we get something we didn't store
        OUT A           # Print it out
        JOU .           # Loop waiting for it to print
        LDB B+1         # Increment B
        JMP 2b

nl:     LCA $0A
        OUT A           # Print a newline
L2:     JOU L2          # Loop waiting for it to print
end:    JMP $FFFF       # and stop
```
