`include "uvm_macros.svh"

import uvm_pkg::*;
import alu_pkg::*;

module top;
  alu_if intf ();  //instantiated interface

  alu_module uut (.dif(intf));  //instance of the alu

  initial begin
    intf.clk = 0;
    forever #5 intf.clk = ~intf.clk;
  end

  initial begin
    //set
    uvm_config_db#(virtual alu_if)::set(null, "*", "alu_if", intf);
    uvm_top.finish_on_completion = 1;
    run_test("alu_test");
  end

endmodule
