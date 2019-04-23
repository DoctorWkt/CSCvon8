// Simulation of UM245R UART
// (c) 2018 Warren Toomey, GPL3

module uart (
        input [7:0] data,	// Input data
	input TX		// Transmit control line, active low
  );

  // UART output
  always @(negedge TX) begin
    $write("%c", data);
  end

endmodule
