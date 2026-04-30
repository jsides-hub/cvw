// riscvsingle.sv
// RISC-V single-cycle processor
// jsides@hmc.edu 2026

`include "parameters.svh"

module riscvsingle (
        input   logic           clk,
        input   logic           reset,

        output  logic [31:0]    PCF,  // instruction memory target address
        input   logic [31:0]    InstrF, // instruction memory read data

        output  logic [31:0]    IEUAdrM,  // data memory target address
        input   logic [31:0]    ReadDataM, // data memory read data
        output  logic [31:0]    WriteDataM, // data memory write data

        output  logic           MemEnM,
        output  logic           WriteEnM,
        output  logic [3:0]     WriteByteEnM,  // strobes, 1 hot stating whether a byte should be written on a store
        output  logic [2:0]     Funct3M
    );

    logic [31:0]    InstrD, PCD, PCE, ReadDataW, CSRResultW, FSrcAE, FSrcBE, ResultW, MulResW;
    logic [31:0]    IEUResultW, IEUResultM, IEUResultE, IEUAdrE, ImmExtE;
    logic           RegWriteE, RegWriteM, RegWriteW, MemEnE, MemEnD, PCSrcE, MulE, MulM;
    logic [1:0]     ResultSrcW, ResultSrcE, ALUControlE;
    logic [2:0]     Funct3E;
    logic [4:0]     RdE, RdM, RdW;
    logic [3:0]     WriteByteEnE;
    logic           StallF, StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW, JumpE, BranchE;
    logic [1:0]     ForwardAE, ForwardBE;
    logic [4:0]     Rd1D, Rd2D, Rd1E, Rd2E;
    logic           LoadE, LoadM, CSROpE, CSROpM;

    ifu ifu(.clk, .reset, .PCSrcE, .IEUAdrE, .InstrF,
            .StallF, .StallD, .FlushD,
            .PCD, .PCF, .InstrD);
    ieu ieu(.clk, .reset, .InstrD, .PCD,
            .ForwardAE, .ForwardBE, .StallE, .FlushE,
            .RegWriteW, .ResultSrcW, .IEUResultW, .ReadDataW, .CSRResultW, .MulResW, .RdW, .IEUResultM,
            .RegWriteE, .ResultSrcE, .MulE, .MemEnE, .IEUResultE, .IEUAdrE, .ImmExtE, .FSrcAE, .FSrcBE, .Funct3E, .RdE,
            .PCE, .PCSrcE, .WriteByteEnE, .ResultW,
            .Rd1D, .Rd2D, .Rd1E, .Rd2E, .MemEnD, .JumpE, .BranchE, .LoadE, .CSROpE, .ALUControlE);
    lsu lsu(.clk, .reset, .PCE, .RegWriteE, .ResultSrcE, .MulE, .MemEnE, .WriteByteEnE, .IEUResultE, .IEUResultM, .IEUAdrE, .WriteDataE(FSrcBE), .Funct3E, .RdE, .LoadE, .CSROpE,
            .StallM, .FlushM, .StallW, .FlushW, .ReadDataM,
            .IEUAdrM, .WriteDataM, .MulM, .MemEnM, .WriteByteEnM, .Funct3M,
            .RegWriteW, .ResultSrcW, .IEUResultW, .ReadDataW, .RdW, .RdM, .LoadM, .CSROpM, .RegWriteM);

    hazard hazard(.PCSrcE,
    .Rd1D, .Rd2D, .Rd1E, .Rd2E, .RdE, .RdM, .RdW, .MemEnD, .MemEnE, .LoadE, .LoadM, .MulE, .MulM, .CSROpE, .CSROpM, .RegWriteM, .RegWriteW,
    .StallF, .StallD, .FlushD, .StallE, .FlushE, .StallM, .FlushM, .StallW, .FlushW, .ForwardAE, .ForwardBE);

        //TODO: Correct signals for InstRetW and BranchEvalE
    csr csr(.clk, .reset, .StallM, .FlushM, .StallW, .FlushW, .CSRVal(ImmExtE[11:0]), .Funct3E, .ResultSrcE, .ALUControlE,
    .InstRetW(ResultW != 32'b0), .BranchEvalE(BranchE), .BranchTakenE(BranchE&PCSrcE), .JumpE, .WriteEnM, .MemEnM, .CSRResultW);

    multiplier mul(.clk, .reset, .StallM, .FlushM, .StallW, .FlushW, .FSrcAE, .FSrcBE, .Funct3E, .MulResW);

    assign WriteEnM = |WriteByteEnM;
endmodule
