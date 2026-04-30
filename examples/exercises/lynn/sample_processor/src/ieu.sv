// ieu.sv
// RISC-V single-cycle processor
// jsides@hmc.edu 2026

`include "parameters.svh"

module ieu(
        input   logic           clk, reset,
        input   logic [31:0]    InstrD,
        input   logic [31:0]    PCD,

        input   logic [1:0]     ForwardAE,
        input   logic [1:0]     ForwardBE,
        input   logic           StallE,
        input   logic           FlushE,

        input   logic           RegWriteW,
        input   logic [1:0]     ResultSrcW,
        input   logic [31:0]    IEUResultW,
        input   logic [31:0]    ReadDataW,
        input   logic [31:0]    CSRResultW,
        input   logic [31:0]    MulResW,
        input   logic [4:0]     RdW,
        input   logic [31:0]    IEUResultM,

        output  logic [31:0]    PCE,
        output  logic           RegWriteE,
        output  logic [1:0]     ResultSrcE,
        output  logic           MulE,
        output  logic           MemEnE,
        output  logic [31:0]    IEUResultE,
        output  logic [31:0]    ImmExtE,
        output  logic [31:0]    IEUAdrE,
        output  logic [31:0]    FSrcAE,
        output  logic [31:0]    FSrcBE,
        output  logic [2:0]     Funct3E,
        output  logic [4:0]     RdE,

        output  logic           PCSrcE,
        output  logic [3:0]     WriteByteEnE,

        output  logic [31:0]    ResultW,

        output  logic [4:0]     Rd1D, Rd2D, Rd1E, Rd2E,
        output  logic           MemEnD,
        output  logic           JumpE, BranchE, LoadE, CSROpE,
        output  logic [1:0]     ALUControlE
    );
    logic [2:0] Funct3D;
    logic ALUResultSrcD;
    logic [1:0] ResultSrcD;
    logic [3:0] WriteByteEnD;
    logic       RegWriteD;
    logic [1:0] ALUSrcD;
    logic [2:0] ImmSrcD;
    logic [1:0] ALUControlD;
    logic       MulD;
    logic       JumpD, BranchD, AltSrcD, LoadD, CSROpD;


    assign Funct3D = InstrD[14:12];

    controller c(.OpD(InstrD[6:0]), .Funct3D, .Funct7b5D(InstrD[30]), .Funct7b0D(InstrD[25]),
        .ALUResultSrcD, .ResultSrcD, .WriteByteEnD,
        .RegWriteD, .ALUSrcD, .ImmSrcD, .ALUControlD, .MemEnD, .MulD, .JumpD, .BranchD, .AltSrcD, .LoadD, .CSROpD
    `ifdef DEBUG
        , .insn_debug(InstrD)
    `endif
    );

    datapath dp(.clk, .reset, .InstrD, .Funct3D, .PCD,
                .ALUResultSrcD, .ResultSrcD, .RegWriteD, .ALUSrcD, .ImmSrcD, .ALUControlD, .MulD, .JumpD, .BranchD, .LoadD, .CSROpD, .RegWriteW, .MemEnD, .WriteByteEnD, .AltSrcD,
                .ForwardAE, .ForwardBE, .StallE, .FlushE,
                .ResultSrcW, .IEUResultM, .RdW,
                .ReadDataW, .IEUResultW, .CSRResultW, .MulResW,
                .PCE, .PCSrcE, .RegWriteE, .MemEnE, .WriteByteEnE, .Funct3E, .ResultSrcE, .RdE, .FSrcAE, .FSrcBE, .IEUAdrE, .IEUResultE, .ImmExtE, .ResultW,
                .Rd1D, .Rd2D, .Rd1E, .Rd2E, .MulE, .JumpE, .BranchE, .LoadE, .CSROpE, .ALUControlE);
endmodule
