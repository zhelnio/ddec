
module lab_top
#(
    parameter MODE = ""
)(
    input  [1:0] din,
    input  [1:0] sel,
    output [1:0] dout0,
    output [1:0] dout1,
    output [1:0] dout2,
    output [1:0] dout3
);
    generate
        if(MODE == "CASE") begin : demux_case
            bn_demux_1_4_case #(2) dmux
            (
                .din    ( din   ),
                .sel    ( sel   ),
                .dout0  ( dout0 ),
                .dout1  ( dout1 ),
                .dout2  ( dout2 ),
                .dout3  ( dout3 ) 
            );
        end

        else if(MODE == "BLOCK") begin : demux_block
            b2_demux_1_4_block dmux
            (
                .din    ( din   ),
                .sel    ( sel   ),
                .dout0  ( dout0 ),
                .dout1  ( dout1 ),
                .dout2  ( dout2 ),
                .dout3  ( dout3 ) 
            );
        end

        else begin : demux_sv
            wire [3:0][1:0] dout;
            assign { dout3, dout2, dout1, dout0 } = dout;

            bN_demux_1_N
            #(
                .DATA_WIDTH (2),
                .ADDR_WIDTH (2)
            )
            dmux
            (
                .din  ( din  ),
                .sel  ( sel  ),
                .dout ( dout ) 
            );
        end
    endgenerate
endmodule
