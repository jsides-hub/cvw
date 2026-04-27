// ifu.sv
// RISC-V single-cycle processor
//  jsides@hmc.edu 2026

module ifu(
        input   logic           clk, reset,
        input   logic           PCSrcE,
        input   logic [31:0]    IEUAdrE,
        input   logic [31:0]    InstrF,
        input   logic           StallF, StallD, FlushD,
        output  logic [31:0]    PCD, PCF, InstrD
    );

    // next PC logic
    logic [31:0] entry_addr;
    logic [31:0] Target, PCNextF, PCPlus4F;

    initial begin
        // default
        entry_addr = '0;

        // override if provided
        void'($value$plusargs("ENTRY_ADDR=%h", entry_addr));

        $display("[TB] ENTRY_ADDR = 0x%h", entry_addr);
    end

    // PC / Branch target evaluation
    assign Target = IEUAdrE & {{31{1'b1}}, 1'b0}; // drop least significant bit
    mux2 #(32) pcmux(PCPlus4F, Target, PCSrcE, PCNextF);

    // Fetching next PC
    always_ff @(posedge clk or posedge reset) begin
        if (reset)          PCF <= entry_addr;
        else if (~StallF)   PCF <= PCNextF;
    end

    adder pcadd4(PCF, 32'd4, PCPlus4F);

    // Decode stage flops
    flopenrc #(32) PCFD(.clk, .reset, .Stall(StallD), .Flush(FlushD), .D(PCF), .Q(PCD));
    flopenrc #(32) InstrFD(.clk, .reset, .Stall(StallD), .Flush(FlushD), .D(InstrF), .Q(InstrD));

endmodule
