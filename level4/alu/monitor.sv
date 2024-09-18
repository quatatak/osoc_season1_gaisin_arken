class alu_monitor extends uvm_monitor;

  `uvm_component_utils(alu_monitor)

  alu_interface intf;
  alu_packet pkt;
  uvm_analysis_port #(alu_packet) mon_port;

  function new(string name = "alu_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
  //build phase
  function void build_phase(uvm_phase phase);
    //build other components
    pkt = alu_packet::type_id::create("pkt");
    //get method
    uvm_config_db#(virtual alu_interface)::get(null, "*", "intf", intf);

    mon_port = new("Monitor Port", this);
  endfunction

  //connections
  function void connect_phase(uvm_phase phase);
    //necessary connections
  endfunction

  //run_phase
  task run_phase(uvm_phase phase);
    //main logic
    forever begin
      @(posedge intf.clk);
      pkt.input_1 <= intf.input_1;
      pkt.input_2 <= intf.input_2;
    end
  endtask
endclass : alu_monitor
