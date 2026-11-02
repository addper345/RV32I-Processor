module CLA_adder_32bit(input logic cin,
							  input logic[31:0] a, b,
							  output logic cout, 
							  output logic[31:0] out);
	logic cout0, cout1, cout2, cout3, cout4, cout5, cout6;
	
	CLA_block_4bit block1(a[3:0], b[3:0], cin, cout0);
	CLA_block_4bit block2(a[7:4], b[7:4], cout0, cout1);
	CLA_block_4bit block3(a[11:8], b[11:8], cout1, cout2);
	CLA_block_4bit block4(a[15:12], b[15:12], cout2, cout3);
	CLA_block_4bit block5(a[19:16], b[19:16], cout3, cout4);
	CLA_block_4bit block6(a[23:20], b[23:20], cout4, cout5);
	CLA_block_4bit block7(a[27:24], b[27:24], cout5, cout6);
	CLA_block_4bit block8(a[31:28], b[31:28], cout6, cout);
	
	adder_4bit add1(a[3:0], b[3:0], cin, out[3:0]);
	adder_4bit add2(a[7:4], b[7:4], cout0, out[7:4]);
	adder_4bit add3(a[11:8], b[11:8], cout1, out[11:8]);
	adder_4bit add4(a[15:12], b[15:12], cout2, out[15:12]);
	adder_4bit add5(a[19:16], b[19:16], cout3, out[19:16]);
	adder_4bit add6(a[23:20], b[23:20], cout4, out[23:20]);
	adder_4bit add7(a[27:24], b[27:24], cout5, out[27:24]);
	adder_4bit add8(a[31:28], b[31:28], cout6, out[31:28]);
endmodule