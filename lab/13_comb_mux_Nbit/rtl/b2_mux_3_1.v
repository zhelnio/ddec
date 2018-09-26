

module b2_mux_3_1_case_full
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);
    // All possible values of input signals should be provided
    // or an inferred latch will be generated!
    always @(*) begin
        y = d2;
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d2;
        endcase
    end

endmodule

module b2_mux_3_1_case
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);
    // All the possible input-output pairs should be provided!
    // The first way to provide all possible values of input signals
    // is to add the default value out of the 'case' block
    always @(*) begin
        y = d2;
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
        endcase
    end

endmodule

module b2_mux_3_1_case_default
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);
    // All the possible input-output pairs should be provided!
    // The second way to provide all possible values of input signals
    // is to use the 'default' inside the 'case' block
    always @(*)
        case (sel)
            2'b00  : y = d0;
            2'b01  : y = d1;
            2'b10  : y = d2;
            default: y = d2;
        endcase

endmodule

module b2_mux_3_1_casez
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
