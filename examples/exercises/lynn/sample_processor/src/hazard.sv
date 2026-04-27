// hazard.sv
// RISC-V single-cycle processor
// jsides@hmc.edu 2026

`include "parameters.svh"

module hazard(
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
        input   logic           LoadE,
        input   logic           LoadM,
        input   logic           CSROpE,
        input   logic           CSROpM,
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


        assign StallF = (LoadE & (~LoadM)) | (CSROpE & (~CSROpM)); // Stalls on first instance of a (mem or csr) load
        assign StallD = (LoadE & (~LoadM)) | (CSROpE & (~CSROpM)); // Stalls on first instance of a (mem or csr) load
        assign StallE = (LoadE & (~LoadM)) | (CSROpE & (~CSROpM)); // Stalls on first instance of a (mem or csr) load
        assign StallM = 1'b0;
        assign StallW = 1'b0;
        assign FlushD = PCSrcE;
        assign FlushE = PCSrcE;
        assign FlushM = (LoadE & LoadM) | (CSROpE & CSROpM); // Flushes later instance of a load (duplicated from stall)
        assign FlushW = 1'b0;

endmodule
