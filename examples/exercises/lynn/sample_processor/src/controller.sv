// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

`include "parameters.svh"

module controller(
        input   logic [6:0]   Op,
        input   logic         Eq,
        input   logic         Lt,
        input   logic         Ltu,
        input   logic [2:0]   Funct3,
        input   logic         Funct7b5,
        output  logic         ALUResultSrc,
        output  logic [1:0]   ResultSrc,
        output  logic [3:0]   WriteByteEn,
        output  logic         PCSrc,
        output  logic         RegWrite,
        output  logic [1:0]   ALUSrc,
        output  logic [2:0]   ImmSrc,
        output  logic [1:0]   ALUControl,
        output  logic         MemEn
    `ifdef DEBUG
        , input   logic [31:0]  insn_debug
    `endif
    );

    logic Branch, Jump;
    logic Sub, ALUOp;
    logic MemWrite;
    logic [13:0] controls;

    // Main decoder
    always_comb
        case(Op)
            // RegWrite_ImmSrc_ALUSrc_ALUOp_ALUResultSrc_MemWrite_ResultSrc_Branch_Jump_Load
            7'b0000011:         controls = 14'b1_000_01_0_0_0_01_0_0_1; // I-type load
            7'b0100011:         controls = 14'b0_001_01_0_0_1_00_0_0_1; // S-type
            7'b0110011:         controls = 14'b1_xxx_00_1_0_0_00_0_0_0; // R-type
            7'b0010011: if (Funct3[1:0] == 2'b01)   controls = 14'b1_101_01_1_0_0_00_0_0_0; // I-type ALU
                        else    controls = 14'b1_000_01_1_0_0_00_0_0_0; // I-type ALU uimm
            7'b1100011:         controls = 14'b0_010_11_0_0_0_00_1_0_0; // B-type
            7'b1101111:         controls = 14'b1_011_11_0_1_0_00_0_1_0; // jal
            7'b0010111:         controls = 14'b1_100_11_0_0_0_00_0_0_0; // auipc
            7'b0110111:         controls = 14'b1_100_01_0_0_0_10_0_0_0; // lui
            7'b1100111:         controls = 14'b1_000_01_x_1_x_00_0_1_0; // jalr TODO: add control signals
            default: begin
                `ifdef DEBUG
                    controls = 14'bx_xx_xx_x_x_x_x_x_x_x; // non-implemented instruction
                    if ((insn_debug !== 'x)) begin
                        $display("Instruction not implemented: %h", insn_debug);
                        $finish(-1);
                    end
                `else
                    controls = 14'b0; // non-implemented instruction
                `endif
            end
        endcase

    assign {RegWrite, ImmSrc, ALUSrc, ALUOp, ALUResultSrc, MemWrite,
        ResultSrc, Branch, Jump, MemEn} = controls;

    // ALU Control Logic
    assign Sub = (ALUOp & (((Funct3 == 3'b000) & Funct7b5 & Op[5]) | ((Funct3 == 3'b101) & Funct7b5) | (Funct3 == 3'b010) | (Funct3 == 3'b011))); // subtract or SLT
    assign ALUControl = {Sub, ALUOp};

    // PCSrc logic
    assign PCSrc = Branch & (!Funct3[0] == ((Eq & (Funct3[2:1] == 2'b00)) | (Lt & (Funct3[2:1] == 2'b10)) | (Ltu & (Funct3[2:1] == 2'b11)))) | Jump;






    //beq: 000, bne: 001, blt: 100, bge: 101, bltu: 110, bgeu: 111

    // MemWrite logic
    always_comb
        case(Funct3)
            0: WriteByteEn = {4{MemWrite}} & 4'b0001; // sb
            1: WriteByteEn = {4{MemWrite}} & 4'b0011; // sh
            2: WriteByteEn = {4{MemWrite}} & 4'b1111; // sw
            default: WriteByteEn = 4'b0000;
        endcase
endmodule
