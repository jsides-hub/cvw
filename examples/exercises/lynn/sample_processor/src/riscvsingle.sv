// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020 kacassidy@hmc.edu 2025

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

    logic [31:0]    InstrD, PCD, ReadDataW, CSRResultW, FSrcBE, ResultW;
    logic [31:0]    IEUResultW, IEUResultM, IEUResultE, IEUAdrE;
    logic           RegWriteE, RegWriteM, RegWriteW, MemEnE, MemEnD, PCSrcE;
    logic [1:0]     ResultSrcW, ResultSrcE;
    logic [2:0]     Funct3E;
    logic [4:0]     RdE, RdM, RdW;
    logic [3:0]     WriteByteEnE;
    logic           StallF, StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW, JumpE, BranchE;
    logic [1:0]     ForwardAE, ForwardBE;
    logic [4:0]     Rd1D, Rd2D, Rd1E, Rd2E;
    logic           LoadD, LoadE;

    ifu ifu(.clk, .reset, .PCSrcE, .IEUAdrE, .InstrF,
            .StallF, .StallD, .FlushD,
            .PCD, .PCF, .InstrD);
    ieu ieu(.clk, .reset, .InstrD, .PCD,
            .ForwardAE, .ForwardBE, .StallE, .FlushE,
            .RegWriteW, .ResultSrcW, .IEUResultW, .ReadDataW, .CSRResultW, .RdW, .IEUResultM,
            .RegWriteE, .ResultSrcE, .MemEnE, .IEUResultE, .IEUAdrE, .FSrcBE, .Funct3E, .RdE,
            .PCSrcE, .WriteByteEnE, .ResultW,
            .Rd1D, .Rd2D, .Rd1E, .Rd2E, .MemEnD, .JumpE, .BranchE, .LoadD, .LoadE);
    lsu lsu(.clk, .reset, .RegWriteE, .ResultSrcE, .MemEnE, .WriteByteEnE, .IEUResultE, .IEUResultM, .IEUAdrE, .WriteDataE(FSrcBE), .Funct3E, .RdE,
            .StallM, .FlushM, .StallW, .FlushW, .ReadDataM,
            .IEUAdrM, .WriteDataM, .MemEnM, .WriteByteEnM, .Funct3M,
            .RegWriteW, .ResultSrcW, .IEUResultW, .ReadDataW, .RdW, .RdM, .RegWriteM);

    hazard hazard(.InstrF, .InstrD, .PCSrcE,
    .Rd1D, .Rd2D, .Rd1E, .Rd2E, .RdE, .RdM, .RdW, .MemEnD, .MemEnE, .LoadD, .LoadE, .RegWriteM, .RegWriteW,
    .StallF, .StallD, .FlushD, .StallE, .FlushE, .StallM, .FlushM, .StallW, .FlushW, .ForwardAE, .ForwardBE);

    // csr csr(.clk, .reset, .Instr, .BranchTaken(PCSrc), .WriteEn, .MemEn, .CSRResult);

    assign WriteEnM = |WriteByteEnM;
endmodule
