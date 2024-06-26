`ifndef _DRIVER_PKT_ 
`define _DRIVER_PKT_
`include "rst.sv"

class drv_rst extends uvm_driver#(rst);

    int reset_len;

    virtual intf_simple_bus intf_simple_bus_0;

   `uvm_component_utils(drv_rst)

    function new(string n="driver", uvm_component p);
       super.new(n,p);
    endfunction 

    virtual task run_phase(uvm_phase phase);


        `uvm_info("RST Driver", "About to drive", UVM_HIGH);

        uvm_config_db#(int)::get(this, "*", "lor", reset_len);
	`uvm_info("RST Driver", $sformatf("uvm_config_db.lor  is %0d \n", reset_len), UVM_LOW);	   

        forever begin 

            seq_item_port.get_next_item(req);
            
	    `uvm_info("RST Driver", "waiting for clk", UVM_HIGH);
	   `uvm_info("RST Driver", $sformatf("rst_ is %0b \n", top.intf_bus_0.rst_), UVM_LOW);	   


	    // `uvm_info("RST Driver", "got clk", UVM_HIGH);
	    top.intf_bus_0.rst_ = ~req.rst_;
	    @(top.intf_bus_0.cb_driver);
	   `uvm_info("RST Driver", $sformatf("rst_ is %0b \n", top.intf_bus_0.rst_), UVM_LOW);	   

            repeat(reset_len)
	       @(top.intf_bus_0.cb_driver);

	    top.intf_bus_0.rst_ = req.rst_;
	    @(top.intf_bus_0.cb_driver);
	   `uvm_info("RST Driver", $sformatf("rst_ is %0b \n", top.intf_bus_0.rst_), UVM_LOW);	   



	   top.intf_bus_0.rst_ = ~req.rst_;
   	   @(top.intf_bus_0.clk);
	   `uvm_info("RST Driver", $sformatf("rst_ is %0b \n", top.intf_bus_0.rst_), UVM_LOW);	   


	   seq_item_port.item_done();
        end // forever
    endtask // run_phase
    virtual function void check_phase(uvm_phase phase);
       super.check_phase(phase);
       // uvm_config_db #(int)::get(uvm_root::get(), "uvm_test_top.global_config", "num_pkt_to_send", tmp); 
       // `uvm_info("RST Driver ", $sformatf("global_config::num_pkt_to_send is %0d \n", tmp), UVM_LOW);	   
       // `uvm_info("RST Driver ", $sformatf("num_of_pkt = %0d \n", tmp), UVM_LOW);	   

    endfunction  // check_phase(uvm_phase phase);
endclass
`endif 
