module board_top
(
    input         CLK,
    input  [ 1:0] KEY,
    output [ 7:0] HEX0,
    output [ 7:0] HEX1,
    output [ 7:0] HEX2,
    output [ 7:0] HEX3,
    output [ 7:0] HEX4,
    output [ 7:0] HEX5,
    output [ 9:0] LED
);
    localparam WIDTH   = 64;
    localparam LSB_NUM = 22;

    wire [WIDTH-1:0] cntr;

    counter
    #(
        .WIDTH ( WIDTH )
    )
    counter
    (
        .clk    ( CLK    ),
        .rst_n  ( KEY[0] ),
        .cntr   ( cntr   )
    );

    display_driver hex0 ( .dig (cntr [LSB_NUM+0  +: 4]), .seg (HEX0) );
    display_driver hex1 ( .dig (cntr [LSB_NUM+4  +: 4]), .seg (HEX1) );
    display_driver hex2 ( .dig (cntr [LSB_NUM+8  +: 4]), .seg (HEX2) );
    display_driver hex3 ( .dig (cntr [LSB_NUM+12 +: 4]), .seg (HEX3) );
    display_driver hex4 ( .dig (cntr [LSB_NUM+16 +: 4]), .seg (HEX4) );
    display_driver hex5 ( .dig (cntr [LSB_NUM+20 +: 4]), .seg (HEX5) );

    assign LED = cntr [LSB_NUM +: 10];

endmodule
