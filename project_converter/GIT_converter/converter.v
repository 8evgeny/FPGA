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
parameter num_byte_in_buffer = 16;
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

   integer i = 0;
   reg [(num_byte_in_buffer * 8 - 1):0] reg_in = 0;
   reg [(num_byte_in_buffer * 8 - 1):0] reg_in2 = 0;

   always @(negedge clk_from_stm)
   begin
      // reg_in2 <= reg_in2 << 1;
      // reg_in2[0] <= data_from_stm;
   end

   always @(posedge clk_from_stm)
   begin

   data_to_stm <= reg_in[(num_byte_in_buffer * 8 - 1 - i)];
   i = i + 1;
   if (num_byte_in_buffer * 8 - 1 < i ) i <= 0;

   end


   always @(posedge c4)
   if (f0 == 0) begin 
      counter <= 0;

   end else
   begin
      if (counter_f0 == 0) begin
      cpu_int <= 0;
      end   

      case (counter)
         0: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         2: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         4: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         6: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         8: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         10: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         12: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         14: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         16: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         18: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         20: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         22: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         24: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         26: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         28: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         30: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         32: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         34: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         36: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         38: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         40: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         42: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         44: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         46: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         48: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         50: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         52: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         54: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         56: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         58: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         60: reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;
         62:   begin
                  reg_in[counter_f0 * 32 + counter/2] <= data_from_dt;

                  // if (counter_f0 == 0) begin
                  // cpu_int = 0;
                  // end
                  counter_f0 <= counter_f0 + 1;
                  test_120 <= 0;
                  if (counter_f0 == num_byte_in_buffer - 1) begin
                     cpu_int <= 1;
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




    
