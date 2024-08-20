module data_memory (clk,A,WD,WE,RD);
//IO Ports
input [31:0] A;//Write & Read Address
output [31:0] RD;//Output Register 32 (Word Size)
input clk ;//Input Clock
input WE;//Write Enable
input [31:0] WD;//Input Register
//RAM Memory
reg [31:0] RAM [63:0];
//Functionality
assign RD = RAM[A[31:2]];
always @(posedge clk) begin
	if (WE) begin
		RAM[A[31:2]]<=WD;
	end
end
endmodule