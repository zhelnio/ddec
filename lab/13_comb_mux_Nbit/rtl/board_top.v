
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);

    lab_top lab_top
    (
        .idata0 ( SW  [1:0] ),
        .idata1 ( SW  [3:2] ),
        .idata2 ( SW  [5:4] ),
        .sel    ( KEY [1:0] ),
        .odata0 ( LED [1:0] ),
        .odata1 ( LED [3:2] ),
        .odata2 ( LED [5:4] ),
        .odata3 ( LED [7:6] ) 
    );

endmodule
