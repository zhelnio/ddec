
module board_top
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

    hex_smile hex0 ( .smile (smile[0]), .seg (HEX0) );
    hex_smile hex1 ( .smile (smile[1]), .seg (HEX1) );
    hex_smile hex2 ( .smile (smile[2]), .seg (HEX2) );

    assign LED [0] = indicator;
    assign LED [1] = idata;

endmodule

module hex_smile
(
    input        smile,
    output [7:0] seg
);
    // . g f e d c b a   // Letter from the diagram below
    // 7 6 5 4 3 2 1 0   // Bit in seg

    //   --a--
    //  |     |
    //  f     b
    //  |     |
    //   --g--
    //  |     |
    //  e     c
    //  |     |
    //   --d-- 

    assign seg = smile ? 8'b10011101 : 8'b10111111;

endmodule

    // assign hex0 = moore_fsm_out ? 8'b10100011 : 8'b11111111;
    // assign hex1 = mealy_fsm_out ? 8'b10011100 : 8'b11111111;
