echo "Начать компиляцию"
iverilog -o counter counter.v counter_tb.v
echo «Компиляция завершена»
vvp -n counter -lxt2
echo «Создать волновой файл»
cp out.vcd out.lxt
echo «Открыть файл волны»
gtkwave out.lxt
