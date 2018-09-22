
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);
    lab_top lab_top
    (
        .din   ( SW [4:2] ),
        .sel   ( SW [1:0] ),
        .dout0 ( LED[2:0] ),
        .dout1 ( LED[5:3] ),
        .dout2 ( LED[8:6] ) 
    );

endmodule
