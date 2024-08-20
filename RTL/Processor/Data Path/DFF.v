module DFF (clk,rst,d,q);
//Parameters
parameter WIDTH = 32;
//IO Ports
input [WIDTH-1:0] d;
input clk,rst;
output reg [WIDTH-1:0] q;
//Functionality
always @(posedge clk or posedge rst) begin
	if (rst) begin
		q<=0;		
	end
	else begin
		q<=d;
	end
end
endmodule