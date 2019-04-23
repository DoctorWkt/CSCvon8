// Register File
// (c) 2019 Warren Toomey, GPL3

module registerfile(clk, WE, indata, inreg,
		    outdata1, outreg1, outdata2, outreg2);

  parameter RegBits = 3;	// Number of bits in the register selectors
  parameter WordSize = 8;	// Size in bits of each register

  input clk;              	  // Clock input
  input WE;             	  // Write enable (active low)
  input  [WordSize-1:0] indata;	  // Input data
  input  [RegBits-1:0]  inreg;	  // The register to write to
  output [WordSize-1:0] outdata1; // The value of the first register to output
  output [RegBits-1:0]  outreg1;  // The first register to output
  output [WordSize-1:0] outdata2; // The value of the second register to output
  output [RegBits-1:0]  outreg2;  // The second register to output

  // The set of 2^RegBits registers, each WordSize wide
  reg [WordSize-1:0] registers[(1<<RegBits)-1:0];

  // Output the values of both the out registers
  assign outdata1= registers[outreg1];
  assign outdata2= registers[outreg2];

  // Update one register when WE goes low
  always @(posedge clk) begin
    if (WE==0)
      registers[inreg] <= indata;
  end

endmodule
