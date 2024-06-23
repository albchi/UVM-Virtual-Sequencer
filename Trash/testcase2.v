`include "virtual_sequencer.v"
`include "sequence_simple_bus.v"
`include "env.v"

class Testcase2 extends uvm_test;

   `uvm_component_utils(Testcase2);

   Sequence_simple_bus sequence_simple_bus; 
   virtual_sequencer virtual_sequencer_0;

   Env env_0;


   function new(string n, uvm_component p);
      super.new(n,p);
   endfunction 


   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     env_0 = Env::type_id::create("env_0", this);
   endfunction 


   virtual task run_phase(uvm_phase phase);
      // seq_0 = Sequence_simple_bus::type_id::create("seq_0", this);
   virtual_sequencer_0 = virtual_sequencer::type_id::create("virtual_sequencer_0", this);
   endtask

  virtual function void connect_phase(input uvm_phase phase);
    super.connect_phase(phase);
    virtual_sequencer_0.sequencer_cmd_1= env_0.agent_simple_bus_0.sequencer_cmd_0;
  endfunction : connect_phase

  virtual task main_phase(uvm_phase phase) ;
     uvm_objection objection;
     super.main_phase(phase) ;
     phase.raise_objection(this);
     sequence_simple_bus.start(env_0.agent_simple_bus_0.sequencer_cmd_0);
     phase.drop_objection(this);
     objection=phase.get_objection();
     objection.set_drain_time(this, 5us);
  endtask 
endclass


