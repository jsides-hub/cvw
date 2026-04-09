// riscvsingle.sv
// RISC-V single-cycle processor
// kacassidy@hmc.edu 2025

module flopenrc #(parameter WIDTH, parameter DEFAULT = 0) (
        input   logic               clk,
        input   logic               reset,
        input   logic               Stall,
        input   logic               Flush,
        input   logic [WIDTH-1:0]   D,
        output  logic [WIDTH-1:0]   Q
    );
    logic En;
    assign En = ~Stall;

    always_ff @(posedge clk, posedge reset) begin
        if (reset)      Q <= DEFAULT;
        else if (Flush) Q <= 32'b0;
        else if (En)    Q <= D;
    end

endmodule
