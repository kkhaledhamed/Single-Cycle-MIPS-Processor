module register_file (clk,WE3,A1,A2,A3,WD3,RD1,RD2);
//IO Ports
input clk,WE3;
input [4:0] A1,A2;//Read Addresses --> 2^5 = 32 (Depth Size ,Number of registers)
input [4:0] A3;//Write Address --> 2^5 = 32 (Depth Size ,Number of registers)
input [31:0] WD3;//Input Register --> 32 (Word Size)
output [31:0] RD1,RD2;//Output Registers
//Register File Body , Three ported register file
reg[31:0] RegFile [31:0] ;
//Functionality
always @(posedge clk) begin
	if (WE3) begin
		RegFile[A3]<=WD3;//Write third port on rising edge of clock
	end
end
// read two ports combinationally
// register 0 hardwired to 0
assign RD1 = (A1!=0) ? RegFile[A1] : 0;
assign RD2 = (A2!=0) ? RegFile[A2] : 0;
endmodule