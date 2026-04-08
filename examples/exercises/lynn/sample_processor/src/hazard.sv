// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020 kacassidy@hmc.edu 2025

`include "parameters.svh"

module hazard(
        input   logic [31:0]    InstrF, InstrD,
        input   logic           JumpE, BranchE,

        input   logic [4:0]     Rd1D,
        input   logic [4:0]     Rd2D,
        input   logic [4:0]     Rd1E,
        input   logic [4:0]     Rd2E,
        input   logic [4:0]     RdE,
        input   logic [4:0]     RdM,
        input   logic [4:0]     RdW,
        input   logic           MemEnD,
        input   logic           MemEnE,
        input   logic           RegWriteM,
        input   logic           RegWriteW,

        output  logic           StallF,
        output  logic           StallD,
        output  logic           FlushD,
        output  logic           StallE,
        output  logic           FlushE,
        output  logic           StallM,
        output  logic           FlushM,
        output  logic           StallW,
        output  logic           FlushW,
        output  logic [1:0]     ForwardAE,
        output  logic [1:0]     ForwardBE
);
        forward forward(.Rd1E, .Rd2E, .RdM, .RdW, .RegWriteM, .RegWriteW, .ForwardAE, .ForwardBE);
        logic JumpBranch, LoadUseHazard;
        assign JumpBranch = (~JumpE) & ({InstrF[6:4], InstrF[2:0]} == 6'b110111);
        assign LoadUseHazard = (((Rd1D == RdE) & (Rd1D != RdM)) | ((Rd2D == RdE) & (Rd2D != RdM))) & (InstrD[6:0] == 7'b0000011);

        assign StallF =  JumpBranch | LoadUseHazard; //TODO: Fix for jump -> jump
        assign StallD = LoadUseHazard;
        // Stall F and D when load/use error - R1D or R2D equals RdE but not RdM TODO: update for when consec instructions have same Rd
        assign StallE = 1'b0;
        assign StallM = 1'b0;
        assign StallW = 1'b0;
        assign FlushD = 1'b0;
        assign FlushE = 1'b0;
        assign FlushM = 1'b0;
        assign FlushW = 1'b0;

endmodule
