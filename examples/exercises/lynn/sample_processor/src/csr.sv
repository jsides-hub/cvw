// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

module csr(
        input   logic           clk,
        input   logic           reset,
        input   logic[31:0]     Instr,
        input   logic           BranchTaken,
        input   logic           MemEn,
        input   logic           WriteEn,
        output  logic[31:0]     CSRResult
    );

    genvar i;
    logic CSROp;
    logic[2:0] Funct3;
    assign CSROp = (Instr[6:0] == 7'b1110011);
    assign Funct3 = Instr[14:12];

    // Updating counters
    logic [31:0] Events;
    logic [63:0] CSRVals[31:0];

    for(i = 0; $unsigned(i) < 32; i=i+1) begin
        always_ff @(posedge clk or posedge reset) begin
            if (reset)  CSRVals[i] <= '0;
            else        CSRVals[i] <= CSRVals[i] + {{63{1'b0}}, Events[i]};
        end
    end

    assign Events[0] = 1'b1; // Number of cycles
    assign Events[1] = 1'b1; // Time (= cycles)
    assign Events[2] = 1'b1; // Instructions retired (one cycle per)
    assign Events[3] = ({Instr[14:12], Instr[6:0]} == 10'b0000110011); // Add instructions
    assign Events[4] = (Instr[6:0] == 7'b1100011); // Branches evaluated
    assign Events[5] = BranchTaken; // Branches taken
    assign Events[6] = ({Instr[6:4], Instr[2:0]} == 6'b110111); // Jumps taken
    assign Events[7] = WriteEn; // Memory writes
    assign Events[8] = MemEn; // Memory ops
    assign Events[9] = CSROp; // CSR ops
    // assign Events[10] = 1'b1;
    assign Events[10] = (({Instr[6], Instr[4:0]} == 6'b010011) & (Funct3 != 3'b000)); // Non-add ALU ops
    assign Events[11] = 1'b0;
    assign Events[12] = 1'b0;
    assign Events[13] = 1'b0;
    assign Events[14] = 1'b0;
    assign Events[15] = 1'b0;
    assign Events[16] = 1'b0;
    assign Events[17] = 1'b0;
    assign Events[18] = 1'b0;
    assign Events[19] = 1'b0;
    assign Events[20] = 1'b0;
    assign Events[21] = 1'b0;
    assign Events[22] = 1'b0;
    assign Events[23] = 1'b0;
    assign Events[24] = 1'b0;
    assign Events[25] = 1'b0;
    assign Events[26] = 1'b0;
    assign Events[27] = 1'b0;
    assign Events[28] = 1'b0;
    assign Events[29] = 1'b0;
    assign Events[30] = 1'b0;
    assign Events[31] = 1'b0;


    // assign Events[5] = ;

    // Read value
    logic [11:0] CSRVal;
    logic [11:0] Diff;
    logic [4:0]  Offset;
    logic [63:0] Val;

    assign CSRVal = Instr[31:20];
    assign Diff = (CSRVal - 12'hC00);
    assign Offset = Diff[4:0];
    assign Val = CSRVals[Offset];


    always_comb
        if(CSROp) CSRResult = (CSRVal < 12'hC80) ? Val[31:0] : Val[63:32];
        else CSRResult = 'x;

endmodule
