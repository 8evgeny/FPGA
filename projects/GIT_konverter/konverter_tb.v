module test_converter;

reg  f0, c4, select;

//устанавливаем экземпляр тестируемого модуля
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

//от начала времени...
initial
begin
  f0 = 1'b1;
  c4 = 1'b0;
  select = 1'b0;

  #1500000
  select = 1'b1;
end

//заканчиваем симуляцию в момент времени "3000000"
initial
begin
  #3000000 $finish;
end

//создаем файл VCD для последующего анализа сигналов
initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,test_converter);
end

//наблюдаем на некоторыми сигналами системы
initial
$monitor($stime,, f0,, c4,, select,,
  clk_en_tx,, clk_en_rx,, clk_tx,, clk_rx);

endmodule