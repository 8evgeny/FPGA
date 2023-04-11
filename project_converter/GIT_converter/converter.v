`timescale 1ns / 1ps
module converter (
   input wire f0,
   input wire c4,
   input wire select,
   input wire data_from_dt,
   input wire data_from_stm,
   input wire clk_from_stm,
   input wire reset_out_rg,
   input wire reset_in_rg,
   input clk50,
   output reg clk2,
   output reg test_120,
   output reg data_to_dt,
   output reg data_to_stm,
   output reg cpu_int = 0

   );
reg [9:0] counter = 0;
reg [5:0] data = 0;
reg [4:0] counter_f0 = 0;
//    reg [19:0] count_20 = 0;
// always @(posedge clk50) begin
//    count_20 <= count_20 + 1;
//    if(count_20 == 1024)
//    // 2 - 25 000 000
//    // 4 - 12 500 000
//    begin
//       count_20<=0;
//       clk2 <= !clk2;
//    end
// end

always @(clk50)
   begin
   clk2 = clk50;
   end

   integer i;
   reg [383:0] reg_in = 0;
   reg tmp = 0;
   always @(negedge clk_from_stm)
   begin
      reg_in <= reg_in << 1;
      reg_in[0] <= data_from_stm;
   end

   always @(posedge clk_from_stm)
   begin
   data_to_stm <= reg_in[383];
   end


   always @(posedge c4)
   if (f0 == 0) begin 
      counter <= 0;
   end else
   begin
      
      case (counter)
         0: test_120 <= 1;
         2: test_120 <= 0;
         4: test_120 <= 1;
         6: test_120 <= 0;
         8: test_120 <= 1;
         10: test_120 <= 0;
         12: test_120 <= 1;
         14: test_120 <= 0;
         16: test_120 <= 1;
         18: test_120 <= 0;
         20: test_120 <= 1;
         22: test_120 <= 0;
         24: test_120 <= 1;
         26: test_120 <= 0;
         28: test_120 <= 1;
         30: test_120 <= 0;
         32: test_120 <= 1;
         34: test_120 <= 0;
         36: test_120 <= 1;
         38: test_120 <= 0;
         40: test_120 <= 1;
         42: test_120 <= 0;
         44: test_120 <= 1;
         46: test_120 <= 0;
         48: test_120 <= 1;
         50: test_120 <= 0;
         52: test_120 <= 1;
         54: test_120 <= 0;
         56: test_120 <= 1;
         58: test_120 <= 0;
         60: test_120 <= 1;
         62:   begin
                  if (counter_f0 == 0) begin
                  cpu_int = 0;
                  end
                  counter_f0 <= counter_f0 + 1;
                  test_120 <= 0;
                  if (counter_f0 == 7) begin
                  cpu_int = 1;
                  counter_f0 <= 0;
                  end
               end
         // 511: begin
         // test_120 <= 1;
         // counter <= 0;
         // end
         // default:  test_120 <= 0;
      endcase
      counter <= counter + 1;
   end


endmodule




    
