// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020 kacassidy@hmc.edu 2025

module lsu(
        input   logic           clk, reset,
        input   logic           RegWriteE,
        input   logic [2:0]     ResultSrcE,
        input   logic           MemEnE,
        input   logic [3:0]     WriteByteEnE,
        input   logic [31:0]    IEUResultE,
        input   logic [31:0]    IEUAdrE,
        input   logic [31:0]    WriteDataE,
        input   logic [2:0]     Funct3E,
        input   logic [4:0]     RdE,
        input   logic [31:0]    ImmExtE,

        input   logic           StallM,
        input   logic           FlushM,
        input   logic           StallW,
        input   logic           FlushW,

        output  logic [31:0]    IEUAdrM,
        output  logic [31:0]    WriteDataM,
        output  logic           MemEnM,
        output  logic [3:0]     WriteByteEnM,
        output  logic [2:0]     Funct3M,

        output  logic           RegWriteW,
        output  logic [2:0]     ResultSrcW,
        output  logic [31:0]    IEUResultW,
        output  logic [31:0]    ReadDataW,
        output  logic [4:0]     RdW,
        output  logic [31:0]    ImmExtW
    );

    logic           RegWriteM;
    logic [2:0]     ResultSrcM;
    logic [31:0]    IEUResultM;
    logic [4:0]     RdM;
    logic [31:0]    ImmExtM;

    flopenrc RegWriteEM(.clk, .reset, ~StallM, FlushM, RegWriteE, RegWriteM);
    flopenrc ResultSrcEM(.clk, .reset, ~StallM, FlushM, ResultSrcE, ResultSrcM);
    flopenrc MemEnEM(.clk, .reset, ~StallM, FlushM, MemEnE, MemEnM);
    flopenrc WriteByteEnEM(.clk, .reset, ~StallM, FlushM, WriteByteEnE, WriteByteEnM);
    flopenrc IEUResultEM(.clk, .reset, ~StallM, FlushM, IEUResultE, IEUResultM);
    flopenrc IEUAdrEM(.clk, .reset, ~StallM, FlushM, IEUAdrE, IEUAdrM);
    flopenrc WriteDataEM(.clk, .reset, ~StallM, FlushM, WriteDataE, WriteDataM);
    flopenrc Funct3EM(.clk, .reset, ~StallM, FlushM, Funct3E, Funct3M);
    flopenrc RdEM(.clk, .reset, ~StallM, FlushM, RdE, RdM);
    flopenrc ImmExtEM(.clk, .reset, ~StallM, FlushM, ImmExtE, ImmExtM);

    flopenrc RegWriteMW(.clk, .reset, ~StallW, FlushW, RegWriteM, RegWriteW);
    flopenrc ResultSrcMW(.clk, .reset, ~StallW, FlushW, ResultSrcM, ResultSrcW);
    flopenrc IEUResultMW(.clk, .reset, ~StallW, FlushW, IEUResultM, IEUResultW);
    flopenrc ReadDataMW(.clk, .reset, ~StallW, FlushW, ReadDataM, ReadDataW);
    flopenrc RdMW(.clk, .reset, ~StallW, FlushW, RdM, RdW);
    flopenrc ImmExtMW(.clk, .reset, ~StallW, FlushW, ImmExtM, ImmExtW);

endmodule
