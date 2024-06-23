`ifndef _SEQUENCE_SIMPLE_BUS_
`define _SEQUENCE_SIMPLE_BUS_

`include "simple_bus_cmd.v"

class Sequence_simple_bus extends uvm_sequence#(Simple_bus_cmd);

   `uvm_object_utils(Sequence_simple_bus);

    virtual task body();
       repeat(32) begin
          `uvm_info("XAC", "in sequence body", UVM_HIGH);
          `uvm_do_with(req, {saddr == 16'h1111; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h2222; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h3333; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h4444; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h5555; daddr == 888;})

           req = Simple_bus_cmd::type_id::create("req");
           start_item(req);
           req.cmd = 4;
           req.daddr = 16'haaaa;
           req.saddr = 4;
           finish_item(req);

       end
    endtask

    virtual task pre_start();
        if ( starting_phase != null )
            starting_phase.raise_objection( this );                               
    endtask : pre_start


    virtual task post_start();
        if  ( starting_phase != null )
            starting_phase.drop_objection( this );
    endtask : post_start


endclass
`endif //  _SEQUENCE_SIMPLE_BUS_
