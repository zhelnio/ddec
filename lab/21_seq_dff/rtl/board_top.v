module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire d   = KEY[0];
    wire clk = KEY[1];
    wire q;

    d_flip_flop d_flip_flop
    (
        .clk ( clk ),
        .d   ( d   ),
        .q   ( q   )
    );

    assign LED[9:0] = { 7'b0, q, clk, d };

endmodule
