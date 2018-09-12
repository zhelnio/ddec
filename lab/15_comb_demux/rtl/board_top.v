
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);

    localparam DEMUX_MODE = "CASE";

    lab_top
    #(
        .MODE  ( DEMUX_MODE )
    )
    lab_top
    (
        .din   ( SW  [1:0] ),
        .sel   ( KEY [1:0] ),
        .dout0 ( LED[1:0] ),
        .dout1 ( LED[3:2] ),
        .dout2 ( LED[5:4] ),
        .dout3 ( LED[7:6] )
    );

endmodule
