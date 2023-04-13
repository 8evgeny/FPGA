`timescale 1ns / 1ps
module converter (
   input wire f0,
   input wire c4,
   input wire select,
   input wire data_from_dt,
   input wire data_from_stm,
   input wire clk_from_stm,
   input wire reset_i,
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

parameter num_byte_in_buffer = 8;

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
   // clk2 = clk50;
   end

   integer i = 0;
   reg [(num_byte_in_buffer * 4 * 8 - 1):0] reg_in = 0;
   reg [(num_byte_in_buffer * 4 * 8 - 1):0] reg_out = 0;

   always @(negedge clk_from_stm)
   begin
   // reg_out[(i)] <= data_from_stm;
   end

   always @(posedge clk_from_stm)
   begin
      data_to_stm <= reg_in[(i)];
      reg_out[(i)] <= data_from_stm;
      i = i + 1;
      // if ( i == num_byte_in_buffer * 4 * 8 ) begin
      if ( reset_i == 1 ) begin
        i = 0;
        reg_out <= 0;
      end 
   end

   // always @(negedge c4)
   // begin

   //    endcase
   // end



   always @(negedge c4)
   if (f0 == 0) begin 
      counter = 0;
   end else
   begin
      if (counter_f0 == 0) begin
      cpu_int <= 0;
      end   

      case (counter)
         0: begin test_120 = 1; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end 
         2: begin test_120 = 0; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         4: begin test_120 = 1; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         6: begin test_120 = 0; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         8: begin test_120 = 1; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         10: begin test_120 = 0; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         12: begin test_120 = 1; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         14: begin test_120 = 0; reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         
         16: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         18: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         20: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         22: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         24: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         26: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         28: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         30: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         

         32: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         34: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         36: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         38: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         40: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         42: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         44: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         46: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         
         48: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         50: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         52: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         54: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         56: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         58: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         60: begin reg_in[counter_f0 * 32 + counter/2] = data_from_dt; data_to_dt = reg_out[counter_f0 * 32 + counter/2] ; end
         62:   begin
                  reg_in[counter_f0 * 32 + counter/2] = data_from_dt; 
                  data_to_dt = reg_out[counter_f0 * 32 + counter/2]; 

                  counter_f0 = counter_f0 + 1;
                  if (counter_f0 == num_byte_in_buffer -1 ) begin
                        cpu_int <= 1;
                        counter_f0 = 0;
                  end

               end
         64:   begin 
               if (select == 0) data_to_dt = 0;
               if (select == 1) data_to_dt = 1;
               end


      endcase
      counter <= counter + 1;
      
   end


endmodule




    
