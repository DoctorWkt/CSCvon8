# How to Get Going with the CSCvon8 CPU

Right now, the only version of the CSCvon8 CPU is the Verilog version
in the *Verilog* folder, so make sure you have a Verilog interpreter or
compiler etc. installed. Right now, the *Makefile* in the *Verilog* folder
is set up to use [Icarus Verliog](http://iverilog.icarus.com/).

You will also need a system with Perl install. Yes, I know I should have
upgraded my brain to Python or some other newer language. It hasn't happened
yet.

## Build the Microcode ROM

Before you can run any CSCvon8 CPU program, you first need to generate the
microcode for the Decode ROM. To do this, first make sure that these programs
are executable:

    $ chmod +x cas clc gen_ucode

Now run the *gen_ucode* program to generate the Decode ROM's contents.

    $ ./gen_ucode

This reads the description of the microcode from the *microcode* file,
and creates two files: the ROM itself, *ucode.rom* and a summary of the
high-level instructions in the file *opcodes*.

Copy the *ucode.rom* into the *Verilog* folder:

    $ cp ucode.rom Verilog

Now you can assemble one of the example programs:

    $ ./cas Examples/example05.s

This will assemble the source code and create the contents of the instruction
ROM, *instr.rom*. Again, copy this file into the *Verilog* folder:

    $ cp instr.rom Verilog

Now go into the *Verilog* folder and run the *make* command:

    $ cd Verilog
    $ make

Assuming that you have Icarus Verilog installed, you should see this output:

    vvp icarus_tb.out
    VCD info: dumpfile test.vcd opened for output.
     !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

The line with all the printable ASCII characters is the output from the
*example05.s* assembly program.

# What to Read Next?

I would recommend:

  * [the *cas* assembler manual](cas_assembler.md)
  * [the *clc* compiler manual](clc_compiler.md)
  * [the overview of the CSCvon8 architecture](CSCvon8_design.md)
