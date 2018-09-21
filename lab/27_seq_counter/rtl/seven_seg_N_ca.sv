
module seven_seg_N_ca
#(
    parameter DIGITS   = 6,
              DT_WIDTH = 4 * DIGITS,
              DN_WIDTH = $clog2(DIGITS)
)(
    input  [DT_WIDTH-1:0] data,
    input  [DN_WIDTH-1:0] digit,
    output [         7:0] hex,
    output [  DIGITS-1:0] an
);
    wire [DIGITS-1:0][3:0] value = data;
    wire             [3:0] dig;

    assign an = ~(1 << digit);
    assign dig = value[digit];

    seven_seg_digit dd ( .dig (dig), .hex (hex) );

endmodule
