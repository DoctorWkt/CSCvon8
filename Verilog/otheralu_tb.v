module othertb_alu;
 reg[7:0] A,B;
 reg[4:0] ALUop;
 wire[7:0] result;
 wire carry;
 wire zero;
 wire negative;
 integer op, a, b;

 otheralu test_unit(A,B,ALUop,result,carry,zero,negative);

  initial begin
    // $dumpfile("test.vcd");
    // $dumpvars(0, othertb_alu);

  ALUop=0;
  for (op=0;op<=31;op=op+1) begin
    A=0;
    for (a=0;a<=255;a=a+1) begin
      B=0;
      for (b=0;b<=255;b=b+1) begin
        #1;
	$display("Op:%d A:%x B:%x res:%x NZC:%b%b%b",ALUop,A,B,result,negative,zero,carry);
        B=B+1;
      end
      A=A+1;
    end
    ALUop=ALUop+1;
  end
  end
      
endmodule
