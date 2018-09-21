module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire d     = KEY[0];
    wire clk   = KEY[1];
    wire rst_n = SW [0];
    wire q;

    dff_sync_rst_n dff_sync_rst_n
    (
        .clk   ( clk   ),
        .rst_n ( rst_n ),
        .d     ( d     ),
        .q     ( q     )
    );

    assign LED[9:0] = { 6'b0, rst_n, q, clk, d };

endmodule
