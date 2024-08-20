module ALU (SrcA,SrcB,ALUControl,ALUResult,Zero);
//IO Ports
input [31:0] SrcA,SrcB;
input [2:0] ALUControl;
output reg [31:0] ALUResult;
output reg Zero;
//Functionality
always @(*) begin
	case(ALUControl)
		3'b010: ALUResult=SrcA+SrcB;//Add
		3'b110: ALUResult=SrcA-SrcB;//Subtract
		3'b000: ALUResult=SrcA&SrcB;//AND
		3'b001: ALUResult=SrcA|SrcB;//OR
		3'b111: ALUResult=(SrcA<SrcB)?1:0;//Set Less Than (SLT)
		default: ALUResult=0;
	endcase
	if (ALUResult==0) begin//(ALUResult==0) ==> (!ALUResult)
		Zero=1;
	end
	else begin
		Zero=0;
	end
	//Could also be calculated as : Zero = ~|(ALUResult)
end
endmodule