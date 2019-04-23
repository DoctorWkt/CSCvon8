// 8-input multiplexer; 3-state
// (c) Warren Toomey, GPL3

/* verilator lint_off DECLFILENAME */
module ttl_74251 #(parameter DELAY_RISE = 20, DELAY_FALL = 20)
(
  input Output_bar,
  input [7:0] I,
  input [2:0] S,
  output Y,
  output Y_bar
);

//------------------------------------------------//
wire internal_Y;
wire internal_Y_bar;

assign internal_Y = (S== 3'b000) ? I[0] :
		    (S== 3'b001) ? I[1] :
		    (S== 3'b010) ? I[2] :
		    (S== 3'b011) ? I[3] :
		    (S== 3'b100) ? I[4] :
		    (S== 3'b101) ? I[5] :
		    (S== 3'b110) ? I[6] : I[7];
assign internal_Y_bar= ~internal_Y;

//------------------------------------------------//

/* verilator lint_off ASSIGNDLY */
assign #(DELAY_RISE, DELAY_FALL) Y = (!Output_bar) ? internal_Y : 1'bz;
assign #(DELAY_RISE, DELAY_FALL) Y_bar = (!Output_bar) ? internal_Y_bar : 1'bz;
/* verilator lint_on ASSIGNDLY */

endmodule
/* verilator lint_on DECLFILENAME */
