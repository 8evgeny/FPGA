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
reg [9:0] counter = 0;
reg [5:0] data = 0;

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

// always @(clk50)
//    begin
//    clk2 = clk50;
//    end

   integer i;
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
   if (f0 == 0) begin 
      counter <= 0;
   end else
   begin
      counter <= counter + 1;
      case (counter)
         0: data <= 0;
         2: data <= 2;
         4: data <= 4;
         // default:  data <= 0;
      endcase
      // test_120 <=data[0];
   end

   always @(posedge c4)
   begin
      counter <= counter + 1;
      case (counter)
         1: data <= 1;
         3: data <= 3;
         5: data <= 5;
         // default:  data <= 0;
      endcase
   end

   // always @(data[0])
   // begin
   //    test_120 <=data[0];
   // end


endmodule




    
