
module board_digilent
(
    input         CLK,
    input  [ 1:0] KEY,
    output [ 7:0] HEX,
    output [ 7:0] AN,
    output [ 1:0] LED
);
    localparam CLK_DIV = 26;

    wire       rst_n = ~KEY[1];
    wire       idata =  KEY[0];
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

    hex_smile_ca hex_smile_ca
    (
        .clk   ( CLK   ),
        .rst_n ( rst_n ),
        .smile ( smile ),
        .hex   ( HEX   ),
        .an    ( AN    ) 
    );

    assign LED [0] = indicator;
    assign LED [1] = idata;

endmodule
