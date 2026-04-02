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

    flopenrc #(3) Funct3DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(Funct3D), .Q(Funct3E));
    logic [31:0] PCE;
    flopenrc #(32) PCDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(PCD), .Q(PCE));

    logic ALUResultSrcE;
    flopenrc #(1) ALUResultSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ALUResultSrcD), .Q(ALUResultSrcE));
    logic [2:0] ResultSrcE;
    flopenrc #(3) ResultSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ResultSrcD), .Q(ResultSrcE));
    logic RegWriteE;
    flopenrc #(1) RegWriteDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(RegWriteD), .Q(RegWriteE));
    logic [1:0] ALUSrcE;
    flopenrc #(2) ALUSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ALUSrcD), .Q(ALUSrcE));
    logic [2:0] ImmSrcE;
    flopenrc #(3) ImmSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ImmSrcD), .Q(ImmSrcE));
    logic [1:0] ALUControlE;
    flopenrc #(2) ALUControlDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ALUControlD), .Q(ALUControlE));
    logic MulE;
    flopenrc #(1) MulDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(MulD), .Q(MulE));
    logic JumpE;
    flopenrc #(1) JumpDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(JumpD), .Q(JumpE));

    logic [31:0] R1E;
    flopenrc #(32) R1DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(R1D), .Q(R1E));
    logic [31:0] R2E;
    flopenrc #(32) R2DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(R2D), .Q(R2E));
    flopenrc #(5) RdDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(InstrD[11:7]), .Q(RdE));
    flopenrc #(32) ImmExtDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ImmExtD), .Q(ImmExtE));


    // ALU logic
    logic [31:0] FSrcAE;
    mux4 #(32) aforwardmux(R1E, ResultW, IEUResultM, 'x, ForwardAE, FSrcAE);
    mux4 #(32) bforwardmux(R2E, ResultW, IEUResultM, 'x, ForwardBE, FSrcBE);

    //TODO: Fix flags
    cmp cmp(.R1(FSrcAE), .R2(FSrcBE), .Eq(EqD), .Lt(LtD), .Ltu(LtuD));

    logic [31:0] SrcAE, SrcBE;
    mux2 #(32) srcamux(FSrcAE, PCE, ALUSrcE[1], SrcAE);
    mux2 #(32) srcbmux(FSrcBE, ImmExtE, ALUSrcE[0], SrcBE);

    logic [31:0] ALUResultE;
    alu alu(SrcAE, SrcBE, ALUControlE, Funct3E, ALUResultE, IEUAdrE);

    logic [31:0] PCLinkE;
    adder add4(PCE, 32'd4, PCLinkE);

    logic [31:0] AltResultE;
    mux2 #(32) jloc(ImmExtE, PCLinkE, JumpE, AltResultE);

    mux2 #(32) ieuresultmux(ALUResultE, AltResultE, ALUResultSrcE, IEUResultE);

    mux6 #(32) resultmux(IEUResultW, ReadDataW, ImmExtW, CSRResultW, 'x, 'x, ResultSrcE, ResultW);
endmodule
