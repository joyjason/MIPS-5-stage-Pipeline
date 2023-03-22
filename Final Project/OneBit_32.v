`timescale 1ns/1ns
module OneBit_32(cout, sum, dataA, dataB, cin, Binvert, control, less, set);
input dataA, dataB, less;
input cin, Binvert, set;
input [2:0] control;
output cout, sum;

wire bi,s;
wire e1, e2, e3; //e1=and e2=or  

reg temp[5:0] ;

xor(bi, dataB, Binvert);
and(e1, dataA, dataB);
or(e2, dataA, dataB);
FA totalfa(cout, s, dataA, bi, cin);

assign sum = (control == 3'b000)?e1: // AND
	     (control == 3'b001)?e2:  // OR
	     (control == 3'b010)?s:    // ADD
	     (control == 3'b110)?s:    // SUB
	     (control == 3'b111)?s:    // SLT
	      s;
assign set = s;

endmodule
