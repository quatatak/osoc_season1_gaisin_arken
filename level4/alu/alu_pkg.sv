`include "uvm_macros.svh"
package alu_pkg;
  import uvm_pkg::*;

  class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    alu_sequencer m_seqr;
    alu_driver m_drv;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      m_seqr = alu_sequencer::type_id::create("m_seqr", this);
      m_drv  = alu_driver::type_id::creaete("m_drv", this);
    endfunction

    function void connect_phase(uvm_phase phase);
      m_drv.seq_item_port.connect(m_seqr.seq_item_export);
    endfunction

  endclass

  class alu_test extends uvm_test;
    `uvm_component_utils(alu_test)

    alu_env m_env;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      m_env = alu_env::type_id::create("m_env", this);
    endfunction

    task run_phase(uvm_phase phase);
      alu_sequence seq;
      seq = alu_sequence::type_id::create("seq");

      if (!seq.randomize()) `uvm_error("", "Randomize failed");
      seq.starting_phase = phase;

      seq.start(m_env.m_seqr);
    endtask
  endclass
endpackage : alu_pkg
