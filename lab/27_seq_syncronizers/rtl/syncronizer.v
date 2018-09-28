
module sync
#(
    parameter WIDTH = 1
)(
    input                  clk,
    input      [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    reg [WIDTH-1:0] buffer;

    always @ (posedge clk) begin
        buffer <= d;
        q <= buffer;
    end

endmodule

module sync_merge
#(
    parameter WIDTH = 1
)(
    input                  clk,
    input      [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    reg [WIDTH-1:0] buffer;

    always @ (posedge clk) begin
        { q, buffer } <= { buffer, d };
    end

endmodule

module sync_block
#(
    parameter WIDTH = 1
)(
    input              clk,
    input  [WIDTH-1:0] d,
    output [WIDTH-1:0] q
);
    wire [WIDTH-1:0] buffer;
    d_flip_flop #(WIDTH) dff_0 (clk, d, buffer);
    d_flip_flop #(WIDTH) dff_1 (clk, buffer, q);

endmodule


module d_flip_flop
#(
    parameter WIDTH = 1
)(
    input                  clk,
    input      [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    always @ (posedge clk)
        q <= d;
 
endmodule
