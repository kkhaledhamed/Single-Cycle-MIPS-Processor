module main_decoder (Opcode,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOp,Jump);
//IO Ports
input [5:0] Opcode;
output MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump;
output [1:0] ALUOp;
//Internal Signal
reg [8:0] control_signals ;
//Functionality
always @(*) begin
	case(Opcode) 
		6'b000000:control_signals=9'b110000100;//R-Type
		6'b100011:control_signals=9'b101001000;//Load Word (LW)
		6'b101011:control_signals=9'b0x101x000;//Store Word (SW)
		6'b000100:control_signals=9'b0x010x010;//Branch Equal (BEQ)
		6'b001000:control_signals=9'b101000000;//Add Immediate (addi)
		6'b000010:control_signals=9'b0xxx0xxx1;//J-Type (Jump)
		default:control_signals =9'bxxxxxxxxx; //Unprovided Case (9'bxxxxxxxxx = 9'bx)
	endcase
end
assign {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUOp,Jump} = control_signals;
endmodule