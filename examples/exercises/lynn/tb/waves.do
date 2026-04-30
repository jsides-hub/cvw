# coremark_waves.do

add wave sim:/testbench/dut/mul/*
add wave sim:/testbench/dut/ieu/dp/*

add wave sim:/testbench/dut/PCF
add wave sim:/testbench/dut/PCD
add wave sim:/testbench/dut/PCE
add wave sim:/testbench/dut/PCE
add wave sim:/testbench/dut/lsu/PCM
add wave sim:/testbench/dut/lsu/PCW



run -all
view wave
