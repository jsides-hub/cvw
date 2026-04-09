# coremark_waves.do

add wave sim:/testbench/dut/ifu/PCF
add wave sim:/testbench/dut/hazard/StallF

add wave sim:/testbench/dut/ieu/dp/PCD
add wave sim:/testbench/dut/ieu/dp/InstrD
add wave sim:/testbench/dut/ieu/dp/Rd1D
add wave sim:/testbench/dut/ieu/dp/R1D
add wave sim:/testbench/dut/ieu/dp/Rd2D
add wave sim:/testbench/dut/ieu/dp/R2D
add wave sim:/testbench/dut/hazard/StallD
add wave sim:/testbench/dut/hazard/FlushD

add wave sim:/testbench/dut/ieu/dp/ForwardAE
add wave sim:/testbench/dut/ieu/dp/ForwardBE
add wave sim:/testbench/dut/ieu/dp/R1E
add wave sim:/testbench/dut/ieu/dp/R2E
add wave sim:/testbench/dut/ieu/dp/FSrcAE
add wave sim:/testbench/dut/ieu/dp/FSrcBE
add wave sim:/testbench/dut/ieu/dp/SrcAE
add wave sim:/testbench/dut/ieu/dp/SrcBE
add wave sim:/testbench/dut/ieu/dp/ImmExtE
add wave sim:/testbench/dut/ieu/dp/AltResultE
add wave sim:/testbench/dut/ieu/dp/ALUResultE
add wave sim:/testbench/dut/ieu/dp/IEUResultE
add wave sim:/testbench/dut/ieu/dp/IEUAdrE
add wave sim:/testbench/dut/hazard/ForwardAE
add wave sim:/testbench/dut/hazard/ForwardBE
add wave sim:/testbench/dut/hazard/StallE
add wave sim:/testbench/dut/hazard/FlushE

add wave sim:/testbench/dut/ieu/dp/IEUResultM
add wave sim:/testbench/dut/hazard/StallM
add wave sim:/testbench/dut/hazard/FlushM

add wave sim:/testbench/dut/ieu/dp/ReadDataW
add wave sim:/testbench/dut/ieu/dp/IEUResultW
add wave sim:/testbench/dut/ieu/dp/ResultSrcW
add wave sim:/testbench/dut/ieu/dp/ResultW
add wave sim:/testbench/dut/ieu/dp/RdW
add wave sim:/testbench/dut/hazard/StallW
add wave sim:/testbench/dut/hazard/FlushW

add wave sim:/testbench/dut/hazard/forward/*


run -all
view wave
