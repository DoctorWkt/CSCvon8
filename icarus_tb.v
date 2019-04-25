// Testbed for the CSCvon8 CPU
// (c) Warren Toomey, GPL3

`timescale 1ns/1ps
`default_nettype none
`include "ttlcsvon8.v"

module icarus_tb();

  parameter AddressSize = 16;
  parameter WordSize = 8;
  parameter HalfClock = 230;		// Half a clock cycle in nS

  reg clk= 0;
  reg reset= 0;
  reg [3:0] counter=0;
  wire [AddressSize-1:0]  PCval;        // Current PC value

  // Initialize all variables
  initial begin        
    $dumpfile("test.vcd");
    $dumpvars(0, icarus_tb);
    // #44000 $finish;      // Terminate simulation
  end

  // Clock generator
  always begin
    #HalfClock clk = ~clk; // Toggle clk every HalfClock to make a full cycle
  end
  
  always @(posedge clk or negedge clk) begin
    if (counter > 4'h8)
      reset= 1;
    else
      counter <= counter + 1;
  end

  // Stop if we have jumped to location $FFFF
  always @(negedge clk) begin
    if (PCval == 16'hFFFF) begin
      $finish;
    end
  end

  // Connect DUT to test bench
  ttlcsvon8 DUT(clk, reset, PCval);

endmodule
