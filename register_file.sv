module register_file(input logic[4:0] A1, A2, A3,
							input logic[31:0] WD3,
							input logic WE3, CLK,
							output logic[31:0] RD1, RD2);

	logic[31:0][31:0] regs;
	
	assign RD1 = (A1 == 0) ? 0 : regs[A1];
	assign RD2 = (A2 == 0) ? 0 : regs[A2];
	
	always_ff @(posedge CLK)
		begin
			if(WE3) regs[A3] <= WD3;
		end
	
	
endmodule