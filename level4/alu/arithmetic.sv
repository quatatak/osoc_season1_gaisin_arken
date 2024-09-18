module arithmetic (
    logic [15:0] in_a,
    logic [15:0] in_b,
    logic cin,
    logic [3:0] sel,
    logic [15:0] ArOut,
    logic cout,
    logic compare
);
  assign compare = in_a == in_b;
  always_comb begin
    case (sel)
      4'b0000: {cout, ArOut} = {1'b0, in_a};
      4'b0001: {cout, ArOut} = {1'b0, in_a | in_b};
      4'b0010: {cout, ArOut} = {1'b0, in_a | ~in_b};
      4'b0011: {cout, ArOut} = {1'b0, ~1'b1 + 1'b1};
      4'b0100: {cout, ArOut} = {1'b0, in_a | (in_a & ~in_b)};
      4'b0101: {cout, ArOut} = {(in_a | in_b) + (in_a & ~in_b)};
      4'b0110: {cout, ArOut} = {in_a + (~in_b + 1'b1) + 1'b1};
      4'b0111: {cout, ArOut} = {(in_a & ~in_b) + 1'b1};
      4'b1000: {cout, ArOut} = {in_a + in_a & in_b};
      4'b1001: {cout, ArOut} = {in_a + in_b};
      4'b1010: {cout, ArOut} = {(in_a | ~in_b) + (in_a & in_b)};
      4'b1011: {cout, ArOut} = {(in_a & in_b) + 1'b1};
      4'b1100: {cout, ArOut} = {in_a + in_a};
      4'b1101: {cout, ArOut} = {(in_a | in_b) + in_a};
      4'b1110: {cout, ArOut} = {(in_a | ~in_b) + in_a};
      4'b1111: {cout, ArOut} = {in_a + 1'b1};
      default: ;
    endcase
  end
endmodule
