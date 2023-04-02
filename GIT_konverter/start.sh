#!/bin/sh
echo "Начать компиляцию"
iverilog -o konverter konverter.v konverter_tb.v
echo «Компиляция завершена»
vvp -n konverter -lxt2
echo «Создать волновой файл»
cp out.vcd out.lxt
echo «Открыть файл волны»
gtkwave out.lxt
