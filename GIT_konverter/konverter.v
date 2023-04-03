module counter2 (
    input wire f0,
    input wire c4,
    output reg clk_en1,
    output reg clk_en2,
    output reg clk1,
    output reg clk2
);
integer i;

always @ (negedge f0)
   begin
      clk_en1 <= 1'b1;
      @ (negedge c4)
      begin
         #0 clk1 <= 1'b1;
         for (i=0; i<31; i=i+1) 
            begin
               #244 clk1 <= 1'b0;
               #244 clk1 <= 1'b1;
            end
         #244 clk1 <= 1'b0;   
         #122 clk_en1 <= 1'b0; 
      end
   end

endmodule