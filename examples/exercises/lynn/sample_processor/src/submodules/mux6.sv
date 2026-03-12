// mux6.sv
// RISC-V single-cycle processor
// Jaden Sides jsides@hmc.edu 2026

module mux6 #(parameter WIDTH) (
        input   logic [WIDTH-1:0]   A,
        input   logic [WIDTH-1:0]   B,
        input   logic [WIDTH-1:0]   C,
        input   logic [WIDTH-1:0]   D,
        input   logic [WIDTH-1:0]   E,
        input   logic [WIDTH-1:0]   F,
        input   logic [2:0]         select,

        output  logic [WIDTH-1:0]   result
    );
    always_comb
        case(select)
            0: result = A;
            1: result = B;
            2: result = C;
            3: result = D;
            4: result = E;
            5: result = F;
            default: result = 'x;
        endcase
endmodule
