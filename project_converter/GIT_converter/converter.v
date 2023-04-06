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
// integer i,j,k,l;

    // reg [32:0] counter = 0;
    
   //  always @(posedge clk50)
   // if(counter == 24)
   //  begin
   //      counter <= (counter == 24) ? 0 : counter + 1;
   //      clk2 <= (counter == 24) ? 1 : 0;
   //  end

    always @(clk50)
      begin
      clk2 = clk50;
      end


always @ (c4) 
   begin
   data_to_dt = c4; 
   end //always

// always @ (negedge f0)
//    begin
//       clk_en_tx <= 1'b1;
//          #122 clk_tx <= 1'b1;
//          for (i=0; i<30; i=i+1) 
//             begin
//                #244 clk_tx <= 1'b0;
//                #244 clk_tx <= 1'b1;
//             end
//          #244 clk_tx <= 1'b0;   
//          #122 clk_en_tx <= 1'b0; 
//          #122 clk_tx <= 1'b1; 
//          #244 clk_tx <= 1'b0;  
//      end

// always @ (negedge f0)
//    begin
//       clk_en_rx <= 1'b1;
//          #488 clk_rx <= 1'b1;
//          for (j=0; j<31; j=j+1) 
//             begin
//                #244 clk_rx <= 1'b0;
//                #244 clk_rx <= 1'b1;
//             end
//          #244 clk_rx <= 1'b0;   
//          #122 clk_en_rx <= 1'b0; 
//    end

endmodule




    
