//  jsides@hmc.edu 2026

`include "parameters.svh"

module forward(
        input   logic [4:0]     Rd1E,
        input   logic [4:0]     Rd2E,
        input   logic [4:0]     RdM,
        input   logic [4:0]     RdW,
        input   logic           RegWriteM,
        input   logic           RegWriteW,

        output  logic [1:0]     ForwardAE,
        output  logic [1:0]     ForwardBE
);
    always_comb begin
        if((Rd1E == RdM) & (RdM != 0) & RegWriteM)           ForwardAE = 2'b10;
        else if((Rd1E == RdW) & (RdW != 0) & RegWriteW)      ForwardAE = 2'b01;
        else                                                ForwardAE = 2'b00;

        if((Rd2E == RdM) & (RdM != 0) & RegWriteM)           ForwardBE = 2'b10;
        else if((Rd2E == RdW) & (RdW != 0) & RegWriteW)      ForwardBE = 2'b01;
        else                                                ForwardBE = 2'b00;
    end



endmodule
