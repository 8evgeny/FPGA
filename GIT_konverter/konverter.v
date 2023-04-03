module converter (
    input wire f0,
    input wire c4,
    output reg clk_en1,
    output reg clk_en2,
    output reg clk_en3,
    output reg clk_en4,
    output reg clk1,
    output reg clk2,
    output reg clk3,
    output reg clk4
);
integer i,j,k,l;

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

always @ (negedge f0)
   begin
      clk_en2 <= 1'b1;
      @ (negedge c4)
      begin
         #366 clk2 <= 1'b1;
         for (j=0; j<30; j=j+1) 
            begin
               #244 clk2 <= 1'b0;
               #244 clk2 <= 1'b1;
            end
         #244 clk2 <= 1'b0;   
         #122 clk_en2 <= 1'b0; 
         #122 clk2 <= 1'b1; 
         #244 clk2 <= 1'b0;  
      end
   end

always @ (negedge f0)
   begin
      clk_en3 <= 1'b1;
      @ (negedge c4)
      begin
         #244 clk3 <= 1'b1;
         for (k=0; k<31; k=k+1) 
            begin
               #244 clk3 <= 1'b0;
               #244 clk3 <= 1'b1;
            end
         #244 clk3 <= 1'b0;   
         #122 clk_en3 <= 1'b0; 
      end
   end

always @ (negedge f0)
   begin
      clk_en4 <= 1'b1;
      @ (negedge c4)
      begin
         #244 clk4 <= 1'b1;
         for (l=0; l<30; l=l+1) 
            begin
               #244 clk4 <= 1'b0;
               #244 clk4 <= 1'b1;
            end
         #244 clk4 <= 1'b0;   
         #122 clk_en4 <= 1'b0; 
         #122 clk4 <= 1'b1; 
         #244 clk4 <= 1'b0;  
      end
   end 

endmodule