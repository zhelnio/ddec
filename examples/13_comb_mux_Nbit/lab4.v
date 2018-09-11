

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


module lab4_board
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    lab4_top_sv lab4_top_sv
    (
        .idata0 ( SW  [1:0] ),
        .idata1 ( SW  [3:2] ),
        .idata2 ( SW  [5:4] ),
        .sel    ( KEY [1:0] ),
        .odata0 ( LEDR[1:0] ),
        .odata1 ( LEDR[3:2] ),
        .odata2 ( LEDR[5:4] ),
        .odata3 ( LEDR[7:6] ) 
    );

endmodule
