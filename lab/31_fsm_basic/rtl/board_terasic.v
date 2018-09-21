
module board_terasic
(
    input         CLK,
    input  [ 1:0] KEY,
    output [ 7:0] HEX0,
    output [ 7:0] HEX1,
    output [ 7:0] HEX2,
    output [ 1:0] LED
);
    localparam CLK_DIV = 26;

    wire       rst_n =  KEY[1];
    wire       idata = ~KEY[0];
    wire [2:0] smile;
    wire       indicator;
    wire       strobe;

    lab_top
    #(
        .CLK_DIV   ( CLK_DIV   )
    )
    lab_top
    (
        .clk       ( CLK       ),
        .rst_n     ( rst_n     ),
        .idata     ( idata     ),
        .smile     ( smile     ),
        .indicator ( indicator ),
        .strobe    ( strobe    ) 
    );

    hex_smile hex0 ( .smile (smile[0]), .hex (HEX0) );
    hex_smile hex1 ( .smile (smile[1]), .hex (HEX1) );
    hex_smile hex2 ( .smile (smile[2]), .hex (HEX2) );

    assign LED [0] = indicator;
    assign LED [1] = idata;

endmodule
