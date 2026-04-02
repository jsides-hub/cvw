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
        input   logic [31:0]    ReadDataM,

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

    flopenrc #(1) RegWriteEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(RegWriteE), .Q(RegWriteM));
    flopenrc #(3) ResultSrcEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ResultSrcE), .Q(ResultSrcM));
    flopenrc #(1) MemEnEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(MemEnE), .Q(MemEnM));
    flopenrc #(4) WriteByteEnEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(WriteByteEnE), .Q(WriteByteEnM));
    flopenrc #(32) IEUResultEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(IEUResultE), .Q(IEUResultM));
    flopenrc #(32) IEUAdrEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(IEUAdrE), .Q(IEUAdrM));
    flopenrc #(32) WriteDataEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(WriteDataE), .Q(WriteDataM));
    flopenrc #(3) Funct3EM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(Funct3E), .Q(Funct3M));
    flopenrc #(5) RdEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(RdE), .Q(RdM));
    flopenrc #(32) ImmExtEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ImmExtE), .Q(ImmExtM));

    flopenrc #(1) RegWriteMW(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(RegWriteM), .Q(RegWriteW));
    flopenrc #(3) ResultSrcMW(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ResultSrcM), .Q(ResultSrcW));
    flopenrc #(32) IEUResultMW(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(IEUResultM), .Q(IEUResultW));
    flopenrc #(32) ReadDataMW(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ReadDataM), .Q(ReadDataW));
    flopenrc #(5) RdMW(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(RdM), .Q(RdW));
    flopenrc #(32) ImmExtMW(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ImmExtM), .Q(ImmExtW));

endmodule
