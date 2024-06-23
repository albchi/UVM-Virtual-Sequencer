class v_seq extends uvm_sequence;


   `uvm_object_utils(v_seq);

   `uvm_declare_p_sequencer(v_seqr)

    seq_pkt seq_pkt_0;
    seq_rst seq_rst_0;

   
    // XAC MUST PASS IN STRING TO NEW! 
    function new(input string name = "virtual sequence");
       super.new(name);
    endfunction 

    virtual task body();
       `uvm_do_on(seq_rst_0, p_sequencer.seqr_rst_0)
        // repeat(50) @(posedge top.intf_bus_0.clk);
       `uvm_do_on(seq_pkt_0, p_sequencer.seqr_pkt_0)
    endtask 

    virtual task pre_start();
       `uvm_info("XAC", "pre_start", UVM_HIGH);
       if ((get_parent_sequence() == null) && (starting_phase != null))
       begin
          starting_phase.raise_objection(this);
       end
    endtask // pre_start();
    virtual task post_start();
       `uvm_info("XAC", "post_start", UVM_HIGH);
       if ((get_parent_sequence() == null) && (starting_phase != null))
       begin
          starting_phase.drop_objection(this);
       end
    endtask // post_start();

endclass 
