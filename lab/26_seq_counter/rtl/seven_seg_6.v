
module seven_seg_6
(
    input  [23:0] data,
    output [ 7:0] hex0,
    output [ 7:0] hex1,
    output [ 7:0] hex2,
    output [ 7:0] hex3,
    output [ 7:0] hex4,
    output [ 7:0] hex5 
);
    seven_seg_digit dd0 (.dig (data[4*0 +: 4]), .hex (hex0) );
    seven_seg_digit dd1 (.dig (data[4*1 +: 4]), .hex (hex1) );
    seven_seg_digit dd2 (.dig (data[4*2 +: 4]), .hex (hex2) );
    seven_seg_digit dd3 (.dig (data[4*3 +: 4]), .hex (hex3) );
    seven_seg_digit dd4 (.dig (data[4*4 +: 4]), .hex (hex4) );
    seven_seg_digit dd5 (.dig (data[4*5 +: 4]), .hex (hex5) );

endmodule
