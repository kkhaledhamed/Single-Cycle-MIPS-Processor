module MIPS (clk,rst,ReadData,Instr,ALUResult,WriteData,MemWrite,PC);
//IO Ports
input clk,rst;
input [31:0] ReadData,Instr;
output [31:0] ALUResult,WriteData,PC;
output MemWrite;
//Internal Signals
wire MemtoReg,ALUSrc,RegDst,RegWrite,Jump,PCSrc;
wire [2:0] ALUControl;
wire Zero ;
//Functionality --> Instantiations
data_path DATA_PATH (.clk(clk),.rst(rst),.MemtoReg(MemtoReg),.ALUSrc(ALUSrc),.RegDst(RegDst),
					.RegWrite(RegWrite),.Jump(Jump),.PCSrc(PCSrc),.ALUControl(ALUControl),.Zero(Zero),
					.ReadData(ReadData),.Instr(Instr),.ALUResult(ALUResult),.WriteData(WriteData),.PC(PC));
control_unit CONTROL_UNIT (.Opcode(Instr[31:26]),.Funct(Instr[5:0]),.Zero(Zero),.MemtoReg(MemtoReg),.MemWrite(MemWrite),
						   .ALUSrc(ALUSrc),.RegDst(RegDst),.RegWrite(RegWrite),.Jump(Jump),.PCSrc(PCSrc),.ALUControl(ALUControl));
endmodule