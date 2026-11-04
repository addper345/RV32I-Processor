module control_unit(input logic[6:0] op,
						  input logic[2:0] funct3,
						  input logic funct7_5, Zero,
						  output logic PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite,
						  output logic[2:0] ALUControl,
						  output logic[1:0] ImmSrc);
	logic Branch;
	logic[1:0] ALUOp;
	always_comb
		begin
			case(op)
				7'b0000011: begin RegWrite=1'b1;
					ImmSrc=2'b00;
					ALUSrc=1'b1;
					MemWrite=1'b0;
					ResultSrc=1'b1;
					Branch=1'b0;
					ALUOp=1'b00;
				end
				7'b0100011: begin RegWrite=1'b0;
					ImmSrc=2'b01;
					ALUSrc=1'b1;
					MemWrite=1'b1;
					ResultSrc=1'b0;
					Branch=1'b0;
					ALUOp=1'b00;
				end
				7'b0110011: begin RegWrite=1'b1;
					ImmSrc=2'b00;
					ALUSrc=1'b0;
					MemWrite=1'b0;
					ResultSrc=1'b0;
					Branch=1'b0;
					ALUOp=2'b10;
				end
				7'b1100011: begin RegWrite=1'b0;
					ImmSrc=2'b10;
					ALUSrc=1'b0;
					MemWrite=1'b0;
					ResultSrc=1'b0;
					Branch=1'b1;
					ALUOp=2'b01;
				end
				default: begin RegWrite=1'b0;
					ImmSrc=2'b10;
					ALUSrc=1'b0;
					MemWrite=1'b0;
					ResultSrc=1'b0;
					Branch=1'b1;
					ALUOp=2'b01;
				end
			endcase
			
			case(ALUOp)
				2'b00: ALUControl = 3'b000;
				2'b01: ALUControl = 3'b001;
				2'b10: begin
					case(funct3)
						3'b000: begin
							if({op[5], funct7_5}==2'b11) ALUControl = 3'b001;
							else ALUControl = 3'b000;
						end
						3'b010: ALUControl = 3'b101;
						3'b110: ALUControl = 3'b011;
						3'b111: ALUControl = 3'b010;
						default: ALUControl = '0;
					endcase
					end
				default: ALUControl = '0;
			endcase
		end
	
						
endmodule
						  