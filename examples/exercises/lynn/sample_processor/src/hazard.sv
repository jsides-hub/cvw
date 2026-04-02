// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020 kacassidy@hmc.edu 2025

`include "parameters.svh"

module hazard(
        input logic [31:0] InstrD,
        output logic StallF,
        output logic StallD,
        output logic FlushD,
        output logic StallE,
        output logic FlushE,
        output logic StallM,
        output logic FlushM,
        output logic StallW,
        output logic FlushW,
        output logic [1:0] ForwardAE,
        output logic [1:0] ForwardBE
);

endmodule
