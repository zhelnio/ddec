
module hex_smile_ca
(
    input            clk,
    input            rst_n,
    input      [2:0] smile,
    output     [7:0] hex,
    output reg [7:0] an
);
    // clock divider
    reg [13:0] cntr;
    always @ (posedge clk or negedge rst_n)
    if (! rst_n)
        cntr <= 14'b0;
    else
        cntr <= cntr + 1;

    // digit selector
    reg digit_smile;
    always @(*) begin
        an          = ~8'b0;
        digit_smile =  1'b0;
        case (cntr[13:12])
            2'b00 : begin an[0] = 1'b0; digit_smile = smile[0]; end
            2'b01 : begin an[1] = 1'b0; digit_smile = smile[1]; end
            2'b10 : begin an[2] = 1'b0; digit_smile = smile[2]; end
        endcase
    end

    hex_smile dd ( .smile (digit_smile), .hex (hex) );

endmodule
