module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire d     = KEY[0];
    wire clk   = KEY[1];
    wire clr   = SW [0];
    wire q;

    dff_sync_clr dff_sync_clr
    (
        .clk   ( clk   ),
        .clr   ( clr   ),
        .d     ( d     ),
        .q     ( q     )
    );

    assign LED[9:0] = { 6'b0, clr, q, clk, d };

endmodule
