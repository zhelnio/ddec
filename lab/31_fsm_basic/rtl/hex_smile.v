
module hex_smile
(
    input        smile,
    output [7:0] hex
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

    assign hex = smile ? 8'b10011101 : 8'b10111111;

endmodule
