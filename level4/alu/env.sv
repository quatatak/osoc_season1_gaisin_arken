
class alu_env extends uvm_env;
	`uvm_component_utils(alu_env)
	
	//instantiate class
	alu_agent agnt;
	function new(string name = "alu_env", uvm_component parent = null);
		super.new(name, parent);
	endfunction: new
       //build phase
        function void build_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
                //build other components
		//build agent class
		agnt = alu_agent::type_id::create("agnt", this);//create agent
        endfunction

        //connections
        function void connect_phase(uvm_phase phase);
                //necessary connections
        endfunction

        //run_phase
        task run_phase(uvm_phase phase);
                //main logic
        endtask
endclass: alu_env
