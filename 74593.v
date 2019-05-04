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
reg prev_CLOAD_bar=1'b1;	// Previous CLOAD_bar value
reg prev_CCK=1'b1;		// Previous CCK value

wire RCO_current;
assign RCO_current= ~(&Q);	// Goes high when all of Q is zero

wire [WIDTH-1:0] Cntr_next;
assign Cntr_next = Cntr + 1;

				// As I'm driving some of the inputs from
				// a ROM, there are times when there is no
				// input for CLOAD_bar. I remember if there
				// was a real drop in CLOAD_bar to later
				// confirm a real rise in CLOAD_bar.
always @(negedge CLOAD_bar)
begin
  if (CLOAD_bar === 1'b0)
    prev_CLOAD_bar <= 1'b0;	// Save this value for next time
end

always @(posedge CLOAD_bar)
begin
  if (!CCLR_bar)
    Cntr <= {WIDTH{1'b0}};	// Reset the counter when CCLR_bar is low
  else if (prev_CLOAD_bar === 1'b0)
    Cntr <= R;			// Copy R -> counter when CLOAD_bar was low
  prev_CLOAD_bar <= 1'b1;	// Save this value for next time
end

always @(negedge CCK)
begin
  if (CCK === 1'b0)
    prev_CCK <= 1'b0;		// Save this value for next time
end

always @(posedge CCK)
begin
  if (!CCLR_bar)
    Cntr <= {WIDTH{1'b0}};	// Reset the counter when CCLR_bar is low
  else if (~prev_CCK && CCK && (CCKEN || ~CCKEN_bar))
    Cntr <= Cntr_next;		// Increment counter on rising CCK with
				// either enable lines in their correct state
  prev_CCK <= 1'b1;		// Save this value for next time
end

always @(posedge RCK)
begin
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
