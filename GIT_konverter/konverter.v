module counter2 (
    input wire f0,
    input wire c4,
          // input wire reset,
          // input wire clk,
          // input wire [7:0]wdata,
          // input wire wr,
          // output reg [7:0]data,
    output reg clk_en1,
    output reg clk_en2,
    output reg clk1,
    output reg clk2
);
integer i;
// always @ (posedge clk or posedge reset)
//     if (reset)
//        data <= 8'h00;
//     else
//     if(wr)
//     begin
//        data <= wdata;
//        $display("written %h",wdata);
//     end
//    else
//       data <= data + 8'h01;

always @ (negedge f0)
   begin
      clk_en1 <= 1'b1;
      @ (negedge c4)
      begin
         for (i=0;i<32;i=i+1) 
            begin
               #10 clk1 <= 1'b1;
               #10 clk1 <= 1'b0;
            end
         clk_en1 <= 1'b0; 
      end
   end



endmodule