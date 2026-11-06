module data_memory
	#(parameter N=8)
	(input logic[31:0] A, 
	 input logic[31:0] WD,
	input logic MemWrite, CLK,
	output logic[31:0] RD);
	
	logic[31:0] ram[2**N-1:0];
	assign RD = ram[A[N-1:0]];
	always_ff @(posedge CLK)
		if(MemWrite) ram[A[N-1:0]] <= WD;

endmodule