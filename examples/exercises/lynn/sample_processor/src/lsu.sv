// lsu.sv
// RISC-V single-cycle processor
//  jsides@hmc.edu 2026

module lsu(
        input   logic           clk, reset,
        input   logic [31:0]    PCE,
        input   logic           RegWriteE,
        input   logic [1:0]     ResultSrcE,
        input   logic           MemEnE,
        input   logic [3:0]     WriteByteEnE,
        input   logic [31:0]    IEUResultE,
        input   logic [31:0]    IEUAdrE,
        input   logic [31:0]    WriteDataE,
        input   logic [2:0]     Funct3E,
        input   logic [4:0]     RdE,
        input   logic           LoadE,
        input   logic           CSROpE,

        input   logic           StallM,
        input   logic           FlushM,
        input   logic           StallW,
        input   logic           FlushW,
        input   logic [31:0]    ReadDataM,

        output  logic [31:0]    IEUAdrM,
        output   logic [31:0]   IEUResultM,

        output  logic [31:0]    WriteDataM,
        output  logic           MemEnM,
        output  logic [3:0]     WriteByteEnM,
        output  logic [2:0]     Funct3M,

        output  logic           RegWriteW,
        output  logic [1:0]     ResultSrcW,
        output  logic [31:0]    IEUResultW,
        output  logic [31:0]    ReadDataW,
        output  logic [4:0]     RdW,
        output  logic [4:0]     RdM,
        output  logic           LoadM,
        output  logic           CSROpM,
        output  logic           RegWriteM
    );

    logic [1:0]     ResultSrcM;
    logic [31:0]    PCM, PCW;  // not used, just for ease of reading waveforms
    // M stage flops
    flopenrc #(1) LoadEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(LoadE), .Q(LoadM));
    flopenrc #(1) CSROpEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(CSROpE), .Q(CSROpM));
    flopenrc #(1) RegWriteEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(RegWriteE), .Q(RegWriteM));
    flopenrc #(2) ResultSrcEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ResultSrcE), .Q(ResultSrcM));
    flopenrc #(1) MemEnEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(MemEnE), .Q(MemEnM));
    flopenrc #(4) WriteByteEnEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(WriteByteEnE), .Q(WriteByteEnM));
    flopenrc #(32) IEUResultEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(IEUResultE), .Q(IEUResultM));
    flopenrc #(32) IEUAdrEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(IEUAdrE), .Q(IEUAdrM));
    flopenrc #(32) WriteDataEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(WriteDataE), .Q(WriteDataM));
    flopenrc #(3) Funct3EM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(Funct3E), .Q(Funct3M));
    flopenrc #(5) RdEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(RdE), .Q(RdM));
    flopenrc #(32) PCEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(PCE), .Q(PCM)); // not used, just for ease of reading waveforms

    // W stage flops
    flopenrc #(1) RegWriteMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(RegWriteM), .Q(RegWriteW));
    flopenrc #(2) ResultSrcMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(ResultSrcM), .Q(ResultSrcW));
    flopenrc #(32) IEUResultMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(IEUResultM), .Q(IEUResultW));
    flopenrc #(32) ReadDataMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(ReadDataM), .Q(ReadDataW));
    flopenrc #(5) RdMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(RdM), .Q(RdW));
    flopenrc #(32) PCMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(PCM), .Q(PCW)); // not used, just for ease of reading waveforms



endmodule
