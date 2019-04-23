// ROM component
// (c) 2019 Warren Toomey, GPL3

module rom (Address, Data, CS_bar, OE_bar);

  parameter AddressSize = 16;
  parameter WordSize = 8;
  parameter Filename= "data.rom";
  parameter DELAY_RISE = 45;
  parameter DELAY_FALL = 45;

  input  [AddressSize-1:0] Address;
  inout  [WordSize-1:0]    Data;
  input CS_bar, OE_bar;

  reg [WordSize-1:0] Mem [0:(1<<AddressSize)-1];

  // Initialise ROM from file
  initial begin
    $readmemh(Filename, Mem);
  end

/* verilator lint_off ASSIGNDLY */
  assign #(DELAY_RISE, DELAY_FALL)
	Data = (!CS_bar && !OE_bar) ? Mem[Address] : {WordSize{1'bz}};
/* verilator lint_on ASSIGNDLY */

endmodule
