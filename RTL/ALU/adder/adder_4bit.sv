module adder_4bit(input logic[3:0] a, b,
						input logic cin,
						output logic[3:0] out,
						output logic cout);
	logic cout0, cout1, cout2;
	full_adder add0(a[0], b[0], cin, out[0], cout0);
	full_adder add1(a[1], b[1], cout0, out[1], cout1);
	full_adder add2(a[2], b[2], cout1, out[2], cout2);
	full_adder add3(a[3], b[3], cout2, out[3], cout);
endmodule
						