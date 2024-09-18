module alu_module (
    alu_if dif
);
  always_comb begin
    if (mode == 1'b0) begin
      arithmetic a1 (
          .in_a(dif.in_a),
          .in_b(dif.in_b),
          .sel(dif.select),
          .ArOut(dif.out),
          .cout(dif.carry_out),
          .cin(dif.carry_in),
          .compare(dif.compare)
      );
    end else if (mode == 1'b1) begin
      log l1 (
          .in_a(dif.in_a),
          .in_b(dif.in_b),
          .out (dif.out),
          .sel (dif.select)
      );
    end
  end
endmodule
