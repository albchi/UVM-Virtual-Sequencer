module top;

   reg clk;

   intf_simple_bus intf_bus_0(clk);

   simple_bus slave0 (
      .clk(clk),
      .rst_(intf_bus_0.rst_),
      .en(intf_bus_0.en),
      .cmd(intf_bus_0.cmd),
      .saddr(intf_bus_0.saddr),
      .daddr(intf_bus_0.daddr),
      .done(intf_bus_0.done)

   );


   initial 
      $fsdbDumpvars;

   initial 
      clk = 0;

   always
      #5 clk = ~clk;

endmodule 

