module test_converter;

reg f0,
    c4,
    select,
    data_from_dt,
    data_from_stm,
    clk_from_stm,
    reset_out_rg,
    reset_in_rg;

//instance
converter converter_inst(
    f0,
    c4,
    select,
    data_from_dt,
    data_from_stm,
    clk_from_stm,
    reset_out_rg,
    reset_in_rg,
    data_to_dt,
    data_to_stm,
    cpu_int
  );

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
  data_from_dt = 1'b0;
  data_from_stm = 1'b0;
  clk_from_stm = 1'b0;
  reset_out_rg = 1'b0;
  reset_in_rg = 1'b0;

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
$monitor(
  $stime,, 
    f0,,
    c4,,
    select,,
    data_from_dt,,
    data_from_stm,,
    clk_from_stm,,
    reset_out_rg,,
    reset_in_rg,,
    data_to_dt,,
    data_to_stm,,
    cpu_int
  );

endmodule