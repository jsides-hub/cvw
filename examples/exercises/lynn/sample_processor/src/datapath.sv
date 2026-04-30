// datapath.sv
// RISC-V single-cycle processor
// jsides@hmc.edu 2026

module datapath(
        input   logic           clk, reset,
        input   logic [31:0]    InstrD,
        input   logic [2:0]     Funct3D,
        input   logic [31:0]    PCD,

        input   logic           ALUResultSrcD,
        input   logic [1:0]     ResultSrcD,
        input   logic           RegWriteD,
        input   logic [1:0]     ALUSrcD,
        input   logic [2:0]     ImmSrcD,
        input   logic [1:0]     ALUControlD,
        input   logic           MulD,
        input   logic           JumpD,
        input   logic           BranchD,
        input   logic           LoadD,
        input   logic           CSROpD,
        input   logic           RegWriteW,
        input   logic           MemEnD,
        input   logic [3:0]     WriteByteEnD,
        input   logic           AltSrcD,

        input   logic [1:0]     ForwardAE,
        input   logic [1:0]     ForwardBE,
        input   logic           StallE,
        input   logic           FlushE,

        input   logic [1:0]     ResultSrcW,
        input   logic [31:0]    IEUResultM,
        input   logic [4:0]     RdW,

        input   logic [31:0]    ReadDataW,
        input   logic [31:0]    IEUResultW,
        input   logic [31:0]    CSRResultW,
        input   logic [31:0]    MulResW,

        output  logic [31:0]    PCE,
        output  logic           PCSrcE,
        output  logic           RegWriteE,
        output  logic           MemEnE,
        output  logic [3:0]     WriteByteEnE,
        output  logic [2:0]     Funct3E,
        output  logic [1:0]     ResultSrcE,
        output  logic [4:0]     RdE,
        output  logic [31:0]    FSrcAE, FSrcBE,
        output  logic [31:0]    IEUAdrE,
        output  logic [31:0]    IEUResultE,
        output  logic [31:0]    ImmExtE,
        output  logic [31:0]    ResultW,

        output  logic [4:0]     Rd1D, Rd2D, Rd1E, Rd2E,
        output  logic           JumpE, BranchE, LoadE, CSROpE,
        output  logic [1:0]     ALUControlE

    );

    logic [31:0] ImmExtD;

    // register file logic
    assign Rd1D = InstrD[19:15];
    assign Rd2D = InstrD[24:20];
    logic [31:0] R1D, R2D, R1E, R2E;
    regfile rf(.clk, .WE3(RegWriteW), .A1(Rd1D), .A2(Rd2D),
        .A3(RdW), .WD3(ResultW), .RD1(R1D), .RD2(R2D));

    extend ext(.Instr(InstrD[31:7]), .ImmSrc(ImmSrcD), .ImmExt(ImmExtD));

    // DE flops
    flopenrc #(3) Funct3DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(Funct3D), .Q(Funct3E));
    flopenrc #(32) PCDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(PCD), .Q(PCE));

    flopenrc #(5) Rd1DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(Rd1D), .Q(Rd1E));
    flopenrc #(5) Rd2DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(Rd2D), .Q(Rd2E));

    logic ALUResultSrcE;
    flopenrc #(1) ALUResultSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ALUResultSrcD), .Q(ALUResultSrcE));
    flopenrc #(2) ResultSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ResultSrcD), .Q(ResultSrcE));
    flopenrc #(1) RegWriteDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(RegWriteD), .Q(RegWriteE));
    flopenrc #(1) MemEnDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(MemEnD), .Q(MemEnE));
    flopenrc #(4) WriteByteEnDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(WriteByteEnD), .Q(WriteByteEnE));


    logic [1:0] ALUSrcE;
    flopenrc #(2) ALUSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ALUSrcD), .Q(ALUSrcE));
    logic [2:0] ImmSrcE;
    flopenrc #(3) ImmSrcDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ImmSrcD), .Q(ImmSrcE));
    flopenrc #(2) ALUControlDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ALUControlD), .Q(ALUControlE));
    logic MulE;
    flopenrc #(1) MulDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(MulD), .Q(MulE));
    flopenrc #(1) JumpDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(JumpD), .Q(JumpE));
    flopenrc #(1) BranchDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(BranchD), .Q(BranchE));
    flopenrc #(1) LoadDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(LoadD), .Q(LoadE));
    flopenrc #(1) CSROpDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(CSROpD), .Q(CSROpE));


    flopenrc #(32) R1DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(R1D), .Q(R1E));
    flopenrc #(32) R2DE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(R2D), .Q(R2E));
    flopenrc #(5) RdDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(InstrD[11:7]), .Q(RdE));
    flopenrc #(32) ImmExtDE(.clk, .reset, .Stall(StallE), .Flush(FlushE), .D(ImmExtD), .Q(ImmExtE));


    // ALU logic
    mux4 #(32) aforwardmux(R1E, ResultW, IEUResultM, 'x, ForwardAE, FSrcAE);
    mux4 #(32) bforwardmux(R2E, ResultW, IEUResultM, 'x, ForwardBE, FSrcBE);

    // Branch evaluation
    logic EqE, LtE, LtuE;
    cmp cmp(.R1(FSrcAE), .R2(FSrcBE), .Eq(EqE), .Lt(LtE), .Ltu(LtuE));
    executecontroller econ(.BranchE, .JumpE, .Funct3E, .EqE, .LtE, .LtuE, .PCSrcE);

    // ALU evaluation
    logic [31:0] SrcAE, SrcBE;
    mux2 #(32) srcamux(FSrcAE, PCE, ALUSrcE[1], SrcAE);
    mux2 #(32) srcbmux(FSrcBE, ImmExtE, ALUSrcE[0], SrcBE);

    logic [31:0] ALUResultE;
    alu alu(SrcAE, SrcBE, ALUControlE, Funct3E, ALUResultE, IEUAdrE);

    // Next PC caluculations
    logic [31:0] PCLinkE;
    adder add4(PCE, 32'd4, PCLinkE);
    logic [31:0] AltResultE;
    mux2 #(32) altresultmux(ImmExtE, PCLinkE, JumpE, AltResultE);
    mux2 #(32) ieuresultmux(ALUResultE, AltResultE, ALUResultSrcE, IEUResultE);

    // Result evalutation
    mux4 #(32) resultmux(IEUResultW, ReadDataW, CSRResultW, MulResW, ResultSrcW, ResultW);
endmodule
