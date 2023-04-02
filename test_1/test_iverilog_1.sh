echo "Начать компиляцию"
iverilog -o wave led_demo.v led_demo_tb.v
echo «Компиляция завершена»
vvp -n wave -lxt2
echo «Создать волновой файл»
cp wave.vcd wave.lxt
echo «Открыть файл волны»
gtkwave wave.lxt