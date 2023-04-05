#!/bin/sh
echo "Начать компиляцию"
iverilog -o converter converter.v converter_tb.v
echo «Компиляция завершена»
vvp -n converter -lxt2
echo «Создать волновой файл»
cp out.vcd out.lxt
echo «Открыть файл волны»
gtkwave out.lxt
rm out.lxt out.vcd converter