module test_uprclk1;

reg  f0, c4;

//устанавливаем экземпляр тестируемого модуля
converter converter_inst(f0, c4, 
  clk_en_tx_t, clk_en_rx_t, clk_en_tx_n, clk_en_rx_n, 
  clk_tx_t, clk_rx_t, clk_tx_n, clk_rx_n);

always  
    #122 c4 = ~c4;

always
begin
    #124756 f0 = 0;
    #244 f0 = 1'b1;
end

//от начала времени...
initial
begin
  f0 = 1'b1;
  c4 = 1'b1;
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
  $dumpvars(0,test_uprclk1);
end

//наблюдаем на некоторыми сигналами системы
initial
$monitor($stime,, f0,, c4,, 
  clk_en_tx_t,, clk_en_rx_t,, clk_en_tx_n,, clk_en_rx_n,, 
  clk_tx_t,, clk_rx_t,, clk_tx_n,, clk_rx_n);

endmodule