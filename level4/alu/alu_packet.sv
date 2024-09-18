class alu_packet extends uvm_sequence_item;
  `uvm_object_utils(alu_packet)
  //request
  rand logic [15:0] input_1;
  rand logic [15:0] input_2;
  rand logic [3:0] select;
  rand logic cin;
  rand logic mode;

  //response
  logic [15:0] output_3;
  logic cout;
  logic cmp;

  function new(string name = "alu_packet");
    super.new(name);
  endfunction : new

  function string convert2string;
    return $sformatf(
        "input_1=%d, input_2=%d, operation = %d, mode = %b," +
        " carry = %d, output = %d, cmp = %b, cout = %b",
        input_1,
        input_2,
        select,
        mode,
        cin,
        output_3,
        cmp,
        cout
    );
  endfunction

  function void do_copy(uvm_object rhs);
    alu_packet pkt;
    $cast(pkt, rhs);
    input_1 = rhs.input_1;
    input_2 = rhs.input_2;
    select = rhs.select;
    cin = rhs.cin;
    mode = rhs.mode;
  endfunction : do_copy

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    alu_packet pkt;
    bit status = 1;
    $cast(pkt, rhs);
    status &= (input_1 == rhs.input_1);
    status &= (input_2 == rhs.input_2);
    status &= (mode == rhs.mode);
    status &= (cin == rhs.cin);
    status &= (select == rhs.select);
    return status;
  endfunction : do_compare

endclass : alu_packet
