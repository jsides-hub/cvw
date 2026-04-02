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

    logic [31:0]    InstrD, PCD, ReadDataW, CSRResultW, ImmExtW, ImmExtE, FSrcBE, ResultW
    logic [31:0]    IEUResultW, IEUResultM, IEUResultE, IEUAdrE
    logic           RegWriteW, RegWriteE, MemEnE, PCSrcD
    logic [2:0]     ResultSrcW, ResultSrcE, Funct3E
    logic [4:0]     RdW, RdE
    logic [3:0]     WriteByteEnE

    ifu ifu()
    ieu ieu(.clk, .reset, .InstrD, .PCD,
            .ForwardAE, .ForwardBE, .StallE, .FlushE,
            .RegWriteW, .ResultSrcW, .IEUResultW, .ReadDataW, .CSRResultW, .ImmExtW, .RdW, .IEUResultM,
            .RegWriteE, .ResultSrcE, .MemEnE, .IEUResultE, .IEUAdrE, .FSrcBE, .Funct3E, .RdE, .ImmExtE,
            .PCSrcD, .WriteByteEnE, .ResultW);
    lsu lsu(.clk, .reset, .RegWriteE, .ResultSrcE, .MemEnE, .WriteByteEnE, .IEUResultE, .IEUAdrE, .WriteDataE(FSrcBE), .Funct3E, .RdE, .ImmExtE,
            .StallM, .FlushM, .StallW, .FlushW,
            .IEUAdrM, .WriteDataM, MemEnM, .WriteByteEnM, .Funct3M,
            .RegWriteW, .ResultSrcW, .IEUResultW, .ReadDataW, .RdW, .ImmExtW)



    csr csr(.clk, .reset, .Instr, .BranchTaken(PCSrc), .WriteEn, .MemEn, .CSRResult);

    assign WriteEnM = |WriteByteEnM;
endmodule
