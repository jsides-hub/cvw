// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

module datapath(
        input   logic           clk, reset,
        input   logic [31:0]    InstrD,
        input   logic [2:0]     Funct3D,
        input   logic [31:0]    PCD,

        input   logic           ALUResultSrcD,
        input   logic [2:0]     ResultSrcD,
        input   logic           RegWriteD,
        input   logic [1:0]     ALUSrcD,
        input   logic [2:0]     ImmSrcD,
        input   logic [1:0]     ALUControlD,
        input   logic           MulD,
        input   logic           JumpD,

        input   logic [1:0]     ForwardAE,
        input   logic [1:0]     ForwardBE,
        input   logic           StallE,
        input   logic           FlushE,

        input   logic [2:0]     ResultSrcW,
        input   logic [31:0]    IEUResultM,
        input   logic [4:0]     RdW,

        input   logic [31:0]    ReadDataW,
        input   logic [31:0]    IEUResultW,
        input   logic [31:0]    ImmExtW,
        input   logic [31:0]    CSRResultW,

        output  logic           EqD,
        output  logic           LtD,
        output  logic           LtuD,
        output  logic [2:0]     Funct3E,
        output  logic [4:0]     RdE,
        output  logic [31:0]    ImmExtE,
        output  logic [31:0]    FSrcBE,
        output  logic [31:0]    IEUAdrE,
        output  logic [31:0]    IEUResultE
    );

    logic [31:0] ImmExtD, BranchRes;
    logic [31:0] R1D, R2D, SrcA, SrcB, MulRes;
    // logic [31:0] MulRes;
    logic [31:0] ALUResult, IEUResult;

    // register file logic
    logic [31:0] ResultW;
    regfile rf(.clk, .WE3(RegWriteW), .A1(InstrD[19:15]), .A2(InstrD[24:20]),
        .A3(RdW), .WD3(ResultW), .RD1(R1D), .RD2(R2D));

    extend ext(.Instr(InstrD[31:7]), .ImmSrc(ImmSrcD), .ImmExt(ImmExtD));

    // DE flop

    flopenr Funct3DE(.clk, .reset, ~StallE, FlushE, Funct3D, Funct3E);
    logic [31:0] PCE;
    flopenr PCDE(.clk, .reset, ~StallE, FlushE, PCD, PCE);

    logic ALUResultSrcE;
    flopenr ALUResultSrcDE(.clk, .reset, ~StallE, FlushE, ALUResultSrcD, ALUResultSrcE);
    logic [2:0] ResultSrcE;
    flopenr ResultSrcDE(.clk, .reset, ~StallE, FlushE, ResultSrcD, ResultSrcE);
    logic RegWriteE;
    flopenr RegWriteDE(.clk, .reset, ~StallE, FlushE, RegWriteD, RegWriteE);
    logic [1:0] ALUSrcE;
    flopenr ALUSrcDE(.clk, .reset, ~StallE, FlushE, ALUSrcD, ALUSrcE);
    logic [2:0] ImmSrcE;
    flopenr ImmSrcDE(.clk, .reset, ~StallE, FlushE, ImmSrcD, ImmSrcE);
    logic [1:0] ALUControlE;
    flopenr ALUControlDE(.clk, .reset, ~StallE, FlushE, ALUControlD, ALUControlE);
    logic MulE;
    flopenr MulE(.clk, .reset, ~StallE, FlushE, MulD, MulE);
    logic JumpE;
    flopenr JumpE(.clk, .reset, ~StallE, FlushE, JumpD, JumpE);

    logic [4:0] R1E;
    flopenr R1DE(.clk, .reset, ~StallE, FlushE, R1D, R1E);
    logic [4:0] R2E;
    flopenr R2DE(.clk, .reset, ~StallE, FlushE, R2D, R2E);
    flopenr RdDE(.clk, .reset, ~StallE, FlushE, RdD, RdE);
    flopenr ImmExtDE(.clk, .reset, ~StallE, FlushE, ImmExtD, ImmExtE);


    // ALU logic
    logic [31:0] FSrcAE;
    mux4 #(32) aforwardmux(RD1E, ResultW, IEUResultM, 'x, ForwardAE, FSrcAE);
    mux4 #(32) aforwardmux(RD2E, ResultW, IEUResultM, 'x, ForwardBE, FSrcBE);

    //TODO: Fix flags
    cmp cmp(.R1(FSrcAE), .R2(FSrcBE), .EqD, .LtD, .LtuD);

    logic [31:0] SrcAE, SrcBE;
    mux2 #(32) srcamux(FSrcAE, PCE, ALUSrcE[1], SrcAE);
    mux2 #(32) srcbmux(FSrcBE, ImmExtE, ALUSrcE[0], SrcBE);

    logic [31:0] ALUResultE;
    alu alu(.SrcAE, .SrcBE, .ALUControlE, .Funct3E, .ALUResultE, .IEUAdrE);

    logic [31:0] PCLinkE;
    adder add4(PCE, 32'd4, PCLinkE);

    logic [31:0] AltResultE;
    mux2 #(32) jloc(ImmExtE, PCLinkE, JumpE, AltResultE);

    mux2 #(32) ieuresultmux(ALUResultE, AltResultE, ALUResultSrcE, IEUResultE);

    mux6 #(32) resultmux(IEUResultW, ReadDataW, ImmExtW, CSRResultW, 'x, 'x, ResultSrcE, ResultW);
endmodule
