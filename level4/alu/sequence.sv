class alu_sequence extends uvm_sequence;
	`uvm_object_utils(alu_sequence)
	
	alu_packet pkt;

	function new(string name = "alu_sequence");
		super.new(name);
	endfunction
	
	task body();
		pkt = alu_packet::type_id::create("Packet");
		repeat(10) 
		begin
			start_item(pkt);
			pkt.randomize();
			finish_item(pkt);
		end
	endtask
endclass: alu_sequence
