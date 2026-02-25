// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

module  readextend(
        input   logic [31:0]    Read,
        input   logic [2:0]     Funct3,
        output  logic [31:0]    ReadExt
    );

    always_comb begin
        case(Funct3)
            // Unsigned byte
            3'b000: ReadExt = {{25{Read[7]}}, Read[6:0]};
            // Signed byte
            3'b100: ReadExt = {{24{1'b0}}, Read[7:0]};
            // Unsigned half
            3'b001: ReadExt = {{17{Read[15]}}, Read[14:0]};
            // Signed byte
            3'b101: ReadExt = {{16{1'b0}}, Read[15:0]};
            // Normal read
            3'b010: ReadExt = Read;
            default: ReadExt = 'x;
        endcase
    end
endmodule
