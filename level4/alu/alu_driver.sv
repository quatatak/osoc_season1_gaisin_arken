class alu_driver extends uvm_driver #(alu_packet);
  `uvm_component_utils(alu_driver)

  virtual alu_interface intf;
  alu_packet    pkt;

  function new(string name = "alu_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
  //build phase
  function void build_phase(uvm_phase phase);
    //build other components
    pkt = alu_packet::type_id::create("pkt");
    //get method
    if (!uvm_config_db#(virtual alu_interface)::get(this, "", "alu_if", intf)) begin
      `uvm_error("", "uvm_config_db::get failed", UVM_HIGH);
    end
  endfunction

  //connections
  function void connect_phase(uvm_phase phase);
    //necessary connections
  endfunction

  //run_phase
  task run_phase(uvm_phase phase);
    //main logic
    forever begin
      seq_item_port.get_next_item(req);

      @(posedge intf.clk);
      intf.input_1 <= req.input_1;
      intf.input_2 <= req.input_2;
      intf.carry_in <= req.cin;
      intf.select <= req.select;
      intf.mode <= req.mode;

      seq_item_port.item_done();
    end
  endtask
endclass : alu_driver
