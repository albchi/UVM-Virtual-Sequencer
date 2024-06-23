`ifndef _V_SEQR_
`define _V_SEQR_
class v_seqr extends uvm_sequencer;

   `uvm_component_utils(v_seqr)

    seqr_pkt seqr_pkt_0;
    seqr_rst seqr_rst_0;
 
    function new(input string name, input uvm_component parent);
       super.new(name,parent);
    endfunction 

endclass 
`endif // _V_SEQR_
