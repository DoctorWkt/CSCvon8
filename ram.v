// RAM component
// (c) 2019 Warren Toomey, GPL3

module ram (Address, InData, CS_bar, WE_bar, OE_bar, OutData);

  parameter AddressSize = 16;
  parameter WordSize = 8;
  parameter Filename= "empty.ram";
  parameter DELAY_RISE = 55;
  parameter DELAY_FALL = 55;

  input  [AddressSize-1:0] Address;
  input  [WordSize-1:0]    InData;
  input CS_bar, WE_bar, OE_bar;
  output  [WordSize-1:0]   OutData;

  reg [WordSize-1:0] Mem [0:(1<<AddressSize)-1];

  // Initialise RAM to zero
  initial begin
    $readmemh(Filename, Mem);
  end

/* verilator lint_off ASSIGNDLY */
  assign #(DELAY_RISE, DELAY_FALL)
	OutData = (!CS_bar && !OE_bar) ? Mem[Address] : {WordSize{1'bz}};
/* verilator lint_on ASSIGNDLY */

  always @(negedge CS_bar or negedge WE_bar or negedge OE_bar) begin
    if (!CS_bar && !WE_bar) begin
      Mem[Address] <= InData;
      // $write("%x to address %x\n", InData, Address);
    end

    if (!WE_bar && !OE_bar)
      $display("ram error: both OE_bar & WE_bar active");
  end

endmodule
