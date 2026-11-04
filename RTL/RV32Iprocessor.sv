module RV32Iprocessor(input logic CLK, output logic debug);

	logic RegWrite, ALUSrc, MemWrite, ResultSrc, PCSrc;
	logic[31:0] PCCur, PCNext, Instr, Result, SrcA, SrcB, RegB, ALUResult, Debug, 
				ImmExt, PCPlus4, PCTarget, WriteData, ReadData;
	logic[2:0] ALUControl;
	logic[3:0] Flags; //{N, Z, C, V}
	logic[1:0] ImmSrc;
	
	assign WriteData = RegB;
	assign Debug = SrcA;
	assign SrcB = ALUSrc ? ImmExt : RegB;
	assign Result = ResultSrc ? ReadData : ALUResult;
	
	
	assign PCTarget = PCCur+ImmExt;
	assign PCPlus4 = PCCur+4;
	assign PCNext = PCSrc ? PCTarget : PCPlus4; 
	PC program_counter(PCNext, CLK, PCCur);
	
	control_unit control_unit(Instr[6:0], Instr[14:12], Instr[30], Flags[2], 
		PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite, ALUControl, ImmSrc);
	
	instruction_memory instruction_memory(PCCur, Instr);
	register_file register_file(Instr[19:15], Instr[24:20], Instr[11:7], Result, RegWrite, CLK, SrcA, RegB);
	ALU alu(SrcA, SrcB, ALUControl, ALUResult, Flags);
	extend extend(Instr, ImmSrc, ImmExt);
	data_memory data_memory(ALUResult, WriteData, MemWrite, CLK, ReadData);
endmodule

