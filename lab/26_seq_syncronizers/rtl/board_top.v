module board_top
(
    input         MAX10_CLK1_50,
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire clk = MAX10_CLK1_50;
    wire d   = SW[0];
    wire q;

    d_flip_flop d_flip_flop
    (
        .clk ( clk ),
        .d   ( d   ),
        .q   ( q   )
    );

    assign LED[9:2] = 8'b0;
    assign LED[  1] =  q;
    assign LED[  0] = ~q;

endmodule
