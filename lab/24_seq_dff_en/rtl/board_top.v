module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire d     = KEY[0];
    wire clk   = KEY[1];
    wire en    = SW [0];
    wire q;

    dff_with_en dff_with_en
    (
        .clk   ( clk   ),
        .en    ( en    ),
        .d     ( d     ),
        .q     ( q     )
    );

    assign LED[9:0] = { 6'b0, en, q, clk, d };

endmodule
