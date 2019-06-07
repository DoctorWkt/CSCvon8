// TTL version of the CSCvon8 CPU
// (c) 2019 Warren Toomey, GPL3

`default_nettype none
`include "tbhelper.v"
`include "74138.v"
`include "74139.v"
`include "74161.v"
`include "74151.v"
`include "74574.v"
`include "74593.v"
`include "ram.v"
`include "rom.v"
`include "uart.v"

module ttlcsvon8 (i_clk, reset, PCval);

  parameter AddressSize = 16;
  parameter WordSize = 8;

  input                     i_clk;      // Clock signal
  input                     reset;      // Reset signal
  output [AddressSize-1:0]  PCval;	// PC's value

  wire #(5, 5) clk_bar= ~i_clk;		// Inverted clock signal. The reason
					// for this should be explained in an
					// external document. NOT gate #1.

  wire [WordSize-1:0]    databus;       // The value on the data bus
  wire [WordSize-1:0]    MEMresult;     // The value from memory
  wire [WordSize-1:0]    RAMresult;     // The value from RAM
  wire [WordSize-1:0]    ROMresult;     // The value from ROM
  wire [AddressSize-1:0] addressbus;    // The value on the address bus
  wire [AddressSize-1:0] controlbus;    // The values of the control lines
  wire [WordSize-1:0]    Aval;          // Output of A register
  wire [WordSize-1:0]    Bval;          // Output of B register
  wire [WordSize-1:0]    AHval;         // Output of AH register
  wire [WordSize-1:0]    ALval;         // Output of AL register
  wire [WordSize-1:0]    PChival;       // Current PC value
  wire [WordSize-1:0]    PCloval;       // Current PC value
  wire [2:0]		 LoadOp;	// Who is reading from the data bus
  wire [2:0]		 JumpOp;	// What type of jump operation
  wire [1:0]		 DbusOp;        // Who is writing to the data bus
  wire [4:0]		 ALUop;         // ALU operation

  assign PCval= { PChival, PCloval };

  wire       	uSreset;   	// Active low, reset the microsequencer
  wire		IRload;		// Active low, load the IR register
  wire          Aload;          // Active low, load the A register
  wire          Bload;          // Active low, load the B register
  wire          AHload;         // Active low, load the AH register
  wire          ALload;         // Active low, load the AL register
  wire		MEMload;        // Active low, load RAM from databus
  wire		IOload;         // Active low, send data to UART
  wire       	PCincr;         // Active high, increment the PC
  wire       	ARena;     	// Actve low, place AR on the address bus
  wire          MEMena;         // Active low, put memory value on data bus
  wire          ALUena;         // Active low, put ALU value on data bus

  // Decodeindex is the address going into the Decode ROM
  wire [WordSize-1:0]	IRval;		// Output from the instruction register
  wire [3:0] 		uSval;		// Current microsequence phase
  wire [WordSize-1+4:0] Decodeindex= { IRval, uSval };

  // Output from the Decode ROM
  assign uSreset= controlbus[15];	// Active low, reset the microsequencer
  assign PCincr=  controlbus[14];	// Active high, increment the PC
  assign ARena=   controlbus[13];	// Active low, put AR on the address bus
  assign JumpOp=  controlbus[12:10];	// If/how to jump the PC to the AR value
  assign DbusOp=  controlbus[9:8];	// Which device writes on the data bus
  assign LoadOp=  controlbus[7:5];	// Which device to load from the databus
  assign ALUop=   controlbus[4:0];	// The ALU operation to perform
  
  // Microsequencer
  wire uSeq_unused;
  ttl_74161 uSeq(reset, uSreset, 1'b1, 1'b1, 4'b0, i_clk, uSeq_unused, uSval);

  // The Decode ROM
  rom #(.AddressSize(12), .WordSize(AddressSize), .Filename("ucode.rom"))
        Decoder(Decodeindex, controlbus, 1'b0, 1'b0);

  // Memory
  // ROM is mapped to the low 32K of memory, RAM is the upper 32K
  // Use ROMselect, active low, to select the ROM and not the RAM.
  // We need an inverted version for the RAM select.
  wire	       ROMselect=  addressbus[15];	// NOT gate #2
  wire #(5, 5) RAMselect= ~addressbus[15];

  rom #(.AddressSize(15), .Filename("instr.rom"),
	.DELAY_RISE(150), .DELAY_FALL(150))
        ROM(addressbus[14:0], ROMresult, ROMselect, MEMena);

  ram #(.AddressSize(15))
        RAM(addressbus[14:0], databus, RAMselect, MEMload, MEMena, RAMresult);

  // I can't get the MEMresult to work when connected to ROM and RAM
  // so I'm using a multiplexer for now. We also have to deal with high-z.
  assign MEMresult= (ROMselect===1'bz || ROMselect===1'b0)
						? ROMresult : RAMresult;

  // Databus reader demux
  // The i_clk input is used to drop the control line halfway through the clock
  // cycle. This allows the data bus load control lines to be asserted in
  // consecutive microinstructions. See the notes in the external documentation.
  /* verilator lint_off UNUSED */
  wire [7:0] dread_out;
  /* verilator lint_on UNUSED */
  ttl_74138 dbus_reader(i_clk, 1'b0, 1'b1, LoadOp, dread_out);

  // The active low values from the 74HCT138 need to be inverted
  // to be active high control lines for the 74HCT574.
  assign #(5, 5) IRload= ~dread_out[1];		// NOT gate #3
  assign #(5, 5) Aload=  ~dread_out[2];		// NOT gate #4
  assign #(5, 5) Bload=  ~dread_out[3];		// NOT gate #5
  assign 	 MEMload= dread_out[4];
  assign #(5, 5) AHload= ~dread_out[5];		// NOT gate #6
  assign #(5, 5) ALload= ~dread_out[6];		// NOT gate #7
  assign	 IOload=  dread_out[7];

  // Databus writer demux. Because the 74139 has two halves,
  // we have to pad out the msb of dwrite_in and dwrite_out.
  wire [3:0] dwrite_in= { 2'b0, DbusOp };
  /* verilator lint_off UNUSED */
  wire [7:0] dwrite_out;
  /* verilator lint_on UNUSED */
  assign MEMena= dwrite_out[0];
  assign ALUena= dwrite_out[1];
  ttl_74139 dbus_writer( {1'b0, 1'b0}, dwrite_in, dwrite_out);

  // Several registers that can load from the data bus
  ttl_74574 A(1'b0, Aload, databus, Aval);
  ttl_74574 B(1'b0, Bload, databus, Bval);
  ttl_74574 IR(1'b0, IRload & reset, databus, IRval);
  ttl_74574 AH(ARena, AHload, databus, AHval);
  ttl_74574 AL(ARena, ALload, databus, ALval);
  assign addressbus= { AHval, ALval };

  // The two PC components. We connect the carry from PClo to PChi.
  // The carry from PChi is unused. The PCload and PCload_bar are
  // enabled when the PC jumps, i.e. is loaded from the address register
  // AR. The clk_bar is used to increment the PC. It's complicated.
  // See the notes in the external documentation.
  wire PCcarry;
  wire PCunused;
  wire PCload;
  wire PCload_bar;
  ttl_74593 PClo(ARena, 1'b0, clk_bar, PCincr,
		 1'b1, PCload_bar, reset, clk_bar,
		 1'b0, PCcarry, PCloval, addressbus[7:0]);
  ttl_74593 PChi(ARena, 1'b0, PCcarry, 1'b0,
		 1'b0, PCload_bar, reset, clk_bar,
		 1'b0, PCunused, PChival, addressbus[15:8]);
  assign addressbus= PCval;

  // The ALU. This takes as inputs the ALUop from the decode ROM,
  // and the values from the A and B registers.
  /* verilator lint_off UNUSED */
  wire [AddressSize-1:0] ALUresult;
  /* verilator lint_on UNUSED */
  wire [20:0] ALUindex= { ALUop, Aval, Bval };
  rom #(.AddressSize(21), .WordSize(AddressSize), .Filename("alu.rom"))
        ALU(ALUindex, ALUresult, 1'b0, ALUena);

  // The Jump logic. We take as inputs the JumpOp from the decode ROM,
  // several active high status lines from the ALU, and two status lines
  // from the UART. In this version, the two UART lines are set low.

  wire DivByZero= ALUresult[12];	// Active high, ALU divided by zero
  wire Negative=  ALUresult[11];	// Active high, ALU result is negative
  wire Zero=      ALUresult[10];	// Active high, ALU result is zero
  wire Overflow=  ALUresult[9];		// Active high, ALU result has overflow
  wire Carry=     ALUresult[8];		// Active high, ALU result has a carry

  wire [7:0] jumpInput= { 1'b0, 1'b0, DivByZero, Negative,
			  Zero, Overflow, Carry, 1'b0 };
  ttl_74151 jumpLogic( i_clk, jumpInput, JumpOp, PCload, PCload_bar);

  // I can't get the databus to work when connected to the ALU and memory,
  // so I'm using a multiplexer for now.
  // There is a hard-coded UART input value for when DbusOp == 2'b10, as I
  // don't know how to read a keypress with no delay in Icarus under Linux.
  assign databus= (DbusOp == 2'b00) ? MEMresult :
		  (DbusOp == 2'b01) ? ALUresult[7:0] :
		  (DbusOp == 2'b10) ? 8'h3f : {WordSize{1'bz}};

  // UART. Output the data bus value when IOload goes low
  uart UART(databus, IOload);

endmodule
