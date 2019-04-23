// 8-bit Binary Counter with Input Register (3-State)
// (c) Warren Toomey, GPL3

/* verilator lint_off DECLFILENAME */
module ttl_74593 #(parameter WIDTH = 8, DELAY_RISE = 30, DELAY_FALL = 30)
(
  input G,
  input G_bar,
  input CCK,
  input CCKEN,
  input CCKEN_bar,
  input CLOAD_bar,
  input CCLR_bar,
  input RCK,
  input RCKEN_bar,
  output RCO_bar,
  output [WIDTH-1:0] Q,
  input [WIDTH-1:0] inQ
);

//------------------------------------------------//
reg [WIDTH-1:0] R;		// Register
reg [WIDTH-1:0] Cntr;		// Counter

wire RCO_current;
assign RCO_current= ~(&Q);	// Goes high when all of Q is zero

wire [WIDTH-1:0] Cntr_next;
assign Cntr_next = Cntr + 1;

always @(posedge CCK or negedge CLOAD_bar or negedge CCLR_bar or posedge RCK)
begin
  if (!CCLR_bar)
    Cntr <= {WIDTH{1'b0}};	// Reset the counter when CCLR_bar is low
  else if (!CLOAD_bar)
    Cntr <= R;			// Copy R -> counter when CLOAD_bar is low
  else if (CCK && (CCKEN && ~CCKEN_bar))
    Cntr <= Cntr_next;

				// Load R with the input on a rising RCK
				// when RCKEN_bar is low
  if (RCK && !RCKEN_bar)
    R <= inQ;
end

//------------------------------------------------//

				// Our Q output is valid only when
				// G is high, G_bar is low. Otherwise hi-Z
/* verilator lint_off ASSIGNDLY */
assign #(DELAY_RISE, DELAY_FALL) RCO_bar = RCO_current;
assign #(DELAY_RISE, DELAY_FALL) Q= (G && ~G_bar) ? Cntr : {WIDTH{1'bz}};
/* verilator lint_on ASSIGNDLY */

endmodule
/* verilator lint_on DECLFILENAME */
