
module b2_demux_1_4_univ
#(
    parameter MODE = "CASE"
)(
    input  [1:0] din,
    input  [1:0] sel,
    output [1:0] dout0,
    output [1:0] dout1,
    output [1:0] dout2,
    output [1:0] dout3
);
    // generate & parameter can be used to select one of module implementations
    generate
        // the 1st implementation
        if(MODE == "CASE") begin : demux_case
            bN_demux_1_4_case #(2) dmux
            (
                .din    ( din   ),
                .sel    ( sel   ),
                .dout0  ( dout0 ),
                .dout1  ( dout1 ),
                .dout2  ( dout2 ),
                .dout3  ( dout3 ) 
            );
        end

        // the 2nd implementation
        else if(MODE == "SV") begin : demux_sv
            wire [7:0] dout;
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

        // or the module stub!
        else begin : nothing
            assign dout0 = 2'b0;
            assign dout1 = 2'b0;
            assign dout2 = 2'b0;
            assign dout3 = 2'b0;
        end

    endgenerate
endmodule
