module PC(input logic PCNext, CLK,
			 output logic PCCur);
	always_ff @(posedge CLK)
		PCCur <= PCNext;
endmodule