
module board_top
(
    input  [ 9:0] SW,

    output [ 7:0] HEX0,
    output [ 7:0] HEX1
);

    display_driver seg0 ( .dig(SW[3:0]), .seg(HEX0) );
    display_driver seg1 ( .dig(SW[7:4]), .seg(HEX1) );

endmodule
