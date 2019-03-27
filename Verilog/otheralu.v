// 8-bit ALU with 32 operations
// (c) 2019, Warren Toomey, GPL3
// Based on the FPGA4student ALU at
// https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html


module otheralu(A, B, ALUop, ALUresult, carry, zero, negative);

  input signed  [7:0] A,B;		// Input values to the ALU, signed
					// for the >>> operation below
  input         [4:0] ALUop;		// ALU operation
  output        [7:0] ALUresult;	// Result
  output carry;				// Carry flag
  output zero;				// Zero flag
  output negative;			// Negative flag

  reg  [8:0] int_result;		// We calculate a 9-bit internal result
  wire [8:0] intA= { 1'b0, A };		// using two 9-bit internal values
  wire [8:0] intB= { 1'b0, B };

  wire [3:0] Alow=  A[3:0];		// These hold the BCD digits, sums and
  wire [3:0] Blow=  B[3:0];		// carries used for the BCD operations
  wire [3:0] Ahigh= A[7:4];
  wire [3:0] Bhigh= B[7:4];
  reg  [3:0] lowSum;
  reg  [3:0] highSum;
  reg  [3:0] lowBCDcarry;
  reg        highBCDcarry;

  assign ALUresult= int_result[7:0];	// Get the 8-bit result
  assign negative= ALUresult[7];	// Determine the three flags
					// The carry is the ninth bit
					// from any addition/subtraction
					// or the BCD carry from the BCD
					// operations
  assign carry= (ALUop < 30) ? int_result[8] : highBCDcarry;

					// Zero if the result is 0, but flip
					// the bit for the special ALUop 12
  wire realzero= (ALUresult==0) ? 1 : 0;
  assign zero=   (ALUop==12)    ? ~realzero : realzero;

  wire [15:0] dblA= {A, A};		// For rotates, build a doubled A
  wire [3:0]  selB= B[3:0];		// and part of B for the shift value

					// Calculate a 16-bit multiply result
					// because we need the high byte
  wire [15:0] mulResult= { 8'd0, A } * { 8'd0, B };

  always @(*) begin
    case(ALUop)
       0: int_result= 0;
       1: int_result= intA;
       2: int_result= intB;
       3: int_result= -intA;
       4: int_result= -intB;
       5: int_result= intA+1;
       6: int_result= intB+1;
       7: int_result= intA-1;
       8: int_result= intB-1;
       9: int_result= intA+intB;
      10: int_result= intA+intB+1;
      11: int_result= intA-intB;
      12: int_result= intA-intB;			// Special, see above
      13: int_result= intB-intA;
      14: int_result= intA-intB-1;
      15: int_result= intB-intA-1;
      16: int_result= { 1'b0, mulResult[  7: 0 ] };	// Low byte  A*B
      17: int_result= { 1'b0, mulResult[ 15: 8 ] };	// High byte A*B
							// Return 0 when
							// dividing by zero
      18: int_result= (intB==0) ? 0 : intA/intB;
      19: int_result= (intB==0) ? 0 : intA%intB;
      20: int_result= intA<<intB;
      21: int_result= intA>>intB;			// Logical shift
      22: int_result= {1'b0, A>>>intB};			// Arithmetic shift 
							// Use A not intA to
							// keep the sign bit
							
      23: int_result= { 1'b0, dblA[ 8-selB+:8] };	// ROL
      24: int_result= { 1'b0, dblA[ selB+7-:8] };	// ROR
      25: int_result= intA&intB;
      26: int_result= intA|intB;
      27: int_result= intA^intB;
      28: int_result= { 1'b0, ~A };
      29: int_result= { 1'b0, ~B };
      30: begin						// BCD A+B
	    lowSum= Alow + Blow;
	    lowBCDcarry=0;
	    if (lowSum>9) begin
	      lowBCDcarry=1; lowSum= lowSum - 10;
	    end
	    highSum= Ahigh + Bhigh + lowBCDcarry;
	    highBCDcarry=0;
	    if (highSum>9) begin
	      highBCDcarry=1; highSum= highSum - 10;
	    end
	    int_result= { 1'b0, highSum, lowSum };
	  end
      31: begin						// BCD A-B
	    lowSum= Alow - Blow;
	    lowBCDcarry=0;
	    if (lowSum[3]) begin
	      lowBCDcarry=1; lowSum= lowSum + 10;
	    end
	    highSum= Ahigh - Bhigh - lowBCDcarry;
	    highBCDcarry=0;
	    if (highSum[3]) begin
	      highBCDcarry=1; highSum= highSum + 10;
	    end
	    int_result= { 1'b0, highSum, lowSum };
	  end
    endcase
  end

endmodule
