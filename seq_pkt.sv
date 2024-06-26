`ifndef _SEQ_PKT_
`define _SEQ_PKT_

`include "pkt.sv"

class seq_pkt extends uvm_sequence#(pkt);

   `uvm_object_utils(seq_pkt)

    virtual task body();

          `uvm_info("XAC", "SEQ_PKT::body(), going to do uvm_do_with for the 1st time", UVM_HIGH);

          `uvm_do_with(req, {cmd == 4'h0; hold_len < 5; saddr == 16'hdeadbeef; rw_== 0;})
          `uvm_do_with(req, {cmd == 4'h1; hold_len > 5; hold_len < 8; saddr == 16'hcafefade; rw_== 0;})

          `uvm_do_with(req, {cmd == 4'h2; saddr == 16'hb00bd00d; daddr == 888; rw_== 0;})
          `uvm_do_with(req, {cmd == 4'h3; saddr == 16'hac00001; daddr == 888; rw_== 1;})       

          `uvm_info("XAC", "in sequence body, after 1st uvm_do_with ", UVM_HIGH);

          `uvm_do_with(req, {cmd == 4'h4; saddr == 16'h2222; daddr == 16'hcafe;})
          `uvm_do_with(req, {cmd == 4'h5; saddr == 16'h3333; daddr == 16'hbeef;})
          `uvm_do_with(req, {cmd == 4'h6; saddr == 16'h4444; daddr == 16'hfeed;})
          `uvm_do_with(req, {cmd == 4'h7; saddr == 16'h5555; daddr == 16'hfade;})

           // req = pkt::type_id::create("req");
           // start_item(req);
           // req.cmd = 4;
           // req.daddr = 16'haaaa;
           // req.saddr = 4;
           // finish_item(req);

    endtask

    virtual task pre_start();
       `uvm_info("XAC", "seq_pkt::pre_start", UVM_HIGH);
        if ( starting_phase != null )
            starting_phase.raise_objection( this );                               
    endtask : pre_start


    virtual task post_start();
       `uvm_info("XAC", "seq_pkt::post_start", UVM_HIGH);
        if  ( starting_phase != null )
            starting_phase.drop_objection( this );

    endtask : post_start


endclass

`endif 
