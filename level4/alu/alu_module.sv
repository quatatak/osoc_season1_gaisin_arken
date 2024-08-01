module alu_module(input wire carry_in,
    input wire[15:0] in_a,
    input wire[15:0] in_b,
    input wire[3:0] select,
    input wire mode,
    output wire[15:0] alu_out,
    output wire carry_out,
    output wire compare);
    always_comb begin
        if (mode == 1'b0) begin
            arithmetic a1(.in_a(in_a),
                .in_b(in_b),
                .sel(select),
                .out(alu_out),
                .cout(carry_out),
                .sel(select),
                .cin(carry_in),
                .compare(compare));
        end
        else if (mode == 1'b1 ) begin
            logic l1(.in_a(in_a), .in_b(in_b), .out(alu_out), .sel(select));
        end
    end
endmodule
