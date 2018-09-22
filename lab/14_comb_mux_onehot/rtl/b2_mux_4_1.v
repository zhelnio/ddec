
module b2_mux_4_1_case_one_hot
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

module b2_mux_4_1_casez_priority
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
