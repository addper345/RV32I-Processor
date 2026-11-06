module instruction_memory
	#(parameter N = 8)
	(input logic[31:0] A,
	output logic[31:0] RD);
	
	logic[31:0] ram[2**N-1:0];
	initial begin
		$readmemh("instructions.mem", ram);
	end
	
	assign RD = ram[A[N-1:0]];
endmodule