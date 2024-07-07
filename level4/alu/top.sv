`include "uvm_macros.svh"

import uvm_pkg::*;

module top();
	alu_interface intf();//instantiated interface
	
	alu_module uut();//instance of the alu
	
	initial begin
		//set
		uvm_config_db #(virtual alu_interface)::set(null, "*", "intf", intf);
	end

	initial begin
		run_test("alu_test");
	end

endmodule
