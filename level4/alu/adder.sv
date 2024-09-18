module adder (
    logic in_a,
    logic in_b,
    logic cin,
    logic cout,
    logic out
);
  assign out  = in_a ^ in_b ^ cin;
  assign cout = (in_a & in_b) | ((in_a ^ in_b) & cin);
endmodule
