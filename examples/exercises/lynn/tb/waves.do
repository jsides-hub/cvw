# coremark_waves.do
add wave sim:/testbench/dut/clk
add wave sim:/testbench/dut/Instr
add wave sim:/testbench/dut/PC
add wave sim:/testbench/dut/MemEn
add wave sim:/testbench/dut/WriteEn
add wave sim:/testbench/dut/WriteByteEn

run -all
view wave
