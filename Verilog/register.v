// Register
// (c) 2019 Warren Toomey, GPL3

module register (clk, WE, data, result);

  parameter WordSize = 8;

  input clk;              	// Clock input
  input WE;             	// Write enable (active low)
  input  [WordSize-1:0] data;	// Input data
  output [WordSize-1:0] result;	// Register output

  // Result is a register, obviously
  reg [WordSize-1:0] internal_result=0;
  assign result= internal_result;

  always @(posedge clk) begin
    if (WE==0)
      internal_result <= data;
  end

endmodule
