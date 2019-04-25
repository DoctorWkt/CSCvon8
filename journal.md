## Thu 21 Mar 14:47:32 AEST 2019

OK, I've built a new design which allows instructions in RAM and ROM.
It's a microcoded design. It should take about 20 TTL chips. This time
I will probably build it in Verilog because I have nearly all the parts
from the existing CSC8 which I can use.

I've started designing the microcode and writing the script to generate
the microcode ROM from this input file.

## Fri 22 Mar 09:35:49 AEST 2019

I thought I'd backed up all my ucode.rom generating Perl code yesterday
to my nextCloud, but it didn't happen. Damn. So this morning, I've built
the Verilog version of the new CSC8 CPU. I'm sure that I've got the
control lines from the decoder different to what I had yesterday.

However, I've been able to run my first hi-level instruction LDA $23,
which consists of loading the IR from location $0000, incrementing the PC,
loading A from location $0001, incrementing the PC and resetting the
microsequencer to 0. Also, LDB $45 works.

## Fri 22 Mar 15:18:19 AEST 2019

Just built a list of 74HC chips available at Element14. I've spotted
the 74HC574. It's an 8-bit register with tri-state output (active low OE)
and an edge-triggered low-to-high load line. This will be good for all the
registers in the design: AH, AL, IR, A and B.

I want to do indexed addressing, e.g. LDA $HHLL,B. Stored as a 3-byte
instruction. To do this, I'll need to use the ALU for the 16-bit addition.
Obviously, the least number of chips is still a goal.

Given that we now have registers with tri-state output, can we can send the
AH register and the A register in as the first ALU argument. Can we do this
as a microsequence:

```
	Load IR with Mem[PC++]
	Load AH with Mem[PC++]		# Actually get the low address into AH
	AL= AH+B via the ALU with carry output
	Load AH with Mem[PC++]		# Now the high address byte
	AH= AH+0+carry in
	Load A with Mem[AR]
```

I thought I could optimise this by sending the data bus straight into the
ALU, but then the ALU output has to come out on the data bus, so that won't
work.

Also a problem: I really need to buffer the carry between the microinstructions.
How to do this without putting more chips into the design? Maybe I have to
bring back the Flags register and somehow lose the Jump logic chip?

OK, so I'm thinking this is going to be a real PITA to implement. How about
$HH00,B indexed addressing like the existing CSC8? I still have a spare control
bit. How about a 2-bit address bus selector:

```
	00: PC value
	01: AH/AL
	10: AH/A
	11: AH/B
```

I just realised that I can also do ($HHLL),B by doing:

```
	Load Mem[PC++] into AH
	Load Mem[PC++] into AL
	Load Mem[AR] into AH
	Load Mem[AH/B] into wherever
```

It means yet another multiplexer unfortunately. I don't think this is
going to be built with real chips, it's too complex. OK, I've added
this to the Verilog design and checked that the couple of instructions
I've already got still work. Yes they do. The control lines are now:

```
  uSreset, PCincr, AddrOp(2), JumpOp(2), DbusOp(2), LoadOp(3), ALUop(5)
```

But it does mean I need one 3:8 demux, three 2:4 demuxers, sigh.
And because the 74HC161 PC chips don't do tri-state, I need two
buffer chips to make the PC output tri-state. So:

```
32Kx8 RAM	LY62256 32Kx8 SRAM
32Kx8 ROM	28C256 32Kx8 EEPROM
UART		UM245R
2Mx16 ALU	M27C322 2Mx16 EPROM
AH		74HC574
AL		74HC574
IR		74HC574
A		74HC574
B		74HC574
PC		Four 74HC161
PC buffer	Two 74HC241
Jump logic	74HC153
4Kx16 Decode	M27C1024 64Kx16 EEPROM
uSeq counter	74HC161
LoadOp demux	74HC238
DbusOp demux	Half of 74HC139
AddrOp demux	Half of 74HC139
```

Total: 20?? Surely this isn't right. No clock yet.

Ah, I'll need a way to invert the msb of the address to enable RAM/ROM.
separately. Need to find a 4Kx16 EEPROM still.

## Sat 23 Mar 09:57:44 AEST 2019

OK, so I decided to rewrite the microcode generator. Then I decided to
start work on the assembler. Now I have these instructions and they
seem to work.

```
    EQU, NOP, LCA, LCB, OUTA, OUTB, STA, STB, LDA, LDB,
    A=0, B=0, A=B, B=A, A=-A, B=-B, JMP 
```

There were a few bugs along the way, mainly microcode ones! But overall
it's going well. I'm wondering if 256 instructions is enough.

## Sat 23 Mar 13:18:02 AEST 2019

I've got the indexed instructions to work, and I've converted most of
the CSC8 example assembly programs. Now I'm stuck on JSR/RTS. The PC's
value isn't connected to the data bus, so the assembler is going to have
to help out.

Question: do I want to have single-call functions or multi-call functions?
If the latter, do we want recursion or just call from many callers?
Recursion would require some form of stack. Multiple callers would just
need a "caller-id" idea like the existing CSC8 has.

I'm thinking of a JSR which converts into two real instructions, and a
single RTS instruction.

```
	RTS $XXXX: Load the address from $XXXX, $XXX+1 and jump to it.
		   Would probably destroy B in the process.

	SRA means store return address.
	SRA $CCCC $XXXX (yes, 5 bytes): Store the return address $CCCC
			at location $XXXX, $XXXX+1. Would probably
			destroy B in the process.
```

So the assembler would choose two adjacent RAM locations for each function.
A JSR would store the return address in these RAM locations and jump to the
function. An RTS would jump to the return address in these RAM locations.

For multi-call functions, we could have the instructions SRAB and RTSB,
which would be store return address at $XX00,B, and return to address at
$XX00,B.

I can tell that implementing this isn't going to be fun!
OK, I've done SRA and RTS in the microcode and hand-coded some examples
to test. Now I've got to add special handling to the assembler for both.
Example:

```
	JSR fred	Allocate some RAM for the return address.
			Do SRA fred, then tack on the return address.
	RTS fred	Don't actually use fred, find fred's return address
			location and use that instead.
```

## Sat 23 Mar 14:25:26 AEST 2019


```
Here's a program that works:
	SRA printA
	JMP printA
	LCA 'F'
	OUTA
x:	JMP x
	NOP
printA: LCA 'A'
	OUTA
	RTS printA
```

Except that I have to store PC+8 in the SRA stream, and the SRA
must be followed by a JMP. Looks like I'll just merge the two and
make a single JSR instruction which will be seven (7!) bytes long:

```
	JSR store address, return address, function address
```

Argh! Alright, done and it works but it is SO ugly. Sigh.

## Sat 23 Mar 17:14:01 AEST 2019

I've brought example09 over, which uses JSR/RTS. I've also just got
minsky.s working as well, yay!

## Sat 23 Mar 17:37:53 AEST 2019

I've brought the clc compiler over and made enough changes to compile
himinsky.cl. I had to change the parsing in cas to parse the output.
I just checked: all the assembly examples still work. But the himinsky.s
output isn't working yet. Need to check the .s file first!

The loop that prints out the spaces and the star is working. But it looks
like X isn't being decremented. It stays at the same initial value.

Yes, I hadn't properly changed clc. It now works for all six example .cl
programs from the CSC8 Examples area. Yay!!

## Sun 24 Mar 10:26:05 AEST 2019

I just RCS tagged all the current Verilog files with ALUROM. This is because
I have written a new ALU in Verilog instead of using a ROM. I've just
modified newcsv8.v to use this ALU, and have checked it in as version 1.12.
All the Examples/example*.s work, but minsky.s doesn't work. It looks like
something is going wrong with negative results. Not sure if it's the result
or the flags yet. I wonder if I could write three FOR loops in Verilog to
get out all the results and flags, then compare against the same for the ROM
version.

