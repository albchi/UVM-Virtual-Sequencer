`ifndef _INTF_SIMPLE_BUS_
`define _INTF_SIMPLE_BUS_
interface intf_simple_bus(input bit clk);

   // logic clk; // still need to declare even on port
   logic rst_;
   logic [3:0] cmd;
   logic [15:0] saddr;
   logic en;
   logic done;
   logic stall;
 
   clocking cb_driver @(posedge clk);
      output rst_;
      output en;
      output cmd;
      output saddr;
      output done;
      input stall;
   endclocking

   clocking cb_mon @(posedge clk);
      input rst_;
      input en;
      input cmd;
      input saddr;
      input done;
      input stall;
   endclocking


endinterface
`endif
