
module kb_4x4
(
    input         clk,
    input         rst_n,
    input  [ 3:0] row,
    output [ 3:0] clm,
    output [31:0] value
);
    // replace it with your code
    assign clm   = 4'b1110;
    assign value = 32'b0;

endmodule
