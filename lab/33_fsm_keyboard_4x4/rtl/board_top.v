
module board_top
(
    input         CLK,
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 7:0] HEX0,
    output [ 7:0] HEX1,
    output [ 7:0] HEX2,
    output [ 7:0] HEX3,
    output [ 7:0] HEX4,
    output [ 7:0] HEX5,
    output [ 9:0] LED,
    inout  [35:0] GPIO
);
    wire clk     = CLK;
    wire rst_n   = KEY[0];

    wire [ 3:0] row = GPIO[3:0];
    wire [ 3:0] clm;
    wire [31:0] value;    

    kb_4x4 kb
    (
        .clk    ( clk   ),
        .rst_n  ( rst_n ),
        .row    ( row   ),
        .clm    ( clm   ),
        .value  ( value )
    );

    display_driver hex0 ( .dig (value [0  +: 4]), .seg (HEX0) );
    display_driver hex1 ( .dig (value [4  +: 4]), .seg (HEX1) );
    display_driver hex2 ( .dig (value [8  +: 4]), .seg (HEX2) );
    display_driver hex3 ( .dig (value [12 +: 4]), .seg (HEX3) );
    display_driver hex4 ( .dig (value [16 +: 4]), .seg (HEX4) );
    display_driver hex5 ( .dig (value [20 +: 4]), .seg (HEX5) );

    wire [ 3:0] clm_force_en = SW[4];
    wire [ 3:0] clm_force    = SW[3:0];

    assign GPIO[7:4] = clm_force_en ? clm_force : clm;
    assign LED [3:0] = row;

endmodule
