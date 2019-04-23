// RAM component
// (c) 2019 Warren Toomey, GPL3

module ram (clk, Address, InData, OutData, CS, WE, OE);

  parameter AddressSize = 16;
  parameter WordSize = 8;

  input clk;                    	// Clock input
  input  [AddressSize-1:0] Address;
  input  [WordSize-1:0]    InData;
  output [WordSize-1:0]    OutData;
  input CS, WE, OE;			// Active low control lines

  reg [WordSize-1:0] Mem [0:(1<<AddressSize)-1];

  // Initialise RAM to zero
  integer i;
  initial 
    for (i = 0; i < (1<<AddressSize)-1; i = i+1) 
      Mem[i] = {WordSize{1'b0}};

  assign OutData = (!CS && !OE) ? Mem[Address] : {WordSize{1'bz}};

  always @(posedge clk) begin
    if (!CS && !WE) begin
      Mem[Address] <= InData;
    end

    if (!WE && !OE)
      $display("ram error: both OE & WE active");
  end

endmodule
