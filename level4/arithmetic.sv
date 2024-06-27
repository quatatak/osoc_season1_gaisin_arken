module arithmetic(input wire[15:0] in_a, input wire[15:0] in_b, input wire cin, input wire[3:0] sel);
	always_comb begin
		case(sel)
			default:"ERROR: No such operation";
		endcase
	end
endmodule
