// CSCvon8 8 CPU, verilog design
// (c) 2019 Warren Toomey, GPL3
//
// This is a functional implementation of the design, not an exact
// match of the 7400-series chips used in the hardware version

`include "counter.v"
`include "otheralu.v"
`include "ram.v"
`include "register.v"
`include "rom.v"
`include "uart.v"

module cscvon8 (i_clk, databus, controlbus, Aval, Bval, PCval, IRload);

  parameter AddressSize = 16;
  parameter WordSize = 8;

  input 		    i_clk;	// Clock signal
  output [WordSize-1:0]     databus;	// The value on the data bus
  output [AddressSize-1:0]  controlbus;	// The values of the control lines
					// Outputs of other internal lines.
					// Used for debugging and diagnostics
  output [WordSize-1:0]     Aval;	// Output of A register
  output [WordSize-1:0]     Bval;	// Output of B register
  output [AddressSize-1:0]  PCval;	// Current PC value
  output 		    IRload;	// Active low, load the IR register

					// Control lines from the decoder
  wire [4:0] ALUop=  controlbus[4:0];	// ALU operation
  wire [2:0] LoadOp= controlbus[7:5];	// Who is reading from the data bus
  wire [1:0] DbusOp= controlbus[9:8];	// Who is writing to the data bus
  wire [1:0] JumpOp= controlbus[11:10];	// What type of jump operation
					// Active low lines below
  wire        ARena= controlbus[12];	// Place AR on the address bus
  wire       PCincr= controlbus[13];	// Increment the PC
  wire      uSreset= controlbus[14];	// Reset the microsequencer
					// Line 15 unused and spare for now

  // We use several demuxes to split some of the control lines out
  // to individual lines. Below are active low data bus reader lines.
  // LoadOp == 3'b000 means nothing is loaded from the data bus.
  assign IRload=  (LoadOp == 3'b001) ? 0 : 1;
  wire Aload=     (LoadOp == 3'b010) ? 0 : 1;
  wire Bload=     (LoadOp == 3'b011) ? 0 : 1;
  wire MEMload=   (LoadOp == 3'b100) ? 0 : 1;
  wire AHload=    (LoadOp == 3'b101) ? 0 : 1;
  wire ALload=    (LoadOp == 3'b110) ? 0 : 1;
  wire IOload=    (LoadOp == 3'b111) ? 0 : 1;

  // ROM is mapped to the low 32K of memory, RAM is the upper 32K
  wire [AddressSize-1:0]  addressbus;	// Address sent to memory
  wire [WordSize-1:0]     ROMresult;
  wire [WordSize-1:0]     RAMresult;

  // Do the mapping, active low. Multiplex the output from both
  wire ROMselect= (addressbus[15]==0) ? 0 : 1;
  wire [WordSize-1:0] MEMresult= (ROMselect==0) ? ROMresult : RAMresult;

  // Values that can be loaded onto the data bus as well as MEMresult.
  wire [WordSize-1:0] ALUresult;
  /* verilator lint_off UNDRIVEN */
  wire [WordSize-1:0] UARTresult;
  /* verilator lint_on UNDRIVEN */

  // Multiplex a value onto the data bus
  assign databus= (DbusOp == 2'b00) ? MEMresult : 
		  (DbusOp == 2'b01) ? ALUresult : 
		  (DbusOp == 2'b10) ? UARTresult : {WordSize{1'bz}};

  // Also create an active low enable line for the memory
  wire MEMena= (DbusOp == 2'b00) ? 0 : 1;

  // Flags values from the ALU output, active low
  wire ALUcarry;			// These ones are active high
  wire ALUzero;				// so we need to negate them
  wire ALUnegative;
  wire carry = ~ALUcarry;
  wire zero = ~ALUzero;
  wire negative = ~ALUnegative;

  // Determine if we should jump the PC to a new value, active low
  wire PCload = (JumpOp==2'b01) ? carry :
	        (JumpOp==2'b10) ? zero :
	        (JumpOp==2'b11) ? negative : 1;	// Never jump on 2'b00

  // Values from registers that we will use for the address bus
  wire [WordSize-1:0]    AHval;
  wire [WordSize-1:0]    ALval;
  wire [AddressSize-1:0] PCval;

  // Calculate the value on the address bus: the AR or the PC
  assign addressbus= (ARena==1'b0) ? { AHval, ALval } : PCval;

  // The IR value gets combined with the output of the microsequencer
  // to be the lookup value for the instruction decoder
  wire [WordSize-1:0] IRval;
  wire [3:0] uSval;
  wire [WordSize-1+4:0] Decodeindex= { IRval, uSval };

  // Components
  // On the address bus
  counter  PC(i_clk, PCload, PCincr, addressbus, PCval);
  register AH(i_clk, AHload, databus, AHval);
  register AL(i_clk, ALload, databus, ALval);

  // On the data bus
  register A(i_clk, Aload, databus, Aval);
  register B(i_clk, Bload, databus, Bval);
  register IR(i_clk, IRload, databus, IRval);

  // Instruction decode
  counter #(.WordSize(4)) uSequencer(i_clk, uSreset, 1'b0, 4'b0000, uSval);
  rom #(.AddressSize(12), .WordSize(AddressSize), .FileName("ucode.rom"))
        Decoder(Decodeindex, controlbus, 1'b0, 1'b0);

  // Memory and UART
  ram #(.AddressSize(15))
	RAM(i_clk, addressbus[14:0], databus, RAMresult, 1'b0, MEMload, MEMena);
  rom #(.AddressSize(15), .FileName("instr.rom"))
	ROM(addressbus[14:0], ROMresult, 1'b0, 1'b0);
  uart UART(i_clk, databus, IOload);

  // The ALU
  otheralu ALU(Aval, Bval, ALUop, ALUresult, ALUcarry, ALUzero, ALUnegative);

endmodule
