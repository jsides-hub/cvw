# coremark_waves.do
add wave sim:/testbench/dut/clk
add wave sim:/testbench/dut/Instr
add wave sim:/testbench/dut/PC
add wave sim:/testbench/dut/ieu/c/Eq
add wave sim:/testbench/dut/ieu/c/Lt
add wave sim:/testbench/dut/ieu/c/Ltu
add wave sim:/testbench/dut/ieu/dp/alu/SrcA
add wave sim:/testbench/dut/ieu/dp/alu/SrcB
add wave sim:/testbench/dut/IEUAdr



run -all
view wave
