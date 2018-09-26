
module board_top
(
    input           CLK,
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);

    reg [1:0] idata0;
    reg [1:0] idata1;
    reg [1:0] idata2;
    reg [1:0] sel;
    reg       le;

    always @(posedge CLK) begin
        idata0 <= SW  [1:0];
        idata1 <= SW  [3:2];
        idata2 <= SW  [5:4];
        sel    <= SW  [9:8];
        le     <= SW  [  7];
    end

    lab_top lab_top
    (
        .idata0     ( idata0    ),
        .idata1     ( idata1    ),
        .idata2     ( idata2    ),
        .sel        ( sel       ),
        .le         ( le        ),
        .case_latch ( LED [1:0] ),
        .case_corrt ( LED [3:2] ),
        .latch      ( LED [5:4] ) 
    );

endmodule
