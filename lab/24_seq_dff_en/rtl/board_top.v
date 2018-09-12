module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);

    assign LED[9:1] = 8'b0;

    dff_with_en dff_with_en
    (
        .clk   ( ~KEY [0] ),
        .en    (  SW  [0] ),
        .d     ( ~KEY [1] ),
        .q     (  LED [0] )
    );

endmodule
