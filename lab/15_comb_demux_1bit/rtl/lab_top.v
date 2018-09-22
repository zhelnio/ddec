
`define MACRO_USAGE_EXAMPLE b1_demux_1_3_case

// this module is also the example of block demux: 3x3 !
module lab_top
(
    input   [2:0] din,
    input   [1:0] sel,
    output  [2:0] dout0,
    output  [2:0] dout1,
    output  [2:0] dout2
);
    `MACRO_USAGE_EXAMPLE dmux0
     (  
        .din    ( din   [0] ),
        .sel    ( sel       ),
        .dout0  ( dout0 [0] ),
        .dout1  ( dout1 [0] ),
        .dout2  ( dout2 [0] ) 
    );

    b1_demux_1_3_shift dmux1
    (
        .din    ( din   [1] ),
        .sel    ( sel       ),
        .dout0  ( dout0 [1] ),
        .dout1  ( dout1 [1] ),
        .dout2  ( dout2 [1] ) 
    );

    b1_demux_1_3_case_v2 dmux2
    (
        .din    ( din   [2] ),
        .sel    ( sel       ),
        .dout0  ( dout0 [2] ),
        .dout1  ( dout1 [2] ),
        .dout2  ( dout2 [2] ) 
    );

endmodule
