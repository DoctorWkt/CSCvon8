// 3-line to 8-line decoder/demultiplexer (inverted outputs)
// (c) Tim Rudy, GPL3

/* verilator lint_off DECLFILENAME */
module ttl_74138 #(parameter WIDTH_OUT = 8, WIDTH_IN = $clog2(WIDTH_OUT),
					DELAY_RISE = 21, DELAY_FALL = 21)
(
  input Enable1_bar,
  input Enable2_bar,
  input Enable3,
  input [WIDTH_IN-1:0] A,
  output [WIDTH_OUT-1:0] Y
);

//------------------------------------------------//
reg [WIDTH_OUT-1:0] computed;
integer i;

always @(*)
begin
  for (i = 0; i < WIDTH_OUT; i++)
  begin
/* verilator lint_off WIDTH */
    if (!Enable1_bar && !Enable2_bar && Enable3 && i == A)
/* verilator lint_on WIDTH */
      computed[i] = 1'b0;
    else
      computed[i] = 1'b1;
  end
end
//------------------------------------------------//

/* verilator lint_off ASSIGNDLY */
assign #(DELAY_RISE, DELAY_FALL) Y = computed;
/* verilator lint_on ASSIGNDLY */

endmodule
/* verilator lint_on DECLFILENAME */
