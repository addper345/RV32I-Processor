module PC(input logic[31:0] PCNext, 
			 input logic CLK, Reset,
			 output logic[31:0] PCCur);
	always_ff @(posedge CLK or posedge Reset)
		begin
			if(Reset) PCCur <= '0;
			else PCCur <= PCNext;
		end
endmodule