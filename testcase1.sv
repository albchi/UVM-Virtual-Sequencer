`include "seq_pkt.sv"
`include "seq_rst.sv"
`include "env.sv"
`include "v_seqr.sv"
`include "v_seq.sv"

class testcase1 extends uvm_test;

   `uvm_component_utils(testcase1);

   v_seqr v_seqr_0;
   seq_pkt seq_pkt_0;
   seq_rst seq_rst_0;
   env env_0;
   integer len_of_rst = 25;


   function new(string n, uvm_component p);
      super.new(n,p);
   endfunction 


   virtual function void build_phase(uvm_phase phase);

     int tmp;
     super.build_phase(phase);
     v_seqr_0 = v_seqr::type_id::create("v_seqr_0", this);
     env_0 = env::type_id::create("env_0", this);
     // uvm_config_db #(int)::set(this, "global_config", "num_pkt_to_send", 700); 
     // uvm_config_db #(int)::get(this, "global_config", "num_pkt_to_send", tmp); 
     // $display("uvm_config_db num_pkt_to_send is %d \n", tmp);
     // uvm_config_db#(int)::set(uvm_root::get(), "global_config", "num_pkt_to_send", 700);
     uvm_config_db#(int)::set(this, "*", "lor", len_of_rst);
     // uvm_config_db#(int)::get(uvm_root::get(), "global_config", "num_pkt_to_send", tmp );
     $display("uvm_config_db num_pkt_to_send is %d \n", tmp);

     // turn off RST 
     uvm_config_db #(uvm_object_wrapper)::set(this, "env_0.agent_rst_0.seqr_rst_0.reset_phase", "default_sequence", null); // default_sequence_poo still compiles and runs
     // uvm_config_db #(uvm_object_wrapper)::set(this, "env_0.agent_rst_0.seqr_pkt_0.reset_phase", "default_sequence", v_seq::get_type());
     //
     // turn off RST 
     uvm_config_db #(uvm_object_wrapper)::set(this, "env_0.agent_pkt_0.seqr_pkt_0.reset_phase", "default_sequence", null); // default_sequence_poo still compiles and runs
     // uvm_config_db #(uvm_object_wrapper)::set(this, "env_0.agent_rst_0.seqr_pkt_0.reset_phase", "default_sequence", v_seq::get_type());

 
     // turn on PKT
     uvm_config_db #(uvm_object_wrapper)::set(this, "v_seqr_0.reset_phase", "default_sequence", v_seq::get_type()); // default_sequence_poo still compiles and runs

     // let's set rst_len in config_db
     uvm_config_db #(int unsigned)::set(this, "global_config", "rst_len", 5);



   endfunction 

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      v_seqr_0.seqr_pkt_0 = env_0.agent_pkt_0.seqr_pkt_0;
      v_seqr_0.seqr_rst_0 = env_0.agent_rst_0.seqr_rst_0;
   endfunction // connect_phase

   // run_phase NOT USED is not true - will have null objec access error in main_phase
   //  seq_pkt_0.start(env_0.agent_pkt_0.seqr_pkt_0);
   virtual task run_phase(uvm_phase phase);
      // Error-[NOA] Null object access
      // testcase1.sv, 58
      // The object at dereference depth 1 is being used before it was 
      // constructed/allocated.

      seq_pkt_0 = seq_pkt::type_id::create("seq_pkt_0", this);
      seq_rst_0 = seq_rst::type_id::create("seq_rst_0", this);
   endtask

  virtual task main_phase(uvm_phase phase) ;
     uvm_objection objection;
     super.main_phase(phase) ;
     phase.raise_objection(this);
     // seq_pkt_0.start(env_0.agent_pkt_0.seqr_pkt_0);
     seq_pkt_0.start(v_seqr_0.seqr_pkt_0); // using virtual sequencer
     // seq_rst_0.start(env_0.agent_rst_0.seqr_rst_0);
     seq_rst_0.start(v_seqr_0.seqr_rst_0); // using virtual sequencer
     // phase.drop_objection(this);
     objection=phase.get_objection();
     //objection.set_drain_time(this, 5us); // $finish at simulation time 100
     objection.set_drain_time(this, 3us); // $finish at simulation time 100
     phase.drop_objection(this);
     objection.set_drain_time(this, 5us); //  $finish at simulation time 1505

     // objection.set_drain_time(this, 3us); // $finish at simulation time 1505


  endtask 

endclass


