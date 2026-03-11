// riscvsingle.sv
// RISC-V single-cycle processor
// kacassidy@hmc.edu 2025

module multiplier (
        input   logic [31:0]   InputA, InputB,
        input   logic [1:0]    Con, // = funct3[1:0]
        output  logic [31:0]   Result
    );

    always_comb
        case(Con)
            2'b00: Result = {InputA * InputB}[31:0];
            2'b01: Result = {InputA * InputB}[63:32];
            2'b10: Result = {InputA * $unsigned(InputB)}[63:32];
            2'b11: Result = {$unsigned(InputA) * $unsigned(InputB)}[63:32];
            default: Result = 'x;
        endcase

endmodule
