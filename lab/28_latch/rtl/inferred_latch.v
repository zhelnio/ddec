

// The example of mux with inferred (bad) latch.
// Quartus uses a LUT-based mux to implement latch (where mux output is connected to one of its inputs).
// The async latches behavior in FPGA can be unstable because of glitches.
// Synthesis tool (Quartus) warns of possible problems:
//   Warning (13012): Latch <name> has unsafe behavior ...
//     Warning (13013): Ports D and ENA on the latch are fed by the same signal <name> ...
// For details read the "Intel Quartus Prime Pro Edition Handbook Volume 1: Design and Compilation":
//  sections 4.5.3 "Latches" and 4.5.3.2 "Inferring Latches Correctly".
// The behavior of this code can be different for DE10_Lite (MAX10) and DO0_CV (Cyclone 5).
module case_inferred_latch
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);
    // the same result can be be obtained 
    // when 'if' is used without 'else'
    always @(*)
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
        endcase
endmodule

module mux_case_correct
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        case (sel)
            2'b00  : y = d0;
            2'b01  : y = d1;
            2'b10  : y = d2;
            default: y = d0;
        endcase

    // // alternative:
    // always @(*) begin
    //     y = d0;
    //     case (sel)
    //         2'b00  : y = d0;
    //         2'b01  : y = d1;
    //         2'b10  : y = d2;
    //     endcase
    // end
endmodule

// 1. Do NOT use it in FPGA projects
// 2. Do not use it in any projects unless you REALY know what you are doing
module mod_latch
(
    input      [1:0] d,
    input            le,
    output reg [1:0] y
);
    always @(*) begin
        if(le)
            y <= d;
    end

endmodule
