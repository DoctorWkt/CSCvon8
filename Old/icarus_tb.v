`include "cscvon8.v"
module icarus_tb();

  parameter AddressSize = 16;
  parameter WordSize = 8;

  // Declare inputs as regs and outputs as wires
  reg clk;
  reg [AddressSize-1:0]  oldPCval=5;

  wire [WordSize-1:0]     databus;    // The value on the data bus
  wire [AddressSize-1:0]  controlbus; // The values of the control lines
  wire [WordSize-1:0]     Aval;       // Output of A register
  wire [WordSize-1:0]     Bval;       // Output of B register
  wire [AddressSize-1:0]  PCval;      // Current PC value
  wire 			  IRLoad;     // Active low, load the IR register

// Initialize all variables
initial begin        
  $dumpfile("test.vcd");
  $dumpvars(0, icarus_tb);
  clk = 0;       	// initial value of clk
  //#8000 $finish;      // Terminate simulation
end

// Clock generator
always begin
  #1 clk = ~clk; 	// Toggle clk every tick
end

// Stop if we jump back to our old PC value
// when we re-load the instruction register
always @(posedge clk) begin
  if (IRload == 0) begin
    if (oldPCval == PCval) begin
      $finish;
    end
  oldPCval <= PCval;
  end
end

// Connect DUT to test bench
cscvon8 DUT(clk, databus, controlbus, Aval, Bval, PCval, IRload);

endmodule
