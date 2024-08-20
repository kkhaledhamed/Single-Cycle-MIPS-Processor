module shift_left_by2 (in,out_shifted);
//IO Ports
input [31:0] in;
output [31:0] out_shifted;
//Functionality
assign out_shifted = in<<2 ;// (in<<2) ==> {in[29:0],2'b00}
endmodule