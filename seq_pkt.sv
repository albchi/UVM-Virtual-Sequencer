`ifndef _SEQ_PKT_
`define _SEQ_PKT_

`include "pkt.sv"

class seq_pkt extends uvm_sequence#(pkt);

   `uvm_object_utils(seq_pkt)

    virtual task body();

          `uvm_info("XAC", "SEQ_PKT::body(), going to uvm_do_with", UVM_HIGH);

          `uvm_do_with(req, {saddr == 16'h1111; daddr == 888; rw_== 0;})
          `uvm_do_with(req, {saddr == 16'h1111; daddr == 888; rw_== 1;})       

          `uvm_info("XAC", "in sequence body, after 1st uvm_do_with ", UVM_HIGH);

          `uvm_do_with(req, {saddr == 16'h2222; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h3333; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h4444; daddr == 888;})
          `uvm_do_with(req, {saddr == 16'h5555; daddr == 888;})

           // req = pkt::type_id::create("req");
           // start_item(req);
           // req.cmd = 4;
           // req.daddr = 16'haaaa;
           // req.saddr = 4;
           // finish_item(req);

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

`endif 
