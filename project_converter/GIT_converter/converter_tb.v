module test_converter;

reg  f0, c4, select;

//instance
converter converter_inst(f0, c4, select, clk_en_tx, clk_en_rx, clk_tx, clk_rx);

always  
    #122 c4 = ~c4;

initial
begin
  while (1)
  begin
    @ (posedge c4)
    f0 = 0;
    #244 f0 = 1'b1;
    #124756 f0 = 1'b1;
  end
end

//from begin time...
initial
begin
  f0 = 1'b1;
  c4 = 1'b0;
  select = 1'b0;

  #1500000
  select = 1'b1;
end

//end simulation in time "3000000"
initial
begin
  #3000000 $finish;
end

//creating file VCD for furure analise signals
initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,test_converter);
end

//check signals
initial
$monitor($stime,, f0,, c4,, select,,
  clk_en_tx,, clk_en_rx,, clk_tx,, clk_rx);

endmodule