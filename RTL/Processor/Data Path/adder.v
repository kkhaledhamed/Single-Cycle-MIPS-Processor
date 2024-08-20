module adder (in0,in1,out);
//IO Ports
input [31:0] in0,in1;
output [31:0] out;
//Functionality
assign out = in0 + in1 ;
endmodule