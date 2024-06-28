module logic(input wire[15:0] in_a, input wire[15:0] in_b, input wire[3:0] sel, output wire[15:0] lout);
	always_comb begin
		case(sel)
			4'b0000:lout = ~in_a;
                        4'b0001:lout = ~(in_a | in_b);
                        4'b0010:lout = ~in_a & in_b;
                        4'b0011:lout = (1'b1<1'b1);
                        4'b0100:lout = in_a & ~in_b;
                        4'b0101:lout = ~in_b;
                        4'b0110:lout = in_a^in_b;
			4'b0111:lout = (in_a&~in_b);
                        4'b1000:lout = ~in_a | in_b;
                        4'b1001: lout = ~(in_a ^ in_b);
                        4'b1010: lout = in_b;
                        4'b1011:lout = in_a&in_b;
                        4'b1100:lout = in_a==in_a;
                        4'b1101:lout = in_a & (~in_b);
			4'b1110:lout = in_a|in_b;
			4'b1111:lout = in_a	
		endcase
	end
endmodule
