`include "uvm_macros.svh"
package alu_pkg;
  import uvm_pkg::*;

  class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

  endclass

  class alu_test extends uvm_test;
    `uvm_component_utils(alu_test)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      m_env = alu_env::type_id::create("m_env", this);
    endfunction

    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      phase.drop_objection(this);
    endtask
  endclass
endpackage : alu_pkg
