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
   output reg data_to_dt,
   output reg data_to_stm,
   output reg cpu_int

   );

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

always @ (c4) 
   begin
   data_to_dt = c4; 
   end //always

always @(clk50)
   begin
   clk2 = clk50;
   end

always @(negedge clk_from_stm)
   begin
   data_to_stm <= data_from_stm;
   end



endmodule




    
