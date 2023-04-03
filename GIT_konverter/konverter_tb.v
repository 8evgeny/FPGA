module test_uprclk1;

reg  f0, c4;

//устанавливаем экземпляр тестируемого модуля
counter2 uprclk1_inst(f0, c4, clk_en1, clk_en2, clk1, clk2);

always  
    #125 c4 = ~c4;

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

//заканчиваем симуляцию в момент времени "1500000"
initial
begin
  #1500000 $finish;
end

//создаем файл VCD для последующего анализа сигналов
initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,test_uprclk1);
end

//наблюдаем на некоторыми сигналами системы
initial
$monitor($stime,, f0,, c4,, clk_en1,, clk1 );

endmodule