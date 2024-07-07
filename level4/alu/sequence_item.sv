class alu_packet extends uvm_sequence_item;
	`uvm_object_utils(alu_packet)
	//request
	rand bit [7:0] input_1;
	rand bit [7:0] input_2;

	//response
	output_3;

	function new(string name = "alu_packet");
		super.new(name);
	endfunction: new
endclass:alu_packet
