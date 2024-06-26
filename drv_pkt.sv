`ifndef _DRV_RST_ 
`define _DRV_RST_
`include "pkt.sv"

class drv_pkt extends uvm_driver#(pkt);

    virtual intf_simple_bus intf_simple_bus_0;

   `uvm_component_utils(drv_pkt)

    function new(string n="driver", uvm_component p);
       super.new(n,p);
    endfunction 

    virtual task run_phase(uvm_phase phase);

        forever begin 
            seq_item_port.get_next_item(req);
	    `uvm_info("CMD Driver", "waiting for clk , consumed ", UVM_HIGH);

	    // @(top.intf_bus_0.clk);
	    @(top.intf_bus_0.cb_driver);

	    `uvm_info("CMD Driver", "got clk and will be driving this to interface", UVM_HIGH);
	    `uvm_info("CMD Driver", req.sprint(), UVM_HIGH);

	    top.intf_bus_0.en = 0;
	    top.intf_bus_0.en = 1;
	    top.intf_bus_0.cmd = req.cmd;
	    top.intf_bus_0.saddr = req.saddr;
	    // `uvm_info("CMD Driver", "waiting for clk #2", UVM_HIGH);
	    @(top.intf_bus_0.clk);
	    `uvm_info("CMD Driver", $sformatf("cmd is %0h \n", top.intf_bus_0.cmd ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("saddr is %0h \n", top.intf_bus_0.saddr ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("done is %0h \n", top.intf_bus_0.done), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("en is %0h \n", top.intf_bus_0.en), UVM_LOW);	   

	    top.intf_bus_0.en = 0;
	    // top.intf_bus_0.cmd = req.data; // for now, use cmd to improve debugabilty
	    top.intf_bus_0.cmd = req.cmd;
	    @(top.intf_bus_0.clk);
	    `uvm_info("CMD Driver", $sformatf("cmd is %0h \n", top.intf_bus_0.cmd ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("saddr is %0h \n", top.intf_bus_0.saddr ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("done is %0h \n", top.intf_bus_0.done), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("en is %0h \n", top.intf_bus_0.en), UVM_LOW);	   

	    repeat(req.hold_len) 
               @(top.intf_bus_0.cb_driver);

	    top.intf_bus_0.done = 1;
	    @(top.intf_bus_0.clk);
	    `uvm_info("CMD Driver", $sformatf("cmd is %0h \n", top.intf_bus_0.cmd ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("saddr is %0h \n", top.intf_bus_0.saddr ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("done is %0h \n", top.intf_bus_0.done), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("en is %0h \n", top.intf_bus_0.en), UVM_LOW);	   


	    top.intf_bus_0.done = 0;
	    @(top.intf_bus_0.clk);
	    `uvm_info("CMD Driver", $sformatf("cmd is %0h \n", top.intf_bus_0.cmd ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("saddr is %0h \n", top.intf_bus_0.saddr ), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("done is %0h \n", top.intf_bus_0.done), UVM_LOW);	   
	    `uvm_info("CMD Driver", $sformatf("en is %0h \n", top.intf_bus_0.en), UVM_LOW);	   

	    // `uvm_info("CMD Driving!", req.sprint(), UVM_HIGH);
	     seq_item_port.item_done();
        end // forever
    endtask // run_phase
/*
    virtual task run_phase(uvm_phase phase);

        `uvm_info("CMD Driver", "About to drive", UVM_HIGH);
        forever begin 
            // seq_item_port.get_next_item(req);
            seq_item_port.try_next_item(req);
            //if (req == null) begin
            //   `uvm_info("XAC : CMD Driver", "req is dry!!", UVM_HIGH);
        //	@(top.intf_bus_0.cb_driver); // need to to solve 9200 fatal????? NOPE!
         //   end
          //  else begin
		    `uvm_info("CMD Driver", "waiting for clk", UVM_HIGH);
		    // @(top.intf_bus_0.clk);
		    @(top.intf_bus_0.cb_driver);
		    `uvm_info("CMD Driver", "got clk", UVM_HIGH);
		    top.intf_bus_0.cmd = req.data;
		    // @(top.intf_bus_0.clk);
		    `uvm_info("CMD Driver", "waiting for clk #2", UVM_HIGH);
		    @(top.intf_bus_0.cb_driver);
		    `uvm_info("CMD Driving!", req.sprint(), UVM_HIGH);
	            seq_item_port.item_done();
//           end // else
        end // forever
    endtask // run_phase
*/
endclass
`endif 
