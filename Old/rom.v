// ROM component
// (c) 2019 Warren Toomey, GPL3

module rom (Address, Data, CS, OE);

  parameter AddressSize = 16;
  parameter WordSize = 8;
  parameter FileName = "data.rom";

  input  [AddressSize-1:0] Address;
  output [WordSize-1:0]    Data;
  input CS, OE;				// Active low

  reg [WordSize-1:0] Mem [0:(1<<AddressSize)-1];

  assign Data = (!CS && !OE) ? Mem[Address] : {WordSize{1'bz}};

  initial begin
    $readmemh(FileName, Mem);
  end

endmodule