Working on diffing the results. I've fixed a few, live divide by zero.
Now up to Op 20, A<<B. OK, I've fixed pretty much as much as I want to.
There are different interpretations on how to error with BCD, and how to
error with very big << shifts, but all the Examples/*.s and Examples/*.cl
now run with new CSC8.

Still a lot of microinstructions to write! But at least, if I wanted to
try to synthesize it, I've got a smaller ALU now.

## Mon 25 Mar 13:41:16 AEST 2019

The only things I could find from Friday's work were the diagram and the
initial documents, so I've copied those into the directory with the
weekend's work. I might start on the KiCad schematic, so I can see
exactly what chips I need & where to put them.

## Mon 25 Mar 20:33:00 AEST 2019

Working on the KiCad schematic. Things to add:

```
Addressing: control lines for the PC buffers, CP and OE for ARhi & ARlo.

ALU_Data: CP and OE for Areg and Breg
	Some lines on the ALU ROM

Memory and IO: WE and RD lines for the UART
	OE, WE and CS lines for the RAM
	OE, WE and CS lines for the ROM

Decode: some control lines on the Decode ROM
	CP and OE for the IR
```

## Tue 26 Mar 03:03:02 AEST 2019

Awake with a crazy idea. Right now we have a fair bit of decode logic:

```
LoadOp demux    74HC238, produces eight control lines
DbusOp demux    Half of 74HC139, produces four control lines
AddrOp demux    Half of 74HC139, produces four control lines
```

That's two chips which produce sixteen control lines: actually fourteen
as some are no-ops. Why not just have a second Decode ROM to produce these
lines. We could then lose the 74HC238 and the 74HC139.

OK, so we'd save a single chip. Damn, I thought it would be better than
this. Oh well.

## Tue 26 Mar 06:28:36 AEST 2019

I added the 74HC238 and 74HC139 multiplexers last night. The AddrOp mux
isn't going to work, because I'm enabling the A and B registers but I
need them for the ALU operation. For example, if I do:

```
	STA $8000
```

then I need to assert AH/AL and not A and not B, so A's value is high-Z
and there is nothing to send into the ALU to place on the data bus.

What it means, therefore, if I want to do indexed addressing, e.g. $8000,B,
that I need to do AL=B through the data bus first. So I should be able to
do this in microcode and not in hardware.

Also, I think I need an inverter for the RAM/ROM CS chip select line and,
because of the above change, and inverter for the PC/AR CS chip select line.
Oh well, one more chip,sigh.

## Tue 26 Mar 09:48:20 AEST 2019


OK, now rewriting the microcode to not use AR,B. I've got the two existing
indexed operations working. Now on to JSR and RTS and I've fouled up somewhere.
Right, fixed that up. I also changed the Verilog to only use a single line
for the address bus control, not two lines for AddrOp. So now we have a spare
control line!!

## Tue 26 Mar 10:58:21 AEST 2019

I've made a first go at completing the KiCad schematic. We have left over:

 - half a 74HC153 4:1 mux
 - half a 74HC139 2:4 demux
 - four inverters

The two inverters I've used are:

 - convert address bus adr15 into chip select for ROM and RAM
 - convert PCaddr enable line for both PC and AR (~PCaddr for AR)

I'd love to find a way to use those spare halves to replace the inverter!
At present it is 22 chips including the clock crystal. Sigh. The PC itself
is costing six chips!!!

I asked on Hackaday and they suggested the 74HC593 which is an 8-bit
register/counter with tri-state. The only drawback is that it reads/writes
on the same port. I'll have to think if I can use this. Would drop the
chip count from six to two chips for the PC.

It could be possible. Looking at the microcode for a jump instruction:

```
61 JA!=B: MEMresult AHload PCincr
          MEMresult ALload PCincr
          ALUresult A-Bspecial AR JumpZero uSreset
```

We load AR with the address. We use the data bus to calculate A-B
but only for the flags result. The jump logic then tells the PC to
load a new value and we reset the microsequencer.

So, yes we could wire up two 74HC593s directly to the address bus.
I'll think about this some more.

Here's what I think is the wiring:

```
Gnd: G, RCKEN#, CCKEN
Vcc: CCLR#
Clk: CCK, RCK
PCena: G#
PCload: CLOAD#
PCincr: CCKEN#
```

RCO# from low chip to CCKEN# on high chip. RCO# on high chip is NC.

## Tue 26 Mar 15:22:28 AEST 2019

Just noticed in the existing design that PCincr isn't connected to the
161s! Also looked at the waveform diagram in the datasheet and it looks
like PCincr is active high and connected to CET. But with the 593s it will
be active low and connected to CLOAD#.

Luckily, the Decode ROM looks after this so I'll only have to redo
the microcode generation if required. Technically, it's required now because
of the 161s :-)

Just realised, the 593s have both G and G# to enable output, so we don't
need an inverter to separate the PC and AR on the address bus. That's one
inverter removed.

Now can I create an inverter for the A15 address line so I can drive RAM
and ROM, using the 139 2:4 demux half that is left? Or the 153 4:1 mux?
I think so. That would bring the total chip count down to 17! Yay!

Done and tested with all the Example .s files.

## Tue 26 Mar 21:33:54 AEST 2019

I've brought the Docs and Figs up to date, and extended the coverage
of the microsequences in the documentation. I've also started to call
the design the CSCvon8 CPU, as it's crazy small, a von Neumann architecture
and an 8-bit CPU.

## Wed 27 Mar 10:13:58 AEST 2019

I have written some more documentation and renamed everywhere I could
think of with the CSCvon8 name. It's getting close to be ready for
release on GitHub. OK, released on Github.

I should try to do a timing analysis of the design to see what sort of
maximum clock frequency I can expect.

Longest path is Clock -> PC -> RAM/ROM -> IR -> Decode 

```
	PC  108nS
        RAM  70nS (ignore, lower than ROM)
	ROM 150nS
        IR   13nS
      Decode 60nS
      -----------
      Total 330nS So that would be about 3MHz, yay, faster than 1Mhz 6502!
```

Fixed up some schematic DRC problems.

## Thu 28 Mar 06:35:09 AEST 2019

Spent sone time last night playing with PCBnew in KiCad and freerouter.
I think I've got the hang of it, but of course I'm sure I have missed
a few things.

Buy HCT as they are more compatible with LS, esp. if I have to buy two
74LS593s.

We need: coupling capacitors, a reset line, a hand-toggle for the clock,
a jumper to disable the on-board clock. Look for anything on Nibbler and
Gigatron which we should have.

Looking at oscillators on Element14, perhaps one of these:

```
QX14T50B3.686400B50TT	3.68MHz
QX14T50B2.457600B50TT 	2.45MHz
```

Same package dimensions, so I could do the PCB and try both.

We can wire CCLR# on the PC chips to ground to reset the counter. Done.
I've added the reset circuit, the single-step clock circuit and the
bypass caps to the schematic on a new sheet. Now I might play with
the PCB.

For now I won't worry about getting the exact footprints right, just
concentrate on the workflow.

In schematic, do DRC check, run Cvpcb to associate footprints. Export
the netlist. Go to PCBnew. Select everything, delete everything. Import
the netlist. Lay out the footprints. Try to minimise the ratsnest as you do it.
Orient things: ICs, caps, resistors where possible.
Select the edge layer, and use the dashed diagonal line tool on the right
to draw the edge layer. Double-click on the last point.
Do the copper pours now before Freeroute!
Now export and use Freeroute to route the nets.
Back import the session, hit b to rebuild something.
Run a DRC check.

Copper pours: select the F.Cu layer on the right. Click on Add Filled Zones
tool on the right. Click on the top-left edge layer. Choose GND net and the
F.Cu layer (already chosen). Ensure you have thermal relief in the middle.
Click on the other corners and double-click on the final corner.

To copy to the back copper layer, right-click on the edge. Choose Zones ->
Duplicate Zone, and choose B.Cu in the dialog box.

Got back, right-click on the edge. Choose each zone in turn and Fill Zones.
Then on the left, use the Show Filled Areas button to show them.

To rip up all the tracks, select everything. In the Block Operations dialog,
only tick Tracks. Then right-click and Delete Block.

OK, I'm pretty happy with the results. Now, I need to really cross-check:

  - is the schematic correct, what wiring mistakes have I made?
  - select the absolute correct footprints and view the board and
    the 3D model before running Freeroute.

I'd also like to synthesize the Verilog on to the ULX3S board that I have.
There should be enough block RAM to synthesize the ROM ALU as well as the
Decode ROM and the RAM & ROM.

## Thu 28 Mar 12:26:24 AEST 2019

Component shopping

```
RAM	LY62256		element14 $3.57
ROM  	28C256		not at element14, eBay $1.64
UART   	UM245R 		Already got it
ALU  	M27C322		not at element14, eBay around $12
ARhi  	74HCT574 	element14 $1.11
ARlo  	74HCT574 	element14 $1.11
IR  	74HCT574 	element14 $1.11
A reg  	74HCT574  	element14 $1.11
Breg  	74HCT574  	element14 $1.11
PC  2x	74LS593		X-On eBay sells 74LS593 for $30ea
Jump 	74HCT153  	DIPs not at element14, eBay $20 10 pieces
Decode 	M27C1024	not at element14, eBay around $10
uSeq  	74HCT161 	element14 $0.37
Other 	74HCT139	element14 $1.36
	74HCT238	element14 $1.87
Crystal QX14T50B3.686	element14 $4.78
```

Just ordered some of the stuff from utsource, mainly the memory and
stuff I can't get from element14.

I tried to synthesize the system for the ULX3S but yosys didn't like the
RAM & ROM and threw everything away. So I might try with Verilator first.

## Thu 28 Mar 22:05:28 AEST 2019

Actually I tried with yosys. The ALU ROM causes yosys to die with a malloc()
error, so I'm back using the other ALU. There's a loop involving the BCDcarry,
so I've tweaked that out for now. I can compile it with Verilator. Now I'm
comparing it against the Icarus VCD waveforms and they are different. Not
sure why yet.

OK, some progress. In ~/Z2 I have a version which works both with Icarus
and with Verilator. I need to merge this back into the Git version, and
then worry about the ULX3S version.

## Fri 29 Mar 06:12:52 AEST 2019

Imported the Verilator version back into my NNN folder and made sure
it all still works with Icarus. Doing some yosys investigation. I have a
script called runthruyosys that does:

```
	yosys -p 'synth_ecp5; write_verilog' $1
```

With a ram module from the web that does this:

```
  output reg [WordSize-1:0] rdata;
  always @(posedge clk) begin
        if (wen) mem[addr] <= wdata;
        rdata <= mem[addr];
  end
```

This gets synthesized to some ECP5_DP16KD blocks. If I make the reg rdata
and do assign rdata = mem[addr]; instead, I get:
Mapping to bram type $__ECP5_DP16KD failed.

I've changed the CSCvon8 ram.v around to a reg and <=, and both the Icarus
and the Verilator simulation fail. There would be a clock delay in getting
the output of the RAM now. Maybe I've got to do the thing I did with CSCv2
and generate a double-speed clock for the memory devices, then use the single
clock for the system.

Now I have double-clocked RAM and ROM devices that are working in Verilator
but not in Icarus! But they do synthesize to block RAM with yosys. I have no
idea how to debug this, but I might try building the ULX3S version again.

It took over 10 minutes to synthesize, the sim annealing took ages with the
block RAM. Also, it came under the 12MHz timing limit with 3MHz. When minsky
runs, I get:

```
 *                                                                                                     with 0x04 after the \n
    *                                                                                                  
       *                                                                                               
          *                                                                                            
             *                                                                                         
                *
```

i.e. just a linear increase. However, it does show that the code is running,
i.e. the IR, ROM, uSeq and control lines are doing something.

Ideas to speed up the synthesis and hit timing: remove the MUL, DIV, MOD,
make the RAM/ROM smaller, e.g. 1K each not 32K each. Yes, that helps a lot
with synth speed but still the same results. I could use the LEDs and the
push buttons to help debug, I suppose.

OK, trying example04 on a loop on the ULX3S, and it works fine. This is
just incrementing B and doing a test. Hmm, example05 on a loop doesn't.
This uses indexed RAM. I don't see any UART action, but the LEDs show the
PC is changing.

So I've changed example04 to print out a char, store at $2000, read it back
and print it out again. This works for Icarus, Verilator and ULX3S. But
example05 doesn't, which uses RAM indexing.

I think I have pinpointed the problem but not the solution. It's because
of the reg output on the ROM modules and the fact that we are double clocking
them now. We are STA $8020, so $8020 is on the address bus. Then the uSeq
goes to phase 0 to get the next instruction. But $8020 is still on the
address bus, and therefore we fetch the instruction from $8020 and it's
$00, i.e. NOP.

Somehow I've got to deal with the reg delay through the RAM and ROM.
Very annoying!

## Sat 30 Mar 12:04:16 AEST 2019

I've given up on synthesizing to the ULX3S for now. I will have to learn
how to build Verilog code that deals with the block RAM delay, sigh.

I'm going back to the working Verilator/Icarus version and trying to put
in non-blocking keyboard reading. I've started to use the tx/rxuartlite
code from Dan Gisselquist, and I'm using curses to do the non-blocking
reads in the uartsim.cpp. I'm losing output characters because the CPU
runs too fast, and I can't dial down the CPU speed as it makes
CLOCKS_PER_BAUD too small and then the UART doesn't work.

This will probably be a problem with the real CPU. I'm happy to read NUL
characters if the UART has nothing, we can loop back in software. But
need a way to detect if the UART is busy and loop back before the OUTA
instruction. I'm using a 74LS153 4:1 mux for the jumps at present. I could
use an 8:1 mux somehow.

The 74HCT251 is an 8:1 mux with non-inverting and inverting outputs.
The ALU can generate either non-inverting and inverting inputs, so it
really depends on what the UM245R can do. Pin 22 TXE# is low when the UART
is ready to write, high if it is not ready.

We have a spare control bit from the Decode logic! So let's promote the
JumpOp to three bits. Also remember that PC has CLOAD#, active low.

Need to make ALU outputs active high now. We also have two more JumpOp
options!!! I could bring back overflow from the ALU, as there are five
spare outputs from the ALU.

I know, jump if divide/mod by zero. So we would have:

```
       JumpOp	'251 input	Inverted output meaning
	000	1		0, always jump
	001	Carry		Jump if carry
	010	Verflow		Jump if overflow
	011	Zero		Jump if zero
	100	Negative	Jump if negative
	101	Divbyzero	Jump if divide by zero
	110	TXE#		Jump if TX not ready
	111	RXF#		Jump if RX not ready
```

That's cool! Same number of chips and a lot more jump options. I won't have
time on the weekend to redo the ALU and rewire the Verilog, but I will do it
during the week I hope.

## Sat 30 Mar 13:14:22 AEST 2019

I've physically moved directories to Zvon8, so I can work on this version
without affecting the original. I should be able to `ifdef VERILATOR and
keep the original Icarus uart.v as well as the new tx/rxuartlite.v code.
That will make it faster to test the new ALU but still check that the
new jump lines are working.

## Sat 30 Mar 18:40:57 AEST 2019

I've got Icarus working and the CPU has the new jump control lines. I've
got all the Example/*.s working. I generated the ALU rom, but I haven't
fixed up the overflow and divbyzero in otheralu.v yet. Now to get Verilator
working with the new control lines. That will be more fun.

Yes, now working, but I need to L1: JNOTX L1 after OUT instructions because
Verilator now requires several clock cycles to transmit the OUT character
at 115,200 bps! I haven't fixed clc yet. Also, we now JMP $FFFF to exit(0),
it's a lot easier now that we have a whole bunch of L1: JNOTX L1 instructions.

Hmm, I've coded up the JNORX (no received data) instruction, and I've
checked that the curses rxuart code I borrowed from TTT works in TTT.
But it's not working here. It could be that the rxuart doesn't have a
control line to fetch the data in the 1-byte buffer. So I might have to
rewrite the code a bit.

## Sat 30 Mar 21:57:23 AEST 2019

I've rewritten the rxuartlite code so that there is now a strobe line
to get the data, and it resets the availability line. I've added some
new instructions and example09 now reads from the UART and echoes it back.

TODO: Replace curses with tcgetattr()/tcsetattr() because curses clears
the screen at the start and the end, which is annoying. Also, either
uartsim.cpp or rxuartlite.v is returning $FF characters which is should not
do, or I am doing something wrong. But, one step forward though!

Also todo: start to rationalise the order of the instructions; right now
they are haphazardly arranged. Maybe set aside pages of 16 instructions
for different groups of instructions?

I'll need 32 for A= ALUOP, 32 for B= ALUOP, 32 for MEM= ALUOP. Actually,
31, 31 and 32 as I won't need A=A, B=B.

## Sun 31 Mar 07:22:49 AEST 2019

Moved to tcgetattr()/tcsetattr(). The $FF bug seems to be in rxuartlite.v.
Yes, I fixed it. The code was triggering because the stop bit was being
treated as the start bit. So that's the TODO from yesterday fixed.
OK, I spent some time and I added all the ALU ops and then reorganised the
order of instructions in the microcode. Still lots more instructions to be
added, though.

## Mon  1 Apr 14:50:39 AEST 2019

I've quickly added the 74HCT251 to the schematic and rearranged the JumpOp
and ALU flag result lines. I'll need to carefully check it later. I was
considering adding the reset delay device from Gigatron, but I think my RC
circuit will do the same thing, as long as I hold the button down when I
turn it on.

Should I add a power LED? What about some LEDs on the data and address bus?
Or perhaps just some pin headers so I can add some diagnostic leads?
I'm thinking of a 200mm by 150mm PCB. Need to get prices on them.

## Mon  1 Apr 16:48:16 AEST 2019

I'm not very happy with the instruction names, so I need a way of naming
something in the microcode file that can be exported and picked up in the
cas assembler. Here are my thoughts at present.

```
LDA ALUop [Jx $XXXX]	where ALUop is one of 32 words, and seven J jumps
	   JC			carry set
	   JV			overflow set
	   JZ			zero set
	   JN			negative set
	   JD			divbyzero set
	   JO			output not ready
	   JI			input not ready
```

Hmm, because each one has to be microcoded, I can't put all the jump versions
in as I'd run out of instructions. So I'll have to limit the jump options.
Say ADDs with JC, DIV and MODs with JD

```
LCA $XX			load constant
LDA $XXXX		load from memory
LDA $XXXX,B		load indexed from memory
[ all the above with B not A ]

STO ALUop $XXXX		store ALUop in $XXXX, optional jump
STO ALUop $XXXX,B	store ALUop in $XXXX indexed with B, optional jump

INA			Load UART into A
INB			Load UART into B
INR $XXXX		Load UART into RAM
INR $XXXX,X		Load UART into RAM indexed with B
OUT ALUop [Jxx]		Output the ALUop and optional jump

Jxx $XXXX		jump to $XXXX, eight jumps:
JMP			Always jump
JEQ			Jump if A==B
JNE			Jump if A!=B
JGT			Jump if A>B
JLT			Jump if A<B
JGE			Jump if A>=B
JLE			Jump if A<=B
JOU			Jump if output is not ready (unavailable)
JIU			Jump if input is unavailable

JSR $XXXX $CCCC $SSSS. 	Store $XXXX at $CCCC then jump to $SSSS.

RTS $CCCC		Load $XXXX from $XXXX and jump to $XXXX.

NOP
```

Maybe I can encode the name in the microcode file, e.g. LDA:A/B:JD, or LCA
or LDA or LDA:,B. Have some lookup tables in cas.

Make a hash of keywords, Split each line into words, remove the label.
Build a list of keywords separated by colons. Look up the result in
an instruction table. Recognise $XXXX, $XX and labels. Check for consistency
between # of instruction bytes and the addresses & constants on the line.

Just realised that Kicad has output labels and the ~ prefix marks lines as
active low, so I've just added these to the schematic. I'm also thinking, now
that the design is solid, to write a csim for this new CSCvon8 architecture.

## Mon  1 Apr 20:16:34 AEST 2019

I've written a csim, but actually the Verilator version is faster to load
and run! Also, not all the examples are running in Verilator. I wonder if
my microcode rewrite isn't perfect.

Yes, the new microcode breaks Examples/example03.s.
Hah, used csim to find the bugs. Was all the STA/STB
instructions, I'd forgot to add ARena to them.

I've just rewritten the microcode and cas to change the instruction syntax
to be like what I suggested just before. I've converted all the Example/*.s
files. They run under Verilator.

However, there's a csim bug as it doesn't act like Verilator for:
Examples/example09.s and Examples/minsky.s. So that's something to
investigate.

Modified clc to speak the new assembly syntax. All the .cl examples compile,
assemble and run.

## Tue  2 Apr 06:26:02 AEST 2019

I'll leave csim aside for now. Might try to work on the schematic again
today & try to really make sure it has no bugs in it. I see that Gigatron
uses global labels H and L for logic high/low instead of Vcc, Gnd. I might
use that, make it look nicer. I will put in some pin headers so I can add some
diagnostic leads. Also, add sheet information and other textual information
to the schematic.

## Tue  2 Apr 11:27:09 AEST 2019

I added sheet information and other textual information, pin headers for
data bus, address bus, IR and uSeq counter. That should be enough. Then
I printed it out and went over every chip for correct pins and function.
I found some big issues. Most importantly the 74LS574 load line is active
HIGH, not active low. So most of the XXload lines need to be changed.

Oh no!!! The 74LS138 3:8 demux only outputs active low lines, so I can't
send them to IRload, Aload, Bload, AHload and ALload! Argh!!!

So it's a bit tricky now. I need:

 - IRload, Aload, Bload, AHload and ALload to be active high
 - MEMload and IOload 			   to be active low

Damnit, I think I'm going to have to add a hex inverter chip, sigh!

## Tue  2 Apr 14:29:55 AEST 2019

Added the inverter, made some more small schematic changes. Now I've started
a trial PCB layout to see where the big clusters of lines are. Running
freeroute at the moment. I've moved a few things around to make it cleaner,
and it's looking OK at the moment.

## Tue  2 Apr 20:09:52 AEST 2019

I've gone back in and added two extra pins per header, one for a space and
one for a ground pin. We have: IR, uSeq, address bus and data bus pin headers.
Before, I left freeroute running for about an hour and it got down to about
35 vias from 70, which is excellent. Hopefully I'll get the same result now.

No, got down to about 42 this time. That's still quite good, and the 3D
view of the PCB is impressive. What I now need to do is to get the chips
and other components and ensure that I'm using the right footprint for each
one. Then I might be able to shrink the board a little bit.

Another big question: I'm going to have 32K of ROM for this thing. I want
to get to a point where I can boot from ROM, download and run programs in
RAM. So I need at least a front-end program to download over the UART,
and perhaps a memory inspector? And that leads to another question, am I
going to write this in asm, in the clc language, or am I going to port the
h2 compiler over to this architecture?

Can I run csim connected to a pseudo-tty and then connect minicom to the
pseudo-tty,so I get the same form of interface that I would with the real
hardware. Then, what is the download structure going to look like?

I think the UM254R defaults to 9600, wonder if this can be controlled by the
USB. So, 960 chars/second, that's about 1K per second. If we can send 8-bit
binary then we could send a 32K image in say 40 seconds.

Perhaps send: size in 2 bytes followed by the raw bytes? The loader puts the
size in FFFE/FFFF, and decrements until the count goes to zero. Would be
nice and easy.

Memory dumper: it's not going to be a disassembler, no, but probably just
a hex dump given a range of RAM.

```
Start: 8000
End: 8020
64 77 00 31 62 80 03 41 80 06 f0 ff fe 00 41 00 
9b 62 80 02 41 80 06 f0 ff fe 00 4e 00 9b 60 3d
```

Something like that. Then we can cut and paste this into disasm.
Would be nice to have a well-defined entry point in ROM that we can
jump to, that gives a command prompt and does things.

```
> L 8000	Load over UART into this location
> D 8000 [8020]	Dump memory. If only one number, dump 16 bytes
> C 8000	Change memory. Enter several hex pairs, end with a newline.
> R 8000	Run (JSR) starting at 8000
> X		Assume that we fell into the monitor from a breakpoint,
		exit back to the running program.
```

Now we need to start defining some monitor locations :-)
Also, need to modify cas so we can set the PC, perhaps ORG? Also, define
some strings, but put them on a page start so B can access them?

```
fred:	ORG $8000
	...
	...
hello	STR "Hello there, how are you?"
```

Now we have to deal with spaces on the input lines, of course.

Yes, csim and Perl can do ptys:

```
use IO::Pty;
$pty = new IO::Pty;
print("name is ", $pty->ttyname(), "\n"); sleep(10);
foreach $val (1..10) { print $pty "$val\n"; }
sleep(5);
close($pty);
```

which can be read from minicom -p /dev/pts/2

## Wed  3 Apr 13:34:40 AEST 2019

I've rewritten the parser in cas so it can deal with ' ', "hello" and
is more flexible. I forgot that I changed A>>BL into A>>B, so I had
to fix some examples and the clc.

Just added ORG and STR pseudo-ops to cas. But I think I'll have to redo
STR as I just write the ASCII directly into the instruction stream.
What I should do is wait until after the first pass, then put each
string in its own page starting at offset zero on that page. Let's
leave it for now and see how bad the code is to print out the string.

Here's my code to print out a string, so far:

```
fred:	JMP start
hello:	STR "ABCDEFGH"
start:	LCB hello		# Start at the base of hello
loop:	LDA hello,B		# Get a character
	LDA A JZ end		# Exit if NUL
	OUT A			# Print it out
L1:	JOU L1			# Wait for UART
	LDB B+1
	JMP loop
end:	LCA $0A			# Finally print a newline
	OUT A
L2:	JOU L2
	JMP $FFFF
```

That's not too bad. I'll add a HEX pseudo-op as well.

If I start writing more pseudo-ops, I'll think about writing a subroutine
table so I can lookup and run the code for each pseudo-op out of the table.

Fix a cas bug with parsing ,B. Fixed the csim bug, which was a JumpOp bug.
I now generate a storable alu.hex file if it doesn't exist, which speeds
csim up.

Hah, I added "." to mean current PC value to cas, so I can JOU .
Very original Unix assembler, there.

## Thu  4 Apr 09:30:20 AEST 2019

I fixed up the UART input in csim. I then added in the pty code. The pty
output works fine, but pty input doesn't work yet. When I hit a key,
multiple copies of that key go into csim. Not sure why yet.

Fixed. I can call cbreak on the $IN and leave it on now. Turning it on and
off was causing the problem. So now I have a sim which I can access through
minicom just like I will be able to with the real hardware, oh except not
simulating the 9600bps speed :)

I've implemented LIA and LIB instructions, which all access through a pointer
to a memory location. Assume that $F000/$F001 holds a pointer to
string: STR "Hello", then LIA $F000 will load "H" into A.

## Thu  4 Apr 11:21:15 AEST 2019

Back to the idea of a monitor. I now have puts() working with the LIA
instruction. So, I could create some subroutines in monitor ROM that can
be used by RAM programs :-) Example: convert two ASCII hex digits in RAM
into a byte in RAM.

## Fri  5 Apr 13:49:31 AEST 2019

YADI: Yet another design idea. Right now, we can't jump during a microsequence,
and we have an external Jump logic chip. So, use a bigger Decode ROM and move
the jump logic into the ROM.

Inputs to new Decode ROM:

 - IR, 8 bits
 - phase, 4 bits
 - DNZVC, 5 bits
 - two UART status bits

So we need a 19-bit or 512Kx16 ROM.

Outputs from the new Decode ROM:

 - ALUop, 5 bits
 - LoadOp, 3 bits		- reader from the data bus
 - DbusOp, 2 bits		- writer to the data bus
 - new phase, 4 bits
 - ARena, 1 bit			- who writes on the address bus
 - PCincr, 1 bit		- increment the PC
 - PCload, 1 bit		- load the PC

Damn that's 17 bits. We really do need to have: increment PC, load PC,
leave PC as it is. Can we get away with four bits by merging the AR
control somehow.

```
  00	PCena		- Just for symmetry
  00	PCena PCincr	- Put PC on the address bus and increment it
			  (used to load the instruction and following bytes)
  01	ARena		- Put AR on the data bus
			  (used to access memory, read/write)
  10	ARena PCload	- Load PC from the AR (used for jumps)
```

Yes, looks like we could do it.

The idea would be to move the phase manually as part of each microinstruction.
For example, we could OUT A to the UART and get the microsequence to loop
until the UART was ready, then send the value to the UART. Ditto for the
UART reading.

Similarly, we could do JNA (jump if A is negative) by doing the "A" ALUop,
not writing to the data bus, but then moving the microsequence to the
"load PC" section if we see the N flag in the ALU status.

Something to watch out for, especially in the last paragraph. There would
be metastability as the Decode ROM controls the ALU ROM, whose output comes
back to the Decode ROM. Oh, we don't need a uSeq counter any more, so we
only need a register for the microsequence counter, and it will always load
from the Deode ROM on every clock cycle. So, can we use an 8-bit register
for the uSeq phase: 4 bits for the sequence, 4 bits of NVZC status from the
ALU. That would get rid of the metastability.

But ... I was hoping to lose the Jump logic chip. Now I need to decode
the AR/PC control lines and the unused 2:4 demux half is not going to
be able to do this. So, no savings in chips. Well, it's a nice idea but
I don't think it's worth a redesign if I'm not saving chips.

## Fri  5 Apr 19:59:22 AEST 2019

I thought about things while we were out. At present:

 - ALUop, 5 bits
 - LoadOp, 3 bits		- reader from the data bus
 - DbusOp, 2 bits		- writer to the data bus
 - new phase, 4 bits
 - ARena, 1 bit			- who writes on the address bus
 - PCincr, 1 bit		- increment the PC
 - PCload, 1 bit		- load the PC

17 bits total.

Two ways to shave a bit off:
 1. Drop ALUop to 4 bits, so only 16 operations. This is possible
    because we can now jump within the microsequence. This would
    be very reminiscent of CSCv2. Alternatively,
 2. Only have 3 bits for the phase, so only eight microinstructions in
    each high-level instruction. I'll have to see if this is possible.
    Both JSR and RTS need more than 8 microinstructions. I could go back
    to the idea of "Load Return Address" into AR, then "Jump to AR".
    Similarly, "Save Return Address" then JMP to do a JSR.

I think I prefer option 1. Main question: can we do a 16-bit add with
a carry, e.g.
  
```
	LDA Alo		
	LDB Blo
	STO A+B Reslo	# Add & store low byte, save the carry flag
	LDA Ahi
	LDB Bhi
	STO A+BC Reshi	# Add & store high byte and any carry
```

It would mean that I need two add ALU operations, and two subtract ALU
operations, A+B, A+B+1, A-B, A-B-1. Here are the CSCv2 ALU operations:

```
    # A + B decimal
    # A - B decimal
    # A & B
    # A | B
    # A ^ B
    # A + 1				Probably B+1 is better
    # 0, flags set to B's value		We can reuse this as A+B+1
    # 0
    # A + B binary
    # A - B binary
    # A
    # B
    # A * B binary, low nibble
    # A * B binary, high nibble
    # A / B binary
    # A % B binary
```

There are no shifts any more! So, no I don't like the 4-bit ALUop option
much either, sigh.

Another idea I had was to let the uSeq increment by default, but jump to
a 4-bit phase which is 1xxx, so the msb is high and we only need 3 bits
of jump phase. But now we need control lines: reset phase to zero, load
phase to 1xxx, which is actually CCxxx or five bits, so it's actually worse.

Well, it was worth some idle exploring of the potential of a phase+flags
register, but I can't see a way to save chips and keep the current
functionality.

## Fri  5 Apr 20:47:25 AEST 2019

Looking at DigiKey as well as Element14. There are 2.3mm wide rectangular LEDs.
I was thinking of putting black tape between each one to isolate adjacent
light, to make arrays of 4, 8 and 16 LEDs. I'd be happy to use a single
(or a few) dropping resistors. Then I can plug them into the sockets. And
I can plug pin headers into the sockets if I need test points.

Hmm, looks like I can buy everything I need at DigiKey, so that's what
I'll probably do. Just thinking, perhaps I should socket the oscillator
so I can buy different speed ones in case I've got the speed wrong!

## Sat  6 Apr 09:53:36 AEST 2019

I've just put in my DigiKey order, AUS$88 roughly. I've bought a 1MHz and
3.54MHz oscillator. I now have dimensions for pretty much all things.

I've redone the PCB layout, added some silk screen labels and also made the
Vcc and Gnd tracks wider. I'm now running freeroute (yet) again. It's done,
and now I have a lovely PCB with copper fills and the 3D view looks nice.
There's a PCB manufacturer in Molendinar, so I've sent them an e-mail
asking for a quote.

## Sun  7 Apr 20:40:36 AEST 2019

I wrote a tool called net2human to take the Schematic.net file and convert
it into a text file so I can read it and easily see which IC pins are
connected to which nets. Useful names, e.g.

```
	RAM pin 13, HM62256BLP-7 D2: d2
```

i.e the D2 pin on the RAM is connected to the d2 net. I went through all
the chip pins and they are all connected fine.

After that, I thought again about synthesizing block RAM. So I wrote a
really cut-down CPU with ROM and Decode ROM, and posted a Reddit FPGA
question on how to convert the output from a combinational result to a
clocked and hence delayed result. Apart from that, I haven't done much
else. I know I should work on the monitor ROM: dump memory, upload a
new program to RAM, but it's tedious :-) I'm looking forward to the
parts turning up. I can play with individual chips on breadboard first.

## Mon  8 Apr 09:24:37 AEST 2019

Last night I decided to sit down and try to nut out a solution to
the clocked block RAM issue. The problem: my normal Verilog memory
has a combinational result:

```
	assign result= mem[address];
```

But yosys doesn't synthesize this to block RAM, because the output
has to be clocked:

```
  output reg [7:0] result;
  reg [7:0] mem [0:255];
  always @(posedge i_clk) begin
    if (wr_stb)
      mem[address] <= data;
    result <= mem[address];
  end
```

So I built a trivial microsequenced CPU with no ALU, just this set of
microsequences:

```
   0 NOP: IRload PCincr         Do nothing except increment the PC
          uSreset
   1 LCX: IRload PCincr         Load X with byte after instruction
          Xload uSreset
   2 LDX: IRload PCincr         Load X with ROM[byte after instruction]
          ARload PCincr
          ARena Xload uSreset
   3 STX: IRload PCincr         Store X to ROM[byte after instruction]
          ARload PCincr                 OK, so ROM is also RAM-like!
          ARena Xena uSreset
   4 JMP: IRload PCincr         Jump: set PC's value to byte after instruction
          ARload PCincr
          ARena PCload uSreset
```

This worked with the original "assign result= mem[address];" memory
component, but not with the clocked "result <= mem[address];" because
of the delay in getting the ROM output. I asked on Reddit for ideas,
and one person said you need to have a read_strobe line into the ROM
and a data_valid line out.

Given that the CPU is microsequenced, I realised that I could just
rewrite the microcode to put in some delays to allow the results
of the ROM and the Decode ROM to propagate. Here's the new set of
microcode instructions. The starred entries are the changed ones:

```
0 NOP: IRload PCincr            Increment the PC, load the IR
       * do_nothing             (wait for the IR to be loaded)
       uSreset                  Reset the micosequencer

1 LCX: IRload PCincr            Increment the PC, load the IR
       * do_nothing             (wait for the IR to be loaded)
       Xload uSreset            Load the X register, reset the micosequencer

2 LDX: IRload PCincr            Increment the PC, load the IR
       * do_nothing             (wait for the IR to be loaded)
       ARload PCincr            Load the address reg, increment the PC
       * Arena                  Use the AR to index the ROM, wait for it
       Xload uSreset            Load the X register, reset the micosequencer

3 STX: IRload PCincr            Increment the PC, load the IR
       * do_nothing             (wait for the IR to be loaded)
       ARload PCincr            Load the address reg, increment the PC
       ARena Xena uSreset       Put X on the databus, write to ROM, reset uSeq

4 JMP: IRload PCincr            Increment the PC, load the IR
       * do_nothing             (wait for the IR to be loaded)
       ARload                   Load the address reg, no need to incr the PC
       ARena PCload uSreset     Load the PC from AR, reset the micosequencer
```

Another person said to clock the ROM at 3x the CPU, which is the same as
saying clock the CPU a 1/3 the speed of the ROM. I remembered that I had
to half-speed the CSCv2 for this reason.

I think the above solution is better because it doesn't double the
duration of every instruction:

```
	NOP: 2 -> 3 microinstructions
	LCX: 2 -> 3 microinstructions
	LDX: 3 -> 5 microinstructions
 	STX: 3 -> 4 microinstructions
	JMP: 3 -> 4 microinstructions
```

Fortunately, all of the above is only to deal with the block RAM synthesis
on an FPGA. That's not my primary concern here, as I'll be using real chips.
So I can stick to my combinational memory component for the Verilator
simulation.

## Mon  8 Apr 13:51:06 AEST 2019

Back to the monitor. Fixed an indexing bug. The ROM burner should arrive
in the next few days. The chips from Utsource are estimated to arrive
on the 13th April. Digikey: Tuesday, 09/04/2019. So I'll have a lot of
pieces to play with soon!

I wrote the code to convert 4 chars into a 16-bit address. Now I need
a SIA "Store Indexed A" instruction to store A through a pointer to memory.
Example SIA $1234, where $1234 and $1235 holds the address $5678 which is
where A needs to be stored. I need this so I can read the byte stream of
an incoming program down the UART and save it in memory starting at the
address given by the user.

Problem is, I don't have enough registers to hold everything. One solution
is to write the "STO A" instruction byte before the address in RAM, then
the address, then an RTS instruction, and then JSR to this. Self-modifying
code, in other words. But a proper SIA instruction would be better.

I took a slightly different approach. In RAM, construct a STO A addr
and a JMP back instruction. I had to add a label/HI syntax in cas so
I could access the top byte of a label's address.

## Mon  8 Apr 21:20:54 AEST 2019

Yay, I just downloaded and ran my first program over the "serial cable".
In this case, I did ./csim < infile. The executed program was this:

```
	ORG $9000		# Print out *\n over and over
	LCA '*'
	JOU .
	OUT A
	LCA '\n'
	JOU .
	OUT A
	JMP $0000
```

To do this, I put in a file L\n<addr><len><binary data>R\n where the binary
data was the assembled code above. Here is the hexdump of the file:

```
00000000  4c 0a 90 00 00 0e 60 2a  77 90 02 64 60 0a 77 90
00000010  08 64 70 90 00 52 0a
```

4c 0a is the L\n.
90 00 is the address to load the program.
00 0e is the length of the program minus 1, i.e. 0x0e or 14
The program is 60 2a 77 90 02 64 60 0a 77 90 08 64 70 90 00
which is 15 bytes. We set 14 so we go negative when we
decrement the length counter.
52 0a is the R\n.

So when I do ./csim < fred2 I see:

```
Welcome to the CSCvon8 monitor ROM

> L
> R
*
*
*
*
*
etc.
*
```

## Mon  8 Apr 22:59:50 AEST 2019

Doing some PCB pricing. OSH Park are quoting US$174.40 for a 254.2 x 88.5mm
times 3 boards. www.breadboardkiller.com.au are quoting AU$117.25 for a
250mm x 88mm board (250mm is maximum) times 5 boards. Shipping is either
AU$13 or AU$40. So they seem to be cheaper overall than OSH Park. But I
do need to bring my design down to 250mm. Should not be too hard.

## Tue  9 Apr 08:41:37 AEST 2019

I squeezed the UART to the left last night and left freeroute running. This
morning, still 29 vias. I've added back in the copper pours and updated the
version # on the silkscreen to say v2019/04/19. Breadboardkiller shipping is $40
for 4-7 days from Singapore (it seems).  I think I'll hold off on ordering the
board until the parts arrive and I can play on the breadboards with them first.

## Wed 10 Apr 11:04:32 AEST 2019

Last night I built a 4-LED array and two 8-LED arrays which work. Now playing
with the 161 counter for the uSeqencer. I think I've realised that my key
debounce curcuit isn't up to scratch. Looking at the 2-resistor 1-cap circuit
here:
https://hackaday.com/2015/12/09/embed-with-elliot-debounce-your-noisy-buttons-part-i/
I've built it with 20K, 1K, 10uF components and it works fine, drops to 0
when the button is pressed.

However, the equivalent pulse up button isn't working well. I think I will
go with the one-shot clock circuit that I had on the CSCv2 with a 555. Oh
well, yet another chip. At least it's "analog" and not logic.

Using the CSCv2 clock pulse from the actual CSCv2 board, I've set up the
161 uSeqencer and checked that it counts and resets. Now to update the
schematic again.

Argh, I couldn't find a good schematic with the new stripboard 555
circuit. I had to grep through my old web browser history to find this:
https://electronics.stackexchange.com/questions/180716/555-timer-one-shot-trigger

## Wed 10 Apr 21:27:02 AEST 2019

I've added the 555 and extra components to the schematic, and placed them
on the PCB to try and minimise the tracks. It's now in the hands of freeroute.
I do have the caps, resistors and diode to add it, but I need to get some 555s.
I've ordered 10 555s for $3.50 from eBay, arriving Monday.

## Thu 11 Apr 08:22:26 AEST 2019

Just tried out one of the 74HCT574 register chips. Works as advertised!
Just looking at the schematic, what I really need now are the 74LS593
register/counters which I'm using for the PC. There are a lot of control
lines on each one, and I need to know that I have them controlled as is
required.

Just before I throw some scribbles out.
ZIF socket: top end 4mm from pin to left edge, 10mm from pin to top edge.
	    bottom end, 4mm again to left, 7mm to bottom.

Pushbuttons: flat edge to top, left side is 1&3 wired together, right side
is 2&4 wired together.

## Fri 12 Apr 09:14:04 AEST 2019

The 74LS593s arrived yesterday. I played with one and got it to count.
I did notice that it was counting irregularly when CCLK and RCLK were
strobed at the same time. So I've started to wire up both 74LS593s (PC)
and two 74HCT574s (AR) as per the schematic, and I'll play with them.

I've ordered the 555s. What I think I will do is also set up a 161 as the
uSeq, the Decode ROM and get it to output the control lines needed for the
PC and AR. Then I can run a simple microsequence and check that it works
as advertised. This will require a fair amount of breadboard wiring. I
did some last night.

I've drawn up a schematic with a oneshot 555 & 161 sending a 00 to 0F sequence
to a 28C256 ROM which has 8 outputs. I'll only use four. They will be ARena#, 
PCload#, PCincr# and Reset#. I've also confirmed that I can read and write the
ROM with the minipro software. I've also written bin2hex and hex2bin scripts
so I can hand-edit the bottom 16 bytes to be whatever control line sequence
I want. Now to wait for the 555s (Monday) and some green breadboard wire so
I can at least make it look a bit pretty when I'm testing it.

## Sat 13 Apr 10:50:09 AEST 2019

I had problems yesterday getting the oneshot 555 to clock the 74LS593s
directly to RCK and CCK. They were incrementing haphazardly. It turns out
that, because I was using the 555 circuit from the CSCv2, it was loaded so
that the output only reached 3.7V. By isolating the 55 circuit from the
CSCv2, it got to 4.7V and this clocks the 74LS593s fine. I used my
Bitscope Micro to see and measure the waveform.

It turns out that G has to be high and G# low to enable the 74LS593 output.
So I have to write G# low and connect G to ARena#.

I'm doing a breadboard test circuit with the two AR registers on the left,
the two PC 74LS593s on the right, a 161 as a counter and a ROM to output
16 different control line combinations. So I can try all the various
control line combinations in sequence to check that things will work. I'm
using the isolated CSCv2 isolated circuit for now.

A quick test, wire the four 161 output bits to the four control lines:
Reset#, PCload#, ARena# and PCincr#. They nearly all seem to work as
expected:

 + When ARena# is low, we only see the AR value which is 0011001111010011.
 + When ARena# is high, we see the PC value. Reset# makes it zero.
 + Reset# overrides PCload#. We see the PC with AR's value when Reset# is
   high and PCload# low.

Now the interesting part:

 + Reset#, PCload# and ARena# high, PCincr# goes low on a clock tick,
   we see the PC increment. As expected.
 + Reset#, PCload# and ARena# high, PCincr# goes high on a clock tick,
   the PC also increments. Not expected.

So I tied PCincr# high and there is no increment, sensible.
Then I tied PCincr# low. Increments on both clock pulses
when Reset#, PCload# and ARena# high. Also sensible.
It looks like PCincr# has to high before the clock tick to stop it
incrementing.

What I might now do is bring the ROM into action and program up a
sequence of 16 control patterns to see what happens under a "sensible"
sequence.

I'll wire up to D7 .. D4 these lines: Reset#, PCload#, ARena#, PCincr#.
Useful actions:

```
Reset#, PCload#, ARena#, PCincr# -> 0111, 0x7 Reset and put PC on the bus
Reset#, PCload#, ARena#, PCincr# -> 1001, 0x9 Load PC from the AR
Reset#, PCload#, ARena#, PCincr# -> 1101, 0xD Put AR on the bus
Reset#, PCload#, ARena#, PCincr# -> 1110, 0xE Increment and put PC on the bus
Reset#, PCload#, ARena#, PCincr# -> 1111, 0xF Put PC on the bus
```

Let's try this out:

```
Reset		 7
Reset		 7
Reset		 7
Put AR on bus	 D
Load PC from AR  9
Put PC on bus	 F
Increment PC	 E
Increment PC	 E
Increment PC	 E
Increment PC	 E
Put AR on bus	 D
Put PC on bus	 F
Increment PC	 E
Increment PC	 E
Increment PC	 E
Increment PC	 E
```

## Sun 14 Apr 21:18:07 AEST 2019

OK, things are not working as I expected. Firstly, I'm seeing transients on the ROM
output such that a line, which should stay high, has a ~1uS transient down to 0V on
a rising clock edge. Not all the time, but sporadically. I'm guessing that the address
lines are changing and that, as the ROM adjusts to the new address, some intermediate
address gets accessed and I see the output drop temporarily.

I was going to put in two inverters to add a clock delay, but that would only add about
25nS to the clock, much smaller than the 1uS issue.

Then I had the idea. I could use one of the ROM output pins as the clock signal. Then the
clock signal will have the same propagation delay as the other ROM pins. It won't help with
the transient I'm seeing, but it may delay the clock edge to the point where the transient
doesn't matter. I'll try this out tomorrow.

I'm putting my 593 testing notes up as a blog post here:
https://minnie.tuhs.org/Blog/2019_04_12_74LS593_notes.html

As an extra note, when I monitor the pins of the 161 counter with my Bitscope Micro
DSO, I don't see any transients even when the 161 pin stays high across the rising
clock edge. So it has to be a ROM issue. I've got a 0.1uF bypass cap right on Vcc and
a 200uF cap on the power rails as well.

We'll see how using the ROM as the clock goes. 

## Mon 15 Apr 11:36:38 AEST 2019

Did work, and I had sort of given up. Then I looked at the waveform in the datasheet.
I'm going to try this now. Wire G and RCKEN# together as ARena#, goes low when AR on
the bus. Make RCK an active high PCincr, but inverted as CLOAD#. So assert ARena# low
then RCK high to load the PC from the AR.

## Mon 15 Apr 16:27:54 AEST 2019

Some success. I've written it up here:
https://minnie.tuhs.org/Blog/2019_04_15_74LS593_testing_pt2.html
Basically, tie G and RCKEN# together to make ARena#.
PCload is now active high tied to RCK, but I need an inverse to tie to CLOAD#.
PCincr# is tied to CCKEN# but I think need a inverse to be CCK.

I just had a brainwave. The 74HCT251 Jump logic chip already has Z and Z#
output, so that's what I need to PCload and PCload#.

Second brainwave. Don't use CCKEN# but use CCKEN and tie this to CCK as
PCincr. So, no need for any inverters! I'll try this out soon.

The takeawey message is: ARena# doesn't need to be clocked, and PCload
works fine with the system clock. But the CCK needed for PCincr must
be generated at the same time as CCKEN, otherwise CCKEN will arrive too
late and the increment doesn't happen.

## Tue 16 Apr 14:20:59 AEST 2019

I tried using CCKEN and it works, so definitely no new inverters!
I got my 555s today. Also just played with the MiniPro ROM programmer.
For the 27C1024s I have to ignore the ID check but I can read and write
the two ROMs that I have. However, one of the 28C256s is dead.

I'm thinking of building the control logic on some breadboards:
```
 74HCT161 counter
 74HCT574 IR
 27C1024 Decode ROM
 74HCT251 Jump Logic
 74HCT139 Databus writer
 74HCT138 Databus reader
```

I can probably leave the last two out as there is no data bus yet :-)
But I do want to join it up to the AR/PC board. Just thinking of the
layout:

```
       574
       IR	 27C1024
		 decode
                   ROM
       161	 
     counter
		   251
		  jump
       555	  logic
     circuit
```

I've also got to rewrite the contents of the decode ROM now that PCload and
PCincr are active high.

I've built the 555 circuit, had the diode around the wrong way. Also built
the 161 counter and checked that they both work. Added the RC reset circuit
and checked that it resets the 161 counter.

## Wed 17 Apr 13:10:50 AEST 2019

I've added in the 574 IR and the 27C1024 decode ROM. I've got some LED arrays
so that I can see the output from the ROM. I've got IR set to 00. Here is
a dump of the ROM and some notes:

```
 0000  0001  0002  0003  0004  0005  0006  0007
lo hi lo hi lo hi lo hi lo hi lo hi lo hi lo hi
-----------------------------------------------
01 02 03 04 05 06 23 45 a9 ff ff ff ff ff ff ff
```

Here are the first eight 16-bit values in the ROM as dumped by minipro.
Note that it goes lo/hi not hi/lo. So when I write out the microcode in
hex I need to ensure that I do it this way.

## Wed 17 Apr 16:01:14 AEST 2019

The minipro adaptor to read/write the 42-pin ALU ROM has arrived and it
seems to work, in that I read FF all locations :-)

I've joined the breadboards with the uSeq, IR and decode ROM next to
the breadoards with the AR chips and the PC chips. Unfortunately I don't
have any yellow or green hookup wire at present, so I don't want to use
blue everywhere :-) So for now I'll stop wiring it all up.

If (if!) I decide to wire the whole damn thing up on breadboards, I also need:

 - RAM, ROM, UART and inverter, but this is going to need 16-bit address bus
   and 8-bit data bus
 - Areg, Breg and ALU ROM
 - somewhere, databus writer demux and databus reader demux.

Not sure of the design to put all this on breadboards.

## Sat 20 Apr 13:55:55 AEST 2019

I ordered some wire but it was stranded not solid when it arrived, so I've
ordered more cable which is solid this time.

While I was waiting, I was contacted by Tim Rudy who is the guy building
7400 Verilog models on Github. So last night I thought I might build
a CSCvon8 using his models and some I made myself.

I got it wired up, still mistakes to fix I'm sure. The big gotcha that
has come out of this is that I'll need to add "wait states" to my
microcode. This is because the Decode ROM is now driving all the chips.

Example: Areg is a 74HCT574 with only a clock line to load it. So Aload needs
to be a rising signal. Here's the existing microcode for LCA $23:

```
START:= MEMresult IRload PCincr			uSeq==0
60 LCA: MEMresult Aload PCincr uSreset		uSeq==1
```

The IR is also a 74HCT574, so we need MEMresult[PC]==$60 before the IRload
signal. Also, PCincr needs to be _low_ otherwise PCincr won't happen! On the
second line, MEMresult may still be the instruction $60 and not $23, so we
have to wait. So, this microcode works with the 7400 Verilog components:


```
START:= MEMresult IRload
60 LCA: MEMresult PCincr
        MEMresult Aload
        PCincr uSreset
```

That's twice the number of phases to get the instruction done. We need this
to ensure that PCincr is done twice.

Hmm, looking at the Databus reader 74HCT138, if I wire the G1 (enable) line
up to the system clock, it will disable (active high) the output on all eight
lines when the clock goes low. That would guarantee a control line drop
for half a clock pulse.

Damn, that's OK for the databus loaders, but PCincr comes directly out
from the Decode ROM as well as uSreset. Ah we have a half a 74HCT139,
I'll go look at that.

Hmm, well its outputs are active low and PCincr is active high.
And I don't have a spare inverter gate.

But looking at the gate diagram for the 74LS593, both CCK and the
CCKEN/CCKEN# pair go into an AND gate. So perhaps I can keep CCK
high and use CCKEN# as the dropping signal? No, I just set the gates
up in Logisim and only CLK can toggle the output with the other two
constant. Damn.

So what I need is an AND gate: PCincr = ROM line AND clock. I'll put that
in manually and see what it does.

## Sun 21 Apr 15:25:39 AEST 2019

It helps, except that I can't get the TTL modelled version to work in
iverilog. I'm seeing the 574 register load when there is no clock load
signal. I've tried it in Verilator and I had to fix a lot of things up.
I've had to clock CLOAD# on the 74LS593 otherwise Verilator complains
about a logic loop. So that could be another line to watch and control
with the clock?? Not sure.

So right now I'm not able to simulate it at the TTL level, but I do think
the attempt has been useful.

## Sun 21 Apr 20:11:13 AEST 2019

I'm doing some modelling in iverilog with just a clock with a 10uS time
period, a PCincr line that changes 1uS after the clock to simulate the
ROM delay. I've tried a few things but this is what I've come up with.

PCincr AND clk as CCK isn't going to work because PCincr is delayed
after the clk rise. So, yes once PCincr goes high then CCK will go
up & down as clk does.

But: when we decide to lower PCincr to stop a further increment, it's
too late. clk will rise, so too will CCK. Then PCincr drops but we've
done the CCK and incremented the PC.

I think this should work but I need to wire it up.

```
	clk    -> CCK
	PCincr -> CCKEN
	high   -> CCKEN#
```

With PCincr high just after clk goes high, nothing happens but the
PC will increment on the _next_ clk. Hopefully this will be OK for
the address bus will change before the next Decode ROM output to
do the next microinstruction.

I need to do this on the breadboard and confirm it.

## Mon 22 Apr 15:06:38 AEST 2019

More thoughts, captured in the blog post:
https://minnie.tuhs.org/Blog/2019_04_19_74LS593_testing_pt3.html

I'm now doing a Verilog model with TTL chips and delays based on their
datasheets. I've just got LCA, LCA, JMP to work! The instruction ROM is
much slower than the Decode ROM and both are delayed compared to the clock.

So far I have uSeq, IR, PC, AR, A, instruction ROM, decode ROM, jump logic
and some inverters and I can run this program:

```
hello:  LCA $34
        LCA $23
        NOP
end:    JMP hello
```

Because of the instruction ROM slow speed, I had to put an earlier ARena
on the JMP instruction:

```
70 JMP: MEMresult AHload PCincr
        MEMresult ALload PCincr ARena		<===
        ALUresult 0 ARena JumpZero uSreset
```

## Mon 22 Apr 18:42:32 AEST 2019

More progress. In ~/ownCloud/TTL_Models/SimpleCPU I have a Verilog TTL CPU with
delays on the TTL chips. I can run examples 01 to 04 now and I've just got
stuck on example05. So that's progress! Fixed, I seem to need to move
uSreset down on a line by itself for many instructions.

OK, I'm up to JSR and RTS and they are not working. So I'll stop now
and work on rewriting the microcode so that they do work.

## Mon 22 Apr 21:35:36 AEST 2019

Right, I have JSR and RTS working in the TTL version. I've moved the
SimpleCPU version up to ~/ownCloud/TTL_Models, and I've added lots of
(c) messages for me and Tim Rudy to the files. All the example0x.s
programs run in the TTL version. But minsky.s and print_str.s don't yet
run. I'm pretty sure it will be a microcode issue, and that hopefully means
that I have the wiring (and the reasons for the wiring) correct. Mind you,
I thought that before, didn't I?!

## Tue 23 Apr 13:46:21 AEST 2019

minsky.s now runs on the TTL verilog version but print_str.s nor
print_indir_str.s run properly yet. All the clc source code files run on the 
TTL verilog version. So I really do hope that it's the microcode now.

And now print_str.s runs, and print_indir_str.s nearly runs properly! The
latter would indicate that it's the LIA instruction that needs some work.

I parameterised the clock cycle length. I can get it down to 320nS, which
is 3.125 MHz. That's a lot faster than I thought it would get to.

## Tue 23 Apr 21:10:49 AEST 2019

I've fixed the LIA instructions so they now work. That means that every
program works! I was looking for a faster 32Kx8 EPROM. I just found the
57C71C EPROM with 70nS access time. Hmm, I just tried changing the TTL
verilog version's Decode ROM to 70nS from 150nS and it didn't improve
the clock speed at all. There must be another path which is the limiting
factor. I'll have to work that out.

## Wed 24 Apr 07:50:23 AEST 2019

I've got a few different work areas at various stages, so I started work
on merging them back into one area now that the design and wiring is
starting to settle down.

OK, that's mostly done. I moved the original Verilog version into an Old
directory. I've tried to bring most of the documents up to date, but I
still need to fix up the cas documentation.

## Thu 25 Apr 11:44:08 AEST 2019

cas documentation fixed up. I brought the schematic wiring up to date
with the TTL verilog version. But now there's a bug. I forgot to wire
ROMselect and MEMena to the Instruction ROM chip in the TTL verilog version.
I've done this and now examples 8, 9 and the print_* examples fail. Damn.

Not a microcode bug. It means I have to increase the minimum clock
cycle duration to 460uS, which is a max 2.17MHz clock. While I'm tinkering,
let's see the effect of a 57C71C EPROM with 70nS access time. Yes, down
to a 310uS cycle duration or a max 3.22MHz clock. Interesting.