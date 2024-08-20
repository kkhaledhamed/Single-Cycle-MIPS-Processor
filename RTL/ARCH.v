module ARCH (clk,rst,WriteData,DataAddress);
//IO Ports
input clk,rst;
output [31:0] WriteData,DataAddress;
//Internal Signals
wire MemWrite ;
wire [31:0] PC, ReadData , Instr;
//Functionality --> Instantiations of Processor and Memories
MIPS PROCESSOR (.clk(clk),.rst(rst),.ReadData(ReadData),.Instr(Instr),.ALUResult(DataAddress),.WriteData(WriteData),.MemWrite(MemWrite),.PC(PC));
instruction_memory INSTRUCTION_MEMORY (.A(PC[7:2]),.RD(Instr));
data_memory DATA_MEMORY (.clk(clk),.A(DataAddress),.WD(WriteData),.WE(MemWrite),.RD(ReadData));
endmodule