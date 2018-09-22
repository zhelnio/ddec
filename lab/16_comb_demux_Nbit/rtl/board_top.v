
module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);
    wire [1:0] din    = SW [4:3]; // demux data input
    wire [1:0] sel    = SW [2:1]; // demus addr input
    wire [7:0] dout_0;
    wire [7:0] dout_1;

    wire impl_switch  = SW [0];
    assign LED [7:0]  = impl_switch ? dout_1 : dout_0;

    b2_demux_1_4_univ
    #(
        .MODE  ( "CASE"      )
    )
    case_0
    (
        .din   ( din          ),
        .sel   ( sel          ),
        .dout0 ( dout_0 [1:0] ),
        .dout1 ( dout_0 [3:2] ),
        .dout2 ( dout_0 [5:4] ),
        .dout3 ( dout_0 [7:6] )
    );

    b2_demux_1_4_univ
    #(
        .MODE  ( "SV" )
    )
    case_1
    (
        .din   ( din          ),
        .sel   ( sel          ),
        .dout0 ( dout_1 [1:0] ),
        .dout1 ( dout_1 [3:2] ),
        .dout2 ( dout_1 [5:4] ),
        .dout3 ( dout_1 [7:6] )
    );

endmodule
