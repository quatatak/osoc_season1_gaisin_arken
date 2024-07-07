

class alu_test extends uvm_test;
	
	`uvm_component_utils(alu_test)
	//instantiate classes
	alu_env env;
	
	//constructor
	function new(string name = "alu_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction:new
	
	//build phase
	function void build_phase(uvm_phase phase);
		//build other components
		//build env class here
		env = alu_env::type_id::create("env", this);//create env object
	endfunction
	
	//connections
	function void connect_phase(uvm_phase phase);
		//necessary connections
	endfunction
	
	//run_phase
	task run_phase(uvm_phase phase);
		//main logic
	endtask
	//methods
	
	//properties
	

endclass
