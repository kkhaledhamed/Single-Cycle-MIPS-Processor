module MUX (in0,in1,sel,out);
//Parameters
parameter WIDTH = 32;
//IO Ports
input [WIDTH-1:0] in0,in1;
input sel;
output [WIDTH-1:0] out;
//Functionality
assign out = (sel) ? in1 : in0 ;
endmodule