
module seven_seg_N
#(
    parameter DIGITS = 6
)(
    input  [4*DIGITS-1:0]      data,
    output [  DIGITS-1:0][7:0] seg
);
    wire [DIGITS-1:0][3:0] dig = data;

    genvar i;
    generate
        for (i = 0; i < DIGITS; i=i+1 ) begin : segment
            seven_seg_digit dd ( .dig (dig[i]), .hex (seg[i]) );
        end
    endgenerate

endmodule
