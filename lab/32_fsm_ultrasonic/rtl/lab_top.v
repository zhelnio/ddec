
module lab_top
#(
    parameter   RANGE_WIDTH      = 16,
                DELAY_CLK_1US    = 50,
                DELAY_1US_1SM    = 58,
                DELAY_TRIGGER_US = 10,
                DELAY_ECHO_US    = 400 * DELAY_1US_1SM,
                DELAY_POSTFIX_US = 500000
)(
    input                    clk,
    input                    rst_n,
    input                    echo,
    output                   trigger,
    output [RANGE_WIDTH-1:0] range
);
    wire strobe_us;     // micro second strobe
    wire strobe_sm;     // centimetre strobe
    wire measure_sm;    // centimetre was measured
    wire measure_end;   // measurement end

    clk_divider
    #( 
        .DELAY  ( DELAY_CLK_1US )
    )
    clk_us
    (
        .clk    ( clk          ),
        .rst_n  ( rst_n        ),
        .en     ( 1'b1         ),
        .strobe ( strobe_us    )
    );

    clk_divider
    #( 
        .DELAY  ( DELAY_1US_1SM )
    )
    clk_sm
    (
        .clk    ( clk           ),
        .rst_n  ( rst_n         ),
        .en     ( strobe_us     ),
        .strobe ( strobe_sm     )
    );

    hc_src04_fsm
    #(
        .DELAY_TRIGGER ( DELAY_TRIGGER_US ),
        .DELAY_ECHO    ( DELAY_ECHO_US    ),
        .DELAY_POSTFIX ( DELAY_POSTFIX_US ) 
    )
    fsm
    (
        .clk           ( clk              ),
        .rst_n         ( rst_n            ),
        .strobe_us     ( strobe_us        ),
        .strobe_sm     ( strobe_sm        ),
        .echo          ( echo             ),
        .trigger       ( trigger          ),
        .measure_sm    ( measure_sm       ),
        .measure_end   ( measure_end      )
    );

    // range counter
    wire [RANGE_WIDTH-1:0] rcntr;
    wire [RANGE_WIDTH-1:0] rcntr_nx = measure_end ? 0 : rcntr + 1;
    wire                   rcntr_we = measure_end | measure_sm;
    prm_register_we #(RANGE_WIDTH) rcntr_r (clk, rst_n, rcntr_we, rcntr_nx, rcntr);

    // output buffer
    prm_register_we #(RANGE_WIDTH) obuff_r (clk, rst_n, measure_end, rcntr, range);

endmodule
