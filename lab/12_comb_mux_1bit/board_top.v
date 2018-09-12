
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);

    lab_top lab_top
    (
        .idata0  ( SW  [0] ),
        .idata1  ( SW  [1] ),
        .sel     ( KEY [0] ),
        .y_comb  ( LED [0] ),
        .y_sel   ( LED [1] ),
        .y_if    ( LED [2] ),
        .y_case  ( LED [3] ),
        .y_index ( LED [4] ) 
    );

endmodule
