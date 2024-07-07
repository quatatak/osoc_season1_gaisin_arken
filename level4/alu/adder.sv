module adder(input wire in_a, input wire in_b, input wire cin, output wire cout, output wire out);
	assign out = in_a^in_b^cin; 
	assign cout = (in_a&in_b)|((in_a^in_b)&cin);
endmodule
