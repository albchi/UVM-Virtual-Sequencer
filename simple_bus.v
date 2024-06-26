module simple_bus(clk, rst_, en, cmd, done, stall);

   input clk;
   input rst_;
   input en;
   input [3:0] cmd;
   input done;
   output stall;

   reg [3:0] cmd_ff;
   reg start_cnt;
   reg stall;
   reg [3:0] cnt;

   always @(posedge clk) begin
      if (rst_ == 1'b1)  begin
         stall <= 1'b0;
         cmd_ff <= 8'h0;
         start_cnt <= 1'b0;
      end
      else 
         if (en == 1'b1)  begin
            cmd_ff <= cmd;
            start_cnt <= 1'b1;
         end
   end

   always @(posedge clk) begin

      if (start_cnt == 1'b1) 
         cnt <= cnt + 8'h1;
         if (cnt == 8'hf)
             stall <= 1'b1;
   end


endmodule

