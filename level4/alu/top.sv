`include "uvm_macros.svh"

import uvm_pkg::*;
import alu_pkg::*;

module top;
  alu_interface intf ();  //instantiated interface

  alu_module uut (
      .in_a(),
      .in_b(),
      .select(),
      .carry_in(),
      .alu_out(),
      .carry_out(),
      .compare(),
      .dif(intf)
  );  //instance of the alu

  initial begin
    intf.clk = 0;
    forever #5 intf.clk = ~intf.clk;
  end

  initial begin
    //set
    uvm_config_db#(virtual alu_interface)::set(null, "*", "alu_interface", intf);
    uvm_top.finish_on_completion = 1;
    run_test("alu_test");
  end

endmodule
