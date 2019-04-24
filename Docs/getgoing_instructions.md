# How to Get Going with the CSCvon8 CPU

There are two versions of the CSCvon8 CPU: the *csim* simulator written
in Perl, and the Verilog version in the top-level folder. To use the Verilog
version you will need to install [Icarus Verliog](http://iverilog.icarus.com/).

You will also need a system with Perl install. Yes, I know I should have
upgraded my brain to Python or some other newer language. It hasn't happened
yet.

## Build the Microcode ROM

Before you can run any CSCvon8 CPU program, you first need to generate the
contents of the ALU rom, and also the microcode for the Decode ROM. To do
this, first make sure that these programs are executable:

```
    $ chmod +x cas clc disasm gen_alu gen_ucode
```

Now run the *Makefile* to generate both ROM's contents:

```
    $ make alu.rom ucode.rom
```

*gen_alu* generates the *alu.rom* file which has the contents of the ALU ROM.
*gen_ucode* reads the description of the microcode from the *microcode* file,
and creates two files: the Decode ROM itself, *ucode.rom* and a summary of the
high-level instructions in the file *opcodes*.

Now you can assemble one of the example programs:

```
    $ ./cas Examples/example05.s
```

This will assemble the source code and create the contents of the instruction
ROM, *instr.rom*.

To run this assembled program with the Verilator version of the CPU, just
run *make*:

```
    $ make
```

Assuming that you have Icarus Verilog installed, you should see this output:

```
    vvp icarus_tb.out
    VCD info: dumpfile test.vcd opened for output.
     !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
```

The line with all the printable ASCII characters is the output from the
*example05.s* assembly program.

## Using the Perl Simulator

Once you have assembled a program to create the *instr.rom*, you can run
this program with the Perl simulator of the CPU:

```
    $ ./csim
     !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
```

## What to Read Next?

I would recommend:

  * [the *cas* assembler manual](cas_assembler.md)
  * [the *clc* compiler manual](clc_compiler.md)
  * [the overview of the CSCvon8 architecture](CSCvon8_design.md)
