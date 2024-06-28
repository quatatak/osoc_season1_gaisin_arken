module arithmetic(input wire[15:0] in_a, input wire[15:0] in_b, input wire cin, input wire[3:0] sel, output wire[15:0] ArOut, output wire cout, output wire compare);
	always_comb begin
		case(sel)
			4'b0000:ArOut = in_a;
			4'b0001:ArOut = in_a + in_b;
			4'b0010:ArOut = in_a + ~in_b;
			4'b0011:ArOut = ~1'b1+1'b1;
			4'b0100:ArOut = in_a | (in_a&~in_b);
			4'b0101:ArOut = (in_a|in_b) + (in_a&~in_b);
			4'b0110:ArOut = in_a +(~in_b+1'b1)+1'b1;
			4'b0111:ArOut = (in_a&~in_b)+1'b1;
			4'b1000:ArOut = in_a + in_a&in_b;
			4'b1001: ArOut = in_a + in_b;
			4'b1010: ArOut = (in_a|~in_b)+(in_a&in_b);
			4'b1011:ArOut = (in_a&in_b)+1'b1;
			4'b1100:ArOut = in_a+in_a;
			4'b
			default:"ERROR: No such operation";
		endcase
	end
endmodule
