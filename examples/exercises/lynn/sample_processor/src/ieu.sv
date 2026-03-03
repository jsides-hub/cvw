// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

`include "parameters.svh"

module ieu(
        input   logic           clk, reset,
        input   logic [31:0]    Instr,
        input   logic [31:0]    PC, PCPlus4,
        output  logic           PCSrc,
        output  logic [3:0]     WriteByteEn,
        output  logic [31:0]    IEUAdr, WriteData,
        input   logic [31:0]    ReadData,
        output  logic           MemEn,
        output  logic [2:0]     Funct3,
        output  logic[31:0]     Result

    );

    logic RegWrite, Jump, Eq, ALUResultSrc;
    logic [1:0] ALUSrc, ResultSrc;
    logic [2:0] ImmSrc;
    logic [1:0] ALUControl;
    logic Lt, Ltu, IEUSrc;
    assign Funct3 = Instr[14:12];

    controller c(.Op(Instr[6:0]), .Funct3, .Funct7b5(Instr[30]), .Mod(Instr[8:7]), .Eq, .Lt, .Ltu,
        .ALUResultSrc, .ResultSrc, .WriteByteEn, .PCSrc,
        .ALUSrc, .RegWrite, .ImmSrc, .ALUControl, .MemEn
    `ifdef DEBUG
        , .insn_debug(Instr)
    `endif
    );

    datapath dp(.clk, .reset, .Funct3,
        .ALUResultSrc, .ResultSrc, .ALUSrc, .RegWrite, .ImmSrc, .ALUControl, .Eq, .Lt, .Ltu,
        .PC, .PCPlus4, .Instr, .IEUAdr, .WriteData, .Result, .ReadData);
endmodule
