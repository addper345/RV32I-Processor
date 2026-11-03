module ALU(input logic[31:0] a, b,
			  input logic[2:0] ALUControl,
			  output logic[31:0] result,
			  output logic[3:0] flags);
	logic cout;
	logic[31:0] and_r, or_r, b_op, sum, slt;
	assign b_op = ALUControl[0] ? ~b : b;
	
	CLA_adder_32bit add(ALUControl[0], a, b_op, cout, sum);
	assign flags[0] = ~(ALUControl[0]^a[31]^b[31])&(a[31]^sum[31])&(~ALUControl[1]);
	assign flags[1] = (~ALUControl[1])&cout;
	assign flags[2] = result[31];
	assign flags[3] = &(~result);
	assign slt = {{31{1'b0}}, flags[0]^sum[31]};
	
	always_comb
		case(ALUControl)
			3'b000: result = sum;
			3'b001: result = sum;
			3'b010: result = and_r;
			3'b011: result = or_r;
			3'b101: result = slt;
			default: result = '0;
		endcase
		
	
endmodule