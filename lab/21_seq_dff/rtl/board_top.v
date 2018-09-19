module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire clk;

    `ifdef VIVADO_SYNTHESIS
        IBUF IBUF (.I(KEY[0]), .O(clk));
    `else
        assign clk = KEY[0];
    `endif

    assign LED[9:1] = 8'b0;

    d_flip_flop d_flip_flop
    (
        .clk ( ~clk ),
        .d   ( ~KEY [1] ),
        .q   (  LED [0] )
    );

endmodule
