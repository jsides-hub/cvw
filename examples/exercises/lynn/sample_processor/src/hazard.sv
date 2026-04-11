// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020 kacassidy@hmc.edu 2025

`include "parameters.svh"

module hazard(
        input   logic [31:0]    InstrF, InstrD,
        input   logic           PCSrcE,

        input   logic [4:0]     Rd1D,
        input   logic [4:0]     Rd2D,
        input   logic [4:0]     Rd1E,
        input   logic [4:0]     Rd2E,
        input   logic [4:0]     RdE,
        input   logic [4:0]     RdM,
        input   logic [4:0]     RdW,
        input   logic           MemEnD,
        input   logic           MemEnE,
        input   logic           LoadD,
        input   logic           LoadE,
        input   logic           LoadM,
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

        assign StallF = LoadE & (~LoadM);
        // assign StallF = (~JumpE) & ({InstrF[6:4], InstrF[2:0]} == 6'b110111);
        assign StallD = LoadE & (~LoadM); // Stalls on first instance of a load
        // assign StallD = 1'b0;
        assign StallE = LoadE & (~LoadM);
        assign StallM = 1'b0;
        assign StallW = 1'b0;
        // assign FlushD = 1'b0;
        assign FlushD = PCSrcE;
        // assign FlushE = PCSrcE;
        assign FlushE = PCSrcE; // Flushes later instance of a load (from stall)
        // assign FlushE = PCSrcE; // Flushes later instance of a load (from stall)
        assign FlushM = (LoadE & LoadM);
        assign FlushW = 1'b0;

endmodule
