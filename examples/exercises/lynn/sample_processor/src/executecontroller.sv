// executecontroller.sv
// RISC-V single-cycle processor
//  jsides@hmc.edu 2026

`include "parameters.svh"

module executecontroller(
    input logic         BranchE,
    input logic         JumpE,
    input logic [2:0]   Funct3E,
    input logic         EqE,
    input logic         LtE,
    input logic         LtuE,

    output logic        PCSrcE

    `ifdef DEBUG
        , input   logic [31:0]  insn_debug
    `endif
    );
    // Evaluates whether branch/jump is taken
    assign PCSrcE = BranchE & (!Funct3E[0] == ((EqE & (Funct3E[2:1] == 2'b00)) | (LtE & (Funct3E[2:1] == 2'b10)) | (LtuE & (Funct3E[2:1] == 2'b11)))) | JumpE;


endmodule
