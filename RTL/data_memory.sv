module data_memory
	#(parameter N=32)
	(input logic[N-1:0] A, 
	 input logic[31:0] WD,
	input logic MemWrite, CLK,
	output logic[31:0] RD);
	
	logic[31:0] ram[2**N-1:0];
	assign RD = ram[A];
	always_ff @(posedge CLK)
		if(MemWrite) ram[A] <= WD;

endmodule