module instruction_memory (A,RD);
//IO Ports
input [5:0] A;//2^6 = 64 (Depth Size ,Number of registers)
output [31:0] RD;//32 (Word Size)
//RAM Memory
reg [31:0] RAM [63:0];
//Functionality
assign RD = RAM[A] ;
endmodule