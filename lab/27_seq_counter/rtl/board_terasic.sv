
module board_terasic
(
    input         CLK,
    input  [ 9:0] SW,
    input  [ 1:0] KEY,
    output [ 9:0] LED,
    output [ 7:0] HEX0,
    output [ 7:0] HEX1,
    output [ 7:0] HEX2,
    output [ 7:0] HEX3,
    output [ 7:0] HEX4,
    output [ 7:0] HEX5 
);
    localparam WIDTH   = 64;
    localparam LSB_NUM = 22;

    wire [WIDTH-1:0] cntr;

    counter
    #(
        .WIDTH ( WIDTH  )
    )
    counter
    (
        .clk   ( CLK    ),
        .rst_n ( KEY[0] ),
        .cntr  ( cntr   )
    );

    wire [23:0] data = cntr [LSB_NUM +: 24];

    seven_seg_6 hex
    (
        .data ( data ),
        .hex0 ( HEX0 ),
        .hex1 ( HEX1 ),
        .hex2 ( HEX2 ),
        .hex3 ( HEX3 ),
        .hex4 ( HEX4 ),
        .hex5 ( HEX5 ) 
    );

    assign LED = cntr [LSB_NUM +: 10];

endmodule
