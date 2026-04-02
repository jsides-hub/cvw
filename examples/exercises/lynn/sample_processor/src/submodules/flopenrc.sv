// riscvsingle.sv
// RISC-V single-cycle processor
// kacassidy@hmc.edu 2025

module flopenrc #(parameter WIDTH, parameter DEFAULT = 0) (
        input   logic               clk,
        input   logic               reset,
        input   logic               En,
        input   logic               Clr,
        input   logic [WIDTH-1:0]   D,
        output  logic [WIDTH-1:0]   Q
    );

    always_ff @(posedge clk, posedge reset) begin
        if (reset)      Q <= DEFAULT;
        else if (Clr)   Q <= 32'b0;
        else if (En)    Q <= D;
    end

endmodule
