
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);

    wire [3:0] sel = { SW[1:0], KEY[1:0] };

    lab_top lab_top
    (
        .idata0 ( SW  [3:2] ),
        .idata1 ( SW  [5:4] ),
        .idata2 ( SW  [7:6] ),
        .idata3 ( SW  [9:8] ),
        .sel    ( sel       ),
        .odata0 ( LED [1:0] ),
        .odata1 ( LED [3:2] ),
        .odata2 ( LED [5:4] ) 
    );

endmodule
