# coremark_waves.do
add wave sim:/testbench/dut/clk
add wave sim:/testbench/dut/Instr
add wave sim:/testbench/dut/PC
add wave sim:/testbench/dut/MemEn
add wave sim:/testbench/dut/WriteEn
add wave sim:/testbench/dut/WriteByteEn
add wave sim:/testbench/dut/ieu/ReadData
add wave sim:/testbench/dut/ieu/WriteData
add wave sim:/testbench/dut/ieu/IEUAdr

run -all
view wave
