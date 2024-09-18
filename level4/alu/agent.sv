class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)
  alu_sequencer seqr;
  alu_driver drv;
  alu_monitor mon;
  function new(string name = "alu_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
  //build phase
  function void build_phase(uvm_phase phase);
    //build other components
    //build monitor, sequencer, driver
    seqr = alu_sequencer::type_id::create("seqr", this);  //create sequencer
    mon  = alu_monitor::type_id::create("mon", this);  //create monitor
    drv  = alu_driver::type_id::create("drv", this);  //create driver
  endfunction

  //connections
  function void connect_phase(uvm_phase phase);
    //necessary connections
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction

  //run_phase
  task run_phase(uvm_phase phase);
    //main logic
  endtask
endclass : alu_agent
