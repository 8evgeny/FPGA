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
reg [9:0] count_pos = 0;
reg [9:0] count_neg = 0;

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
   end

   integer i;
   integer b1_1,b1_2,b1_3,b1_4,b1_5,b1_6,b1_7,b1_8;
   integer b2_1,b2_2,b2_3,b2_4,b2_5,b2_6,b2_7,b2_8;
   integer b3_1,b3_2,b3_3,b3_4,b3_5,b3_6,b3_7,b3_8;
   integer b4_1,b4_2,b4_3,b4_4,b4_5,b4_6,b4_7,b4_8;
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
   count_neg <= count_neg + 1;
   end

   always @(posedge c4)

   if (f0 == 0) 
   begin 
   count_pos <= 0;
   count_neg <= 0;
   b1_1 <= 0;
   b1_2 <= 0;
   b1_3 <= 0;
   b1_4 <= 0;
   b1_5 <= 0;
   b1_6 <= 0;
   b1_7 <= 0;
   b1_8 <= 0; 
   b2_1 <= 0;
   b2_2 <= 0;
   b2_3 <= 0;
   b2_4 <= 0;
   b2_5 <= 0;
   b2_6 <= 0;
   b2_7 <= 0;
   b2_8 <= 0; 
   end else
   begin

   test_120 <= 0;

   if(count_pos == 0 | count_pos == 1) b1_1 <= 1; 
   if(count_pos == 2 | count_pos == 3) b1_2 <= 1;
   if(count_pos == 4 | count_pos == 5) b1_3 <= 1;
   if(count_pos == 6 | count_pos == 7) b1_4 <= 1; 
   if(count_pos == 8 | count_pos == 9) b1_5 <= 1;
   if(count_pos == 10 | count_pos == 11) b1_6 <= 1;
   if(count_pos == 12 | count_pos == 13) b1_7 <= 1;
   if(count_pos == 14 | count_pos == 15) b1_8 <= 1;
   if(count_pos == 16 | count_pos == 17) b2_1 <= 1; 
   if(count_pos == 18 | count_pos == 19) b2_2 <= 1;
   if(count_pos == 20 | count_pos == 21) b2_3 <= 1;
   if(count_pos == 22 | count_pos == 23) b2_4 <= 1; 
   if(count_pos == 24 | count_pos == 25) b2_5 <= 1;
   if(count_pos == 26 | count_pos == 27) b2_6 <= 1;
   if(count_pos == 28 | count_pos == 29) b2_7 <= 1;
   if(count_pos == 30 | count_pos == 31) b2_8 <= 1;

   test_120 <= b2_2;

   count_pos <= count_pos + 1;
   end




endmodule




    
