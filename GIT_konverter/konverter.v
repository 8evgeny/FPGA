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
         for (i=0; i<32; i=i+1) 
            begin
               #10 clk1 <= 1'b1;
               #10 clk1 <= 1'b0;

            end
         clk_en1 <= 1'b0; 
      end
   end

endmodule