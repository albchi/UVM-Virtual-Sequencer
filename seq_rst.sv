`ifndef _SEQ_RST_
`define _SEQ_RST_

`include "rst.sv"

class seq_rst extends uvm_sequence#(rst);

   `uvm_object_utils(seq_rst)

    virtual task body();

          int len_of_rst = 5;

          `uvm_info("XAC", "in rst sequence sequence body", UVM_HIGH);

          // uvm_config_db #(int unsigned )::get(this, "global_config", "rst_len", len_of_rst);
          // The type of the actual is 'class main.seq_rst', while the type of 
          //   the formal is 'class uvm_pkg::uvm_component'. Expression: this
          //   Source info: uvm_config_db

          // `uvm_do_with(req, {rst_== 1'b0; rst_time == 3;})
          `uvm_do_with(req, {rst_== 1'b0; rst_time == len_of_rst;})

          // `uvm_do_with(req, {rst_== 1'b1; rst_time == 1;})

          // `uvm_do_with(req, {saddr == 16'h2222; daddr == 888;})
          // `uvm_do_with(req, {saddr == 16'h3333; daddr == 888;})
          // `uvm_do_with(req, {saddr == 16'h4444; daddr == 888;})
          // `uvm_do_with(req, {saddr == 16'h5555; daddr == 888;})

           // req = rst::type_id::create("req");
           // start_item(req);
           // req.cmd = 4;
           // req.daddr = 16'haaaa;
           // req.saddr = 4;
           // finish_item(req);

    endtask

    virtual task pre_start();
       `uvm_info("XAC", "seq_rst::pre_start", UVM_HIGH);

        if ( starting_phase != null )
            starting_phase.raise_objection( this );                               
    endtask : pre_start


    virtual task post_start();
       `uvm_info("XAC", "seq_rst::post_start", UVM_HIGH);
        if  ( starting_phase != null )
            starting_phase.drop_objection( this );
    endtask : post_start


endclass

`endif 
