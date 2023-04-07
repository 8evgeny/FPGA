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
   output reg cpu_int

   );
reg [9:0] count_10 = 0;
reg [4:0] count_5 = 0;

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

// always @ (c4) 
//    begin
//    data_to_dt = c4; 
//    end //always

always @(clk50)
   begin
   clk2 = clk50;
   // count_5 <= count_5 + 1;
   end

   integer i;
   integer j;
   reg [383:0] reg_in = 0;
   always @(negedge clk_from_stm)
   begin
   
      for (i = 383; i>0; i = i - 1) begin
         reg_in[i] <= reg_in[i-1];
      end //for
      reg_in[0] <= data_from_stm;
   end

   always @(posedge clk_from_stm)
   begin
   data_to_stm <= reg_in[383];
   end

   always @(negedge c4)
   begin
   count_5 <= 0;
   end

   always @(posedge c4)

   if (f0 == 0) begin count_10 <= 0;
   end else
   begin

   test_120 <= 0;

   if(count_10 == 0) 
   begin
   test_120 <= 1;
   end
   if(count_10 == 24) 
   begin
   test_120 <= 1;
   end
   if(count_10 == 48) 
   begin
   test_120 <= 1;
   end
   count_10 <= count_10 + 1;

   end




endmodule




    
