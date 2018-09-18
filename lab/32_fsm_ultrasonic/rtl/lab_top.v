
module lab_top
#(
    parameter RANGE_WIDTH   = 16,
    parameter CLOCK_T       = 50000000             ,
    parameter DELAY_TRIGGER = 5,   // 500,        //10 * CLOCK_T / 10**6 , // 10 uS
    parameter DELAY_WAIT    = 11660,  // 1166000,   //30 * CLOCK_T / 10**3 , // 30 mS
    parameter DELAY_POSTFIX = 200000,   // 20000000,  //60 * CLOCK_T / 10**3 , // 60 mS
    parameter DELAY_WIDTH   = 32   // 32         //$clog2(DELAY_POSTFIX)
)(
    input                    clk,
    input                    rst_n,
    input                    echo,
    output                   trigger,
    output [RANGE_WIDTH-1:0] range
);
    wire strobe_us;
    wire strobe_sm;

    clk_divider
    #( 
        .DELAY  ( 50        )
    )
    clk_us
    (
        .clk    ( clk       ),
        .rst_n  ( rst_n     ),
        .en     ( 1'b1      ),
        .strobe ( strobe_us )
    );

    clk_divider
    #( 
        .DELAY  ( 58        )
    )
    clk_sm
    (
        .clk    ( clk       ),
        .rst_n  ( rst_n     ),
        .en     ( strobe_us ),
        .strobe ( strobe_sm )
    );

    hc_src04_fsm
    // #(
    //     // .DELAY_TRIGGER ( DELAY_TRIGGER ),
    //     // .DELAY_WAIT    ( DELAY_WAIT    ),
    //     // .DELAY_POSTFIX ( DELAY_POSTFIX ),
    //     // .DELAY_WIDTH   ( DELAY_WIDTH   ),
    //     // .RANGE_WIDTH   ( RANGE_WIDTH   ) 
    // )
    fsm
    (
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .strobe_us ( strobe_us ),
        .strobe_sm ( strobe_sm ),
        .echo      ( echo      ),
        .trigger   ( trigger   ),
        .range     ( range     ) 
    );

endmodule
