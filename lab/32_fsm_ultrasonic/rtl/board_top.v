
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
    output [ 9:0] LED,
    inout  [35:0] GPIO
);
    localparam RANGE_WIDTH   = 24;
    wire [RANGE_WIDTH-1:0] range;

    wire clk     = CLK;
    wire rst_n   = KEY [0];
    wire echo    = GPIO[1];
    wire trigger;

    sr04_receiver
    #(
        .RANGE_WIDTH ( RANGE_WIDTH )
    )
    sr04_receiver
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .echo    ( echo    ),
        .trigger ( trigger ),
        .range   ( range   )
    );

    display_driver hex0 ( .dig (range [0  +: 4]), .seg (HEX0) );
    display_driver hex1 ( .dig (range [4  +: 4]), .seg (HEX1) );
    display_driver hex2 ( .dig (range [8  +: 4]), .seg (HEX2) );
    display_driver hex3 ( .dig (range [12 +: 4]), .seg (HEX3) );
    display_driver hex4 ( .dig (range [16 +: 4]), .seg (HEX4) );
    display_driver hex5 ( .dig (range [20 +: 4]), .seg (HEX5) );

    assign LED [0] = echo;
    assign LED [1] = trigger;
    assign GPIO[0] = trigger;

endmodule
