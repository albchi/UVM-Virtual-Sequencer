`ifndef _PKT_
`define _PKT_

class pkt extends uvm_sequence_item;

   rand bit [15:0] saddr;
   rand bit [15:0] daddr;
   rand bit [3:0] cmd;
   rand bit rst;
   rand integer rst_time;

   `uvm_object_utils_begin(pkt)
      `uvm_field_int(saddr, UVM_DEFAULT)
      `uvm_field_int(daddr, UVM_DEFAULT)
      `uvm_field_int(cmd, UVM_DEFAULT)
   `uvm_object_utils_end


   function new( string n="pkt");
      super.new();
   endfunction 

endclass
`endif
