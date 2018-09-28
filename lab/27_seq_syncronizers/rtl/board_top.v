
`include "config.vh"

module board_top
(
    input         CLK,
    input  [ 0:0] SW,
    inout  [ 0:0] GPIO,
    output [ 1:0] LED
);
    wire d   = SW[0] ^ GPIO[0];
    wire q;

    `MOD_SYNC sync
    (
        .clk ( CLK ),
        .d   ( d   ),
        .q   ( q   )
    );

    assign LED[  0] =  q;
    assign LED[  1] = ~q;

endmodule
