// csrfile.sv
// RISC-V single-cycle processor CSR file
// jsides@hmc.edu 2026

module csrfile(
        input   logic           clk,
        input   logic           WE2,
        input   logic [11:0]    A,
        input   logic [31:0]    WD1,
        input   logic[2:0]      Funct3,
        output  logic [31:0]    RD1
    );

    logic [31:0] rf[4095:0];

    // two ported csr file
    // read one port on falling edge of clock before write (A/RD1)
    // write second port on falling edge of clock (A/WD2/WE2)
    // register 0 hardwired to 0
    always_ff @(negedge clk)
        RD1 <= csrfile[A];
        if (WE2)
            case(Funct3[1:0]):
                2'b01: rf[A] = WD1;
                2'b10: rf[A] |= WD1;
                2'b11: rf[A] &= WD1;
                default: rf[A] = '0;
            endcase

endmodule
