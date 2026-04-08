// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

`include "parameters.svh"

module controller(
        input   logic [6:0]   OpD,
        input   logic [2:0]   Funct3D,
        input   logic         Funct7b5D,
        input   logic         Funct7b0D,
        input   logic         EqD,
        input   logic         LtD,
        input   logic         LtuD,

        output  logic         ALUResultSrcD,
        output  logic [1:0]   ResultSrcD,
        output  logic [3:0]   WriteByteEnD,
        output  logic         PCSrcD,
        output  logic         RegWriteD,
        output  logic [1:0]   ALUSrcD,
        output  logic [2:0]   ImmSrcD,
        output  logic [1:0]   ALUControlD,
        output  logic         MemEnD,
        output  logic         MulD,
        output  logic         JumpD,
        output  logic         BranchD,
        output  logic         AltSrcD
    `ifdef DEBUG
        , input   logic [31:0]  insn_debug
    `endif
    );

    logic SubD, ALUOpD;
    logic MemWriteD;
    logic [15:0] controls;

    // Main decoder
    always_comb
        case(OpD)
            // RegWriteD_ImmSrcD_ALUSrcD_ALUOpD_ALUResultSrcD_MemWriteD_ResultSrcD_BranchD_JumpD_Load_MulD_AltSrcD
            7'b0000011:         controls = 16'b1_000_01_0_0_0_01_0_0_1_0_0; // I-type load
            7'b0100011:         controls = 16'b0_001_01_0_0_1_00_0_0_1_0_0; // S-type
            7'b0110011: if (Funct7b0D)               controls = 16'b1_xxx_00_0_x_0_100_0_0_0_1_0; // R-type mul
                        else    controls = 16'b1_xxx_00_1_0_0_00_0_0_0_0_0; // R-type non-mul
            7'b0010011: if (Funct3D[1:0] == 2'b01)   controls = 16'b1_101_01_1_0_0_00_0_0_0_0_0; // I-type ALU uimm
                        else    controls = 16'b1_000_01_1_0_0_00_0_0_0_0_0; // I-type ALU
            7'b1100011:         controls = 16'b0_010_11_0_0_0_00_1_0_0_0_0; // B-type
            7'b1101111:         controls = 16'b1_011_11_0_1_0_00_0_1_0_0_1; // jal
            7'b0010111:         controls = 16'b1_100_11_0_0_0_00_0_0_0_0_1; // auipc
            7'b0110111:         controls = 16'b1_100_01_0_1_0_00_0_0_0_0_0; // lui
            7'b1100111:         controls = 16'b1_000_01_0_1_0_00_0_1_0_0_0; // jalr
            7'b1110011:         controls = 16'b1_xxx_xx_x_x_0_10_0_0_0_0_0; // csr
            default: begin
                `ifdef DEBUG
                    controls = 16'bx_xxx_xx_x_x_x_xx_x_x_x_x_x; // non-implemented instruction
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
    assign {RegWriteD, ImmSrcD, ALUSrcD, ALUOpD, ALUResultSrcD, MemWriteD,
        ResultSrcD, BranchD, JumpD, MemEnD, MulD, AltSrcD} = controls;

    // ALU Control Logic
    assign SubD = (ALUOpD & (((Funct3D == 3'b000) & Funct7b5D & OpD[5]) | ((Funct3D == 3'b101) & Funct7b5D) | (Funct3D == 3'b010) | (Funct3D == 3'b011))); // subtract or SLT
    assign ALUControlD = {SubD, ALUOpD};

    // PCSrcD logic
    assign PCSrcD = BranchD & (!Funct3D[0] == ((EqD & (Funct3D[2:1] == 2'b00)) | (LtD & (Funct3D[2:1] == 2'b10)) | (LtuD & (Funct3D[2:1] == 2'b11)))) | JumpD;

    // MemWriteD logic

    always_comb
        case(Funct3D)
            // 0: WriteByteEnD = {4{MemWriteD}} & (4'b0001 << Mod); // sb
            // 1: WriteByteEnD = {4{MemWriteD}} & (Mod[1] ? 4'b1100 : 4'b0011); // sh
            0: WriteByteEnD = {4{MemWriteD}} & 4'b0001; // sb
            1: WriteByteEnD = {4{MemWriteD}} & 4'b0011; // sh
            2: WriteByteEnD = {4{MemWriteD}} & 4'b1111; // sw
            default: WriteByteEnD = 4'b0000;
        endcase


endmodule
