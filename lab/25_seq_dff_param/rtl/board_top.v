module board_top
(
    input  [ 1:0] KEY,
    input  [ 9:0] SW,
    output [ 9:0] LED
);
    wire clk   = KEY[1];
    wire rst_n = SW [0];

    localparam WIDTH = 6;
    localparam ZEROD = { WIDTH {1'b0} };

    wire [WIDTH-1:0] d = SW [1 +: WIDTH];
    wire [WIDTH-1:0] q;

    dff_async_rst_n_param 
    #(
        .WIDTH ( WIDTH ), 
        .RESET ( ZEROD )
    ) 
    dff_async_rst_n_param
    (
        .clk   ( clk   ),
        .rst_n ( rst_n ),
        .d     ( d     ),
        .q     ( q     )
    );

    assign LED[      0] = rst_n;
    assign LED[WIDTH:1] = q;

endmodule
