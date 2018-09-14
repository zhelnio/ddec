
module lab_top
#(
    parameter CLK_DIV  = 24
)(
    input        clk,
    input        rst_n,
    input        idata,
    output [2:0] smile,
    output       indicator,
    output       strobe
);
    clk_divider #(CLK_DIV) clk_divider
    (
        .clk    ( clk       ),
        .rst_n  ( rst_n     ),
        .strobe ( strobe    ),
        .half   ( indicator )
    );

    fsm_moore fsm_moore
    (
        .clk    ( clk       ),
        .rst_n  ( rst_n     ),
        .en     ( strobe    ),
        .idata  ( idata     ),
        .smile  ( smile [0] )
    );

    fsm_mealy fsm_mealy
    (
        .clk    ( clk       ),
        .rst_n  ( rst_n     ),
        .en     ( strobe    ),
        .idata  ( idata     ),
        .smile  ( smile [1] )
    );

    fsm_moore_osc fsm_moore_osc
    (
        .clk    ( clk       ),
        .rst_n  ( rst_n     ),
        .en     ( strobe    ),
        .idata  ( idata     ),
        .smile  ( smile [2] )
    );

endmodule
