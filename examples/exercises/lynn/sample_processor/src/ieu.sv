// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

`include "parameters.svh"

module ieu(
        input   logic           clk, reset,
        input   logic [31:0]    Instr,
        input   logic [31:0]    PC, PCPlus4,
        input   logic [31:0]    CSRResult,
        output  logic           PCSrc,
        output  logic [3:0]     WriteByteEn,
        output  logic [31:0]    IEUAdr, WriteData,
        input   logic [31:0]    ReadData,
        output  logic           MemEn,
        output  logic [2:0]     Funct3,
        output  logic[31:0]     Result

    );

    logic RegWrite, Jump, Eq, ALUResultSrc;
    logic [1:0] ALUSrc;
    logic [2:0]  ResultSrc, ImmSrc;
    logic [1:0] ALUControl;
    logic Lt, Ltu, IEUSrc, Mul;
    assign Funct3 = Instr[14:12];

    controller c(.Op(Instr[6:0]), .Funct3, .Funct7b5(Instr[30]), .Funct7b0(Instr[25]), .Mod(Instr[8:7]), .Eq, .Lt, .Ltu,
        .ALUResultSrc, .ResultSrc, .WriteByteEn, .PCSrc,
        .ALUSrc, .RegWrite, .ImmSrc, .ALUControl, .MemEn, .Mul
    `ifdef DEBUG
        , .insn_debug(Instr)
    `endif
    );

    datapath dp(.clk, .reset, .Funct3,
        .ALUResultSrc, .ResultSrc, .ALUSrc, .RegWrite, .ImmSrc, .ALUControl, .CSRResult, .Mul, .Eq, .Lt, .Ltu,
        .PC, .PCPlus4, .Instr, .IEUAdr, .WriteData, .Result, .ReadData);
endmodule
