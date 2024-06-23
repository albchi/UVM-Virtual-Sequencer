`include "sequence_simple_bus.v"
`include "env.v"

class Testcase1 extends uvm_test;

   `uvm_component_utils(Testcase1);

   Sequence_simple_bus sequence_simple_bus; 

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
      sequence_simple_bus = Sequence_simple_bus::type_id::create("sequence_simple_bus", this);
   endtask
endclass


