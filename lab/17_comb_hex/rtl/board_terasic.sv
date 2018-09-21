
`define USE_SYSTEM_VERILOG

module board_terasic
(
    input  [ 9:0] SW,
    output [ 9:0] LED,
    output [ 7:0] HEX0,
    output [ 7:0] HEX1,
    output [ 7:0] HEX2,
    output [ 7:0] HEX3,
    output [ 7:0] HEX4,
    output [ 7:0] HEX5 
);
    wire [23:0] data = { 14'b0, SW };

`ifndef USE_SYSTEM_VERILOG
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
`else

    wire [5:0][7:0] seg;
    assign { HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 } = seg;

    seven_seg_N #(6) hex
    (
        .data   ( data ),
        .seg    ( seg  )
    );
`endif

    assign LED = 10'b0;

endmodule
