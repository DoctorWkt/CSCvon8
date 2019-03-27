// Counter
// (c) 2019 Warren Toomey, GPL3

module counter (clk, WE, IE, data, result);

  parameter WordSize = 16;

  input clk;				// Clock input
  input WE;				// Write to counter, active low
  input IE;				// Increment counter, active low
  input  [WordSize-1:0] data;		// Input data
  output [WordSize-1:0] result;		// Counter output

  // Output
  reg [WordSize-1:0] internal_result=0;
  assign result= internal_result;

  always @(posedge clk) begin
    if (WE==0)
    	internal_result <= data;
    else if (IE==0)
        internal_result <= internal_result + 1;
  end

endmodule
