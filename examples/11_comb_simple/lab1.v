
module lab1
(
    input  [1:0] KEY,  // KEYs
    output [9:0] LED   // LEDs
);

    wire a = ~ KEY [0];
    wire b = ~ KEY [1];

    // Basic gates AND, OR and NOT
    assign LED [0] = a & b;
    assign LED [1] = a | b;
    assign LED [2] = ~ a;
    
    // XOR gates (useful for adders, comparisons,
    // parity and control sum calculation)
    assign LED [3] = a ^ b;

    // Building XOR only using AND, OR and NOT
    assign LED [4] = (a | b) & ~ (a & b);

    // Building NOT by XORing with 1
    assign LED [5] = a ^ 1'b1;

    // De Morgan law illustration
    wire m0 = ~ ( a &   b ) ;
    wire m1 = ~   a | ~ b   ;
    wire m2 = ~ ( a |   b ) ;
    wire m3 = ~   a & ~ b   ;

    // joining signals
    assign LED [9:6] = { m3, m2, m1, m0 };

endmodule
