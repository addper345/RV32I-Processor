module CLA_block_4bit(input logic[3:0] a, b,
							 input logic cin,
							 output logic cout);
							 
	logic[3:0] garray, parray;
	logic p, g;
	assign garray = a&b;
	assign parray = a|b;
	assign g = garray[3]|(parray[3]&(garray[2]|parray[2]&(garray[1]|(parray[1]&garray[0]))));
	assign p = &parray;
	assign cout = g|(p&cin);
endmodule