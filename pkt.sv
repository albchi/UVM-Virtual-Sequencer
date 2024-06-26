`ifndef _PKT_
`define _PKT_
class pkt extends uvm_sequence_item;
   rand bit [15:0] saddr;
   rand bit [15:0] daddr;
   rand bit [3:0] cmd;
   rand bit [3:0] data;
   rand bit rw_;
   rand integer hold_len;
   rand bit rst;
   rand integer rst_time;

   `uvm_object_utils_begin(pkt)
      `uvm_field_int(saddr, UVM_DEFAULT)
      `uvm_field_int(daddr, UVM_DEFAULT)
      `uvm_field_int(data, UVM_DEFAULT)
      `uvm_field_int(cmd, UVM_DEFAULT)
      `uvm_field_int(rw_, UVM_DEFAULT)
      `uvm_field_int(rst, UVM_DEFAULT)            
      `uvm_field_int(rst_time, UVM_DEFAULT)            
      `uvm_field_int(hold_len, UVM_DEFAULT)            
   `uvm_object_utils_end
   constraint cons_hold_len_default {
      hold_len > 0;
      hold_len < 10;
   }
   function new( string n="pkt");
      super.new();
   endfunction 
endclass
`endif //  _PKT_
