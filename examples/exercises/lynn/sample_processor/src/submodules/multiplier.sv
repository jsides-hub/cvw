// riscvsingle.sv
// RISC-V single-cycle processor
// jsides@hmc.edu 2026

module multiplier (
        input   logic          clk,
        input   logic          reset,
        input   logic          StallM,
        input   logic          FlushM,
        input   logic          StallW,
        input   logic          FlushW,
        input   logic [31:0]   FSrcAE, FSrcBE,
        input   logic [2:0]    Funct3E,
        output  logic [31:0]   MulResW
    );
    logic MsbAE, MsbBE;
    logic [30:0] RestAE, RestBE, PAE, PBE;
    logic MsbABE;
    logic [63:0] PABE;
    logic [1:0] ConE, ConM;

    // Control signal based on operation
    assign ConE = Funct3E[1:0];
    // Whether arguments are signed
    logic S1 = (ConE == 2'b01) | (ConE == 2'b10);
    logic S2 = (ConE == 2'b01);

    // Splitting off most significant bit for partial products
    assign {MsbAE, RestAE} = FSrcAE;
    assign {MsbBE, RestBE} = FSrcBE;

    // Computing partial products (ignoring sign)
    assign MsbABE = MsbAE & MsbBE;
    assign PAE = {31{MsbBE}} & RestAE;
    assign PBE = {31{MsbAE}} & RestBE;
    assign PABE = RestAE * RestBE;

    // Computing partial products (sign-dependent)
    logic [63:0] PP1E, PP2E, PP3E, PP4E, PP1M, PP2M, PP3M, PP4M;
    always_comb begin
        case(ConE)
            2'b01:      PP1E = {1'b1, MsbABE, {29{1'b0}}, 1'b1, {32{1'b0}}};
            2'b10:      PP1E = {1'b1, MsbABE, {30{1'b0}}, 1'b1, {31{1'b0}}};
            default:    PP1E = {1'b0, MsbABE, {62{1'b0}}};
        endcase
    end
    assign PP2E ={2'b00, (S1 ? ~PAE : PAE), {31{1'b0}}};
    assign PP3E = {2'b00, (S2 ? ~PBE : PBE), {31{1'b0}}};
    assign PP4E = {{2{1'b0}}, PABE};

    // Pipelining partial products to next stage
    flopenrc #(2)  ConEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(ConE), .Q(ConM));
    flopenrc #(64) PP1EM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(PP1E), .Q(PP1M));
    flopenrc #(64) PP2EM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(PP2E), .Q(PP2M));
    flopenrc #(64) PP3EM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(PP3E), .Q(PP3M));
    flopenrc #(64) PP4EM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(PP4E), .Q(PP4M));

    logic [63:0] SumM;
    logic [31:0] MulResM;
    // Adding partial products
    assign SumM = PP1M + PP2M + PP3M + PP4M;
    assign MulResM = (ConM == 2'b00) ? SumM[31:0] : SumM[63:32];

    flopenrc #(32) MulResMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(MulResM), .Q(MulResW));

endmodule
