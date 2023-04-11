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

always @(clk50)
   begin
   clk2 = clk50;
   end

   integer i;
   reg [383:0] reg_in = 0;
   reg tmp = 0;
   always @(negedge clk_from_stm)
   begin
      // tmp <= reg_in[383];
      // reg_in <= reg_in << 1;

      for (i = 383; i>0; i = i - 1) begin
         reg_in[i] <= reg_in[i-1];
      end //for
      
      reg_in[0] <= data_from_stm;
   end

   always @(posedge clk_from_stm)
   begin
   data_to_stm <= reg_in[383];
   // data_to_stm <= tmp;
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
         62: test_120 <= 0;
         // 511: begin
         // test_120 <= 1;
         // counter <= 0;
         // end
         // default:  test_120 <= 0;
      endcase
      counter <= counter + 1;
   end

   // always @(posedge c4)
   //    begin
   //       counter <= counter + 1;
   //       case (counter)
   //          1: data <= 1;
   //          3: data <= 3;
   //          5: data <= 5;
   //          // default:  data <= 0;
   //       endcase
   //    end

   // always @(c4)
   //    if (f0 == 0) begin 
   //    counter <= 0;
   //    end else
   //    begin
   //       counter <= counter + 1;
   //       case (counter)
   //          1: test_120 <= 1;
   //          2: test_120 <= 0;
   //          3: test_120 <= 1;
   //          4: test_120 <= 0;
   //          5: test_120 <= 1;
   //          6: test_120 <= 0;
   //          7: test_120 <= 1;
   //          8: test_120 <= 0;
   //          9: test_120 <= 1;
   //          10: test_120 <= 0;
   //          11: test_120 <= 1;
   //          12: test_120 <= 0;
   //          13: test_120 <= 1;
   //          14: test_120 <= 0;
   //          15: test_120 <= 1;
   //          16: test_120 <= 0;
   //          17: test_120 <= 1;
   //          18: test_120 <= 0;
   //          19: test_120 <= 1;
   //          20: test_120 <= 0;
   //          default:  data <= 0;
   //       endcase
   //    end


endmodule




    
