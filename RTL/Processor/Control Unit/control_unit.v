module control_unit (Opcode,Funct,Zero,MemtoReg,MemWrite,ALUSrc,RegDst,RegWrite,Jump,PCSrc,ALUControl);
//IO Ports
input [5:0] Opcode,Funct;
output MemtoReg,MemWrite,ALUSrc,RegDst,RegWrite,PCSrc,Jump;
output [2:0] ALUControl;
input Zero;
//Internal Signals
wire [1:0] ALUOp;
wire Branch;
//Functionality --> Instantiations
main_decoder MainDecoder (.Opcode(Opcode),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.Branch(Branch),
						.ALUSrc(ALUSrc),.RegDst(RegDst),.RegWrite(RegWrite),.ALUOp(ALUOp),.Jump(Jump));
alu_decoder AluDecoder (.ALUOp(ALUOp),.Funct(Funct),.ALUControl(ALUControl));
//PC Source
assign PCSrc = Branch & Zero ;
endmodule