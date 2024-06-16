class virtual_sequence extends uvm_sequence;


   `uvm_object_utils(virtual_sequence);

   `uvm_declare_p_sequencer(virtual_sequencer)

    seq_pkt seq_pkt_0;

    // XAC MUST PASS IN STRING TO NEW! 
    function new(input string name = "virtual sequence");
       super.new(name);
    endfunction 

    virtual task body();
       `uvm_do_on(seq_pkt_0, p_sequencer.seqr_pkt_0);
       // `uvm_do_on(seq_rst, p_seqeuncer.rst_cmd);
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
