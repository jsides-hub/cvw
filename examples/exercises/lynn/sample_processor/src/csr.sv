// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

module csr(
        input   logic           clk,
        input   logic           reset,
        input   logic           StallM,
        input   logic           FlushM,
        input   logic           StallW,
        input   logic           FlushW,
        input   logic[11:0]     CSRVal,
        input   logic[2:0]      Funct3E,
        input   logic[1:0]      ResultSrcE,
        input   logic[1:0]      ALUControlE,
        input   logic           InstRetW,
        input   logic           BranchEvalE,
        input   logic           BranchTakenE,
        input   logic           JumpE,
        input   logic           WriteEnM,
        input   logic           MemEnM,
        output  logic[31:0]     CSRResultW
    );
    genvar i;
    logic CSROp;
    assign CSROp = ResultSrcE == 2'b10;

    logic ALUOp;
    assign ALUOp = ALUControlE[0];

    // Updating counters
    logic [15:0] Events;
    logic [63:0] CSRVals[15:0];

    for(i = 0; $unsigned(i) < 16; i=i+1) begin
        always_ff @(posedge clk or posedge reset) begin
            if (reset)          CSRVals[i] <= '0;
            else                CSRVals[i] <= CSRVals[i] + {{63{1'b0}}, Events[i]};
        end
    end

    assign Events[0] = 1'b1; // Number of cycles
    assign Events[1] = 1'b1; // Time (= cycles)
    assign Events[2] = InstRetW; // Instructions retired (one cycle per)
    assign Events[3] = ALUOp & (Funct3E == 3'b000); // Add instructions
    assign Events[4] = BranchEvalE; // Branches evaluated
    assign Events[5] = BranchTakenE; // Branches taken
    assign Events[6] = JumpE; // Jumps taken
    assign Events[7] = WriteEnM; // Memory writes
    assign Events[8] = MemEnM; // Memory ops
    assign Events[9] = CSROp; // CSR ops
    // assign Events[10] = 1'b1;
    assign Events[10] = ALUOp; // All ALU ops
    assign Events[11] = 1'b0;
    assign Events[12] = 1'b0;
    assign Events[13] = 1'b0;
    assign Events[14] = 1'b0;
    assign Events[15] = 1'b0;

    // Read value
    logic [11:0] Diff;
    logic [3:0]  Offset;
    logic [63:0] Val;
    logic [31:0] CSRResultE, CSRResultM;

    assign Offset = CSRVal[3:0];
    assign Val = CSRVals[Offset];


    always_comb
        if(CSROp) CSRResultE = (CSRVal[7]) ? Val[63:32] : Val[31:0];
        else CSRResultE = 'x;

    flopenrc #(32) CSRResultEM(.clk, .reset, .Stall(StallM), .Flush(FlushM), .D(CSRResultE), .Q(CSRResultM));
    flopenrc #(32) CSRResultMW(.clk, .reset, .Stall(StallW), .Flush(FlushW), .D(CSRResultM), .Q(CSRResultW));

endmodule
