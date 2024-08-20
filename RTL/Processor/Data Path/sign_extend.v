module sign_extend (in,extended);
//IO Ports 
input [15:0] in;
output [31:0] extended;
//Functionality
assign extended = {{16{in[15]}},in};
endmodule