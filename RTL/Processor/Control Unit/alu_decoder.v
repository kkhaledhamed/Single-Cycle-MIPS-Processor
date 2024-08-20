module alu_decoder (ALUOp,Funct,ALUControl);
//IO Ports
input [5:0] Funct;
input [1:0] ALUOp;
output reg [2:0] ALUControl;
//Functionality
always @(*) begin
	casex(ALUOp)
		2'b00:ALUControl=3'b010;//Add
		2'b01:ALUControl=3'b110;//Subtract
		2'b1x:begin//R-Type , (2'b1x ==> 2'b10 , 2'b11)
			case(Funct)
				6'b100000:ALUControl=3'b010;//Add
				6'b100010:ALUControl=3'b110;//Subtract
				6'b100100:ALUControl=3'b000;//AND
				6'b100101:ALUControl=3'b001;//OR
				6'b101010:ALUControl=3'b111;//Set Less Than (SLT)
				default:ALUControl=3'bxxx;//Unprovided Case (3'bxxx = 3'bx)
			endcase
		end
		default:ALUControl=3'bxxx;//Unprovided Case (3'bxxx = 3'bx)
	endcase
end
endmodule