class alu_sequence extends uvm_sequence #(alu_packet);
  `uvm_object_utils(alu_sequence)

  function new(string name = "alu_sequence");
    super.new(name);
  endfunction

  task body();
    if (starting_phase != null) strating_phase.raise_objection(this);

    repeat (10) begin
      req = alu_packet::type_id::create("req");
      start_item(req);
      if (!req.randomize()) `uvm_error("", "Randomize failed");
      finish_item(req);
    end

    if (starting_phase != null) starting_phase.drop_objection(this);
  endtask
endclass : alu_sequence
