

module b2_mux_3_1_case_latch
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
        endcase

endmodule

module b2_mux_3_1_case_correct
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
            default: y = d2;
        endcase

endmodule

module b2_mux_3_1_casez_correct
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        casez (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b1?: y = d2;
        endcase
endmodule
