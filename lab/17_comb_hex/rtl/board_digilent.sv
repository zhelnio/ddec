
module board_digilent
(
    input  [15:0] SW,
    output [ 7:0] HEX,
    output [ 7:0] AN
);
    wire [23:0] data = { 12'b0, SW[11:0 ] };
    wire [ 2:0] active_digit  = SW[15:13];

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
