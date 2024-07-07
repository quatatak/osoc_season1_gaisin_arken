class alu_driver extends uvm_driver #(alu_packet);
	`uvm_component_utils(alu_driver)

	alu_interface intf;
	alu_packet    pkt;

	function new(string name = "alu_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction: new
	//build phase
        function void build_phase(uvm_phase phase);
                //build other components
		pkt = alu_packet::type_id::create("Driver Packet");	
		//get method
		uvm_config_db #(virtual alu_interface)::get(null, "*", "intf", intf);
        endfunction

        //connections
        function void connect_phase(uvm_phase phase);
                //necessary connections
        endfunction

        //run_phase
        task run_phase(uvm_phase phase);
                //main logic
		forever begin
			@(posedge intf.clk)

				seq_item_port.get_next_item(pkt);

				intf.input_1 <= pkt.input_1;
				intf.input_2 <= pkt.input_2;

				seq_item_port.item_done();
		end
        endtask
endclass: alu_driver
