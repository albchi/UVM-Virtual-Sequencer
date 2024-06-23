`ifndef _SEQUENCE_SIMPLE_BUS_
`define _SEQUENCE_SIMPLE_BUS_

`include "simple_bus_cmd.v"

class Sequence_rst extends uvm_sequence#(Simple_bus_cmd);

   `uvm_object_utils(Sequence_simple_bus);

    virtual task body();
          `uvm_info("XAC", "in sequence body", UVM_HIGH);
          `uvm_do_with(req, {rst== 1;rst_time = 5;})
          `uvm_do_with(req, {rst== 0;})
	

/*
           req = Simple_bus_cmd::type_id::create("req");
           start_item(req);
           req.cmd = 4;
           req.daddr = 4;
           req.saddr = 4;
           finish_item(req);
*/

       end
    endtask

endclass
`endif //  _SEQUENCE_SIMPLE_BUS_
