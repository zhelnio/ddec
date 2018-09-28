
module board_digilent
(
    input         CLK,
    input  [15:0] SW,
    input  [ 4:0] KEY,
    output [ 7:0] HEX,
    output [ 7:0] AN
);
    localparam WIDTH   = 64;
    localparam LSB_NUM = 24;
    localparam HEX_NUM = 12;

    wire [WIDTH-1:0] cntr;

    counter
    #(
        .WIDTH  ( WIDTH  )
    )
    counter
    (
        .clk    ( CLK    ),
        .rst_n  (~KEY[0] ),
        .cntr   ( cntr   )
    );

    wire [31:0] data         = cntr [LSB_NUM +: 32];
    wire [ 2:0] active_digit = cntr [HEX_NUM +: 3 ];

    seven_seg_N_ca
    #(
        .DIGITS ( 8            ) 
    ) 
    hex 
    (
        .data   ( data         ),
        .digit  ( active_digit ),
        .hex    ( HEX          ),
        .an     ( AN           ) 
    );

endmodule
