
module b2_mux_3_1_case_one_hot
(
    input      [1:0] d0,
    input      [1:0] d1,
    input      [1:0] d2,
    input      [1:0] d3,
    input      [3:0] sel,
    output reg [1:0] y
);

    always @(*)
        casez (sel)
            4'b0001: y = d0;
            4'b0010: y = d1;
            4'b0100: y = d2;
            4'b1000: y = d3;
            default: y = d0;
        endcase
endmodule

module b2_mux_3_1_casez_priority
(
    input      [1:0] d0,
    input      [1:0] d1,
    input      [1:0] d2,
    input      [1:0] d3,
    input      [3:0] sel,
    output reg [1:0] y
);
    always @(*)
        casez (sel)
            4'b0001 : y = d0;
            4'b001? : y = d1;
            4'b01?? : y = d2;
            4'b1??? : y = d3;
            default : y = d0;
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
        .idata3 ( SW  [7:6] ),
        .sel    ( KEY [1:0] ),
        .odata0 ( LEDR[1:0] ),
        .odata1 ( LEDR[3:2] ),
        .odata2 ( LEDR[5:4] ) 
    );

endmodule
