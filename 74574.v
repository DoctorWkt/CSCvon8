// Octal Transparent D-type Flip-Flops with 3-state Output
// (c) Warren Toomey, GPL3

/* verilator lint_off DECLFILENAME */
module ttl_74574 #(parameter WIDTH = 8, DELAY_RISE = 7, DELAY_FALL = 7)
(
  input Output_bar,
  input clk,
  input [WIDTH-1:0] D,
  output [WIDTH-1:0] Q
);

//------------------------------------------------//
reg [WIDTH-1:0] Q_current=0;

always @(posedge clk)
  Q_current <= D;

//------------------------------------------------//

/* verilator lint_off ASSIGNDLY */
assign #(DELAY_RISE, DELAY_FALL) Q = (!Output_bar) ? Q_current : {WIDTH{1'bz}};
/* verilator lint_on ASSIGNDLY */

endmodule
/* verilator lint_on DECLFILENAME */
