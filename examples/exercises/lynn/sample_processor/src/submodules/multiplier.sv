// riscvsingle.sv
// RISC-V single-cycle processor
// kacassidy@hmc.edu 2025

module multiplier (
        input   logic [31:0]   InputA, InputB,
        input   logic [1:0]    Con, // = funct3[1:0]
        output  logic [31:0]   Result
    );
    logic [63:0] SS;
    logic [64:0] SU;
    logic [63:0] UU;
    assign SS = $signed(InputA) * $signed(InputB);
    assign SU = $signed(InputA) * $signed({1'b0, InputB});
    assign UU = $unsigned(InputA) * $unsigned(InputB);

    always_comb
        case(Con)
            2'b00: Result = SS[31:0];
            2'b01: Result = SS[63:32];
            2'b10: Result = SU[63:32];
            2'b11: Result = UU[63:32];
            default: Result = 'x;
        endcase

endmodule
