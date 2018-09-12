module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);

    assign LED[9:1] = 8'b0;

    dff_sync_rst_n dff_sync_rst_n
    (
        .clk   ( ~KEY [0] ),
        .rst_n (  SW  [0] ),
        .d     ( ~KEY [1] ),
        .q     (  LED [0] )
    );

endmodule
