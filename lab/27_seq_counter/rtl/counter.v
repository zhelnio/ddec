
module counter
#(
    parameter WIDTH = 1
)(
    input                  clk,
    input                  rst_n,
    output reg [WIDTH-1:0] cntr
);
    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            cntr <= 0;
        else
            cntr <= cntr + 1;
endmodule

module counter_block
#(
    parameter WIDTH = 1
)(
    input              clk,
    input              rst_n,
    output [WIDTH-1:0] cntr
);
    wire [WIDTH-1:0] cntr_nx = cntr + 1;
    register_c #(WIDTH) r_cntr (clk, rst_n, cntr_nx, cntr);

endmodule

module register_c
#(
    parameter WIDTH = 1
)(
    input                  clk,
    input                  rst_n,
    input      [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            q <= 0;
        else
            q <= d;
 
endmodule
