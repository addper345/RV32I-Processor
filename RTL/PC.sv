module PC(input logic[31:0] PCNext, 
			 input logic CLK,
			 output logic[31:0] PCCur);
	always_ff @(posedge CLK)
		PCCur <= PCNext;
endmodule