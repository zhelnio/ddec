
module seven_seg_digit
(
    input      [3:0] dig,
    output reg [7:0] hex
);

    // . g f e d c b a   // Letter from the diagram below
    // 7 6 5 4 3 2 1 0   // Bit in seg

    //   --a--
    //  |     |
    //  f     b
    //  |     |
    //   --g--
    //  |     |
    //  e     c
    //  |     |
    //   --d-- 

    always @*
        case (dig)
        4'h0: hex = 8'b11000000;
        4'h1: hex = 8'b11111001;
        4'h2: hex = 8'b10100100;
        4'h3: hex = 8'b10110000;
        4'h4: hex = 8'b10011001;
        4'h5: hex = 8'b10010010;
        4'h6: hex = 8'b10000010;
        4'h7: hex = 8'b11111000;
        4'h8: hex = 8'b10000000;
        4'h9: hex = 8'b10010000;
        4'ha: hex = 8'b10001000;
        4'hb: hex = 8'b10000011;
        4'hc: hex = 8'b11000110;
        4'hd: hex = 8'b10100001;
        4'he: hex = 8'b10000110;
        4'hf: hex = 8'b10001110;
        endcase

endmodule
