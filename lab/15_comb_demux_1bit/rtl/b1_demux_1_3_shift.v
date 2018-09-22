
module b1_demux_1_3_shift
(
    input        din,
    input  [1:0] sel,
    output       dout0,
    output       dout1,
    output       dout2 
);
    assign { dout2, dout1, dout0 } = din << sel;

endmodule
