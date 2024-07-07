module adder16(input wire[15:0] in_a, input wire[15:0] in_b, input wire cin, output wire cout, output wire[15:0] out);
wire[16:0] cout_arr;
assign cout_arr[0] = cin;
genvar i;	
generate begin
	for(int i = 0;i<16;i++) begin
		adder add_i(.in_a(in_a[i]), .in_b(in_b[i]), .cin(cout_arr[i]), .cout(cout_arr[i+1]), .out(out[i]));
	end
endgenerate
endmodule
