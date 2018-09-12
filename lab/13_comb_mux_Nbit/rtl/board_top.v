
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    lab_top lab_top
    (
        .idata0 ( SW  [1:0] ),
        .idata1 ( SW  [3:2] ),
        .idata2 ( SW  [5:4] ),
        .sel    ( KEY [1:0] ),
        .odata0 ( LEDR[1:0] ),
        .odata1 ( LEDR[3:2] ),
        .odata2 ( LEDR[5:4] ),
        .odata3 ( LEDR[7:6] ) 
    );

endmodule
