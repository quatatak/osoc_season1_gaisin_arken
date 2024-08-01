class alu_sequencer extends uvm_sequencer #(alu_packet);
  `uvm_component_utils(alu_sequencer)
  function new(string name = "alu_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
  //build phase
  function void build_phase(uvm_phase phase);
    //build other components

  endfunction

  //connections
  function void connect_phase(uvm_phase phase);
    //necessary connections
  endfunction

  //run_phase
  task run_phase(uvm_phase phase);
    //main logic
  endtask
endclass : alu_sequencer
