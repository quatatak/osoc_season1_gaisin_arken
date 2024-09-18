interface alu_if;

  logic clk, carry_in, mode, compare, carry_out;
  //input_1
  logic [15:0] in_a;
  //input_2
  logic [15:0] in_b;
  //output
  logic [15:0] out;
  logic [ 3:0] select;

endinterface
