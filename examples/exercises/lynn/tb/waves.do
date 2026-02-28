# coremark_waves.do
add wave sim:/testbench/dut/clk
add wave sim:/testbench/dut/Instr
add wave sim:/testbench/dut/PC
add wave sim:/testbench/dut/MemEn
add wave sim:/testbench/dut/WriteEn
add wave sim:/testbench/dut/WriteByteEn
add wave sim:/testbench/dut/ieu/ReadData
add wave sim:/testbench/dut/ieu/WriteData
add wave sim:/testbench/dut/ram1p1rwb/ModRead
add wave sim:/testbench/dut/ram1p1rwb/Mem
add wave sim:/testbench/dut/ram1p1rwb/ReadData



run -all
view wave
