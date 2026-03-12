// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

`include "parameters.svh"

module controller(
        input   logic [6:0]   Op,
        input   logic [2:0]   Funct3,
        input   logic         Funct7b5,
        input   logic         Funct7b0,
        input   logic [1:0]   Mod,
        input   logic         Eq,
        input   logic         Lt,
        input   logic         Ltu,
        output  logic         ALUResultSrc,
        output  logic [2:0]   ResultSrc,
        output  logic [3:0]   WriteByteEn,
        output  logic         PCSrc,
        output  logic         RegWrite,
        output  logic [1:0]   ALUSrc,
        output  logic [2:0]   ImmSrc,
        output  logic [1:0]   ALUControl,
        output  logic         MemEn,
        output  logic         Mul
    `ifdef DEBUG
        , input   logic [31:0]  insn_debug
    `endif
    );

    logic Branch, Jump;
    logic Sub, ALUOp;
    logic MemWrite;
    logic [15:0] controls;

    // Main decoder
    always_comb
        case(Op)
            // RegWrite_ImmSrc_ALUSrc_ALUOp_ALUResultSrc_MemWrite_ResultSrc_Branch_Jump_Load_Mul
            7'b0000011:         controls = 16'b1_000_01_0_0_0_001_0_0_1_0; // I-type load
            7'b0100011:         controls = 16'b0_001_01_0_0_1_000_0_0_1_0; // S-type
            7'b0110011: if (Funct7b0)               controls = 16'b1_xxx_00_0_x_0_100_0_0_0_1; // R-type mul
                        else    controls = 16'b1_xxx_00_1_0_0_000_0_0_0_0; // R-type non-mul
            7'b0010011: if (Funct3[1:0] == 2'b01)   controls = 16'b1_101_01_1_0_0_000_0_0_0_0; // I-type ALU uimm
                        else    controls = 16'b1_000_01_1_0_0_000_0_0_0_0; // I-type ALU
            7'b1100011:         controls = 16'b0_010_11_0_0_0_000_1_0_0_0; // B-type
            7'b1101111:         controls = 16'b1_011_11_0_1_0_000_0_1_0_0; // jal
            7'b0010111:         controls = 16'b1_100_11_0_0_0_000_0_0_0_0; // auipc
            7'b0110111:         controls = 16'b1_100_01_0_0_0_010_0_0_0_0; // lui
            7'b1100111:         controls = 16'b1_000_01_0_1_0_000_0_1_0_0; // jalr
            7'b1110011:         controls = 16'b1_xxx_xx_x_x_0_011_0_0_0_0; // csr
            default: begin
                `ifdef DEBUG
                    controls = 16'bx_xxx_xx_x_x_x_xxx_x_x_x_x; // non-implemented instruction
                    if ((insn_debug !== 'x)) begin
                        $display("Instruction not implemented: %h", insn_debug);
                        $finish(-1);
                    end
                `else
                    controls = 16'b0; // non-implemented instruction
                `endif
            end
        endcase
    // TODO: Align control signals
    assign {RegWrite, ImmSrc, ALUSrc, ALUOp, ALUResultSrc, MemWrite,
        ResultSrc, Branch, Jump, MemEn, Mul} = controls;

    // ALU Control Logic
    assign Sub = (ALUOp & (((Funct3 == 3'b000) & Funct7b5 & Op[5]) | ((Funct3 == 3'b101) & Funct7b5) | (Funct3 == 3'b010) | (Funct3 == 3'b011))); // subtract or SLT
    assign ALUControl = {Sub, ALUOp};

    // PCSrc logic
    assign PCSrc = Branch & (!Funct3[0] == ((Eq & (Funct3[2:1] == 2'b00)) | (Lt & (Funct3[2:1] == 2'b10)) | (Ltu & (Funct3[2:1] == 2'b11)))) | Jump;

    // MemWrite logic

    always_comb
        case(Funct3)
            // 0: WriteByteEn = {4{MemWrite}} & (4'b0001 << Mod); // sb
            // 1: WriteByteEn = {4{MemWrite}} & (Mod[1] ? 4'b1100 : 4'b0011); // sh
            0: WriteByteEn = {4{MemWrite}} & 4'b0001; // sb
            1: WriteByteEn = {4{MemWrite}} & 4'b0011; // sh
            2: WriteByteEn = {4{MemWrite}} & 4'b1111; // sw
            default: WriteByteEn = 4'b0000;
        endcase


endmodule
