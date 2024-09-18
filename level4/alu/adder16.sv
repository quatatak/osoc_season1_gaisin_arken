module adder16 (
    logic [15:0] in_a,
    logic [15:0] in_b,
    logic cin,
    logic cout,
    logic [15:0] out
);
  wire [16:0] cout_arr;
  assign cout_arr[0] = cin;
  genvar i;
  generate
    for (i = 0; i < 16; i++) begin
      adder add_i (
          .in_a(in_a[i]),
          .in_b(in_b[i]),
          .cin (cout_arr[i]),
          .cout(cout_arr[i+1]),
          .out (out[i])
      );
    end
  endgenerate
endmodule
