
`include "config.vh"

module sync
#(
    parameter WIDTH = 1
)(
    input              clk,
    input  [WIDTH-1:0] d,
    output [WIDTH-1:0] q
);

`ifdef SYNC_IMPL0
    reg [WIDTH-1:0] buffer0;
    reg [WIDTH-1:0] buffer1;

    always @ (posedge clk) begin
        { buffer1, buffer0 } <= { buffer0, d };
    end

    assign q = buffer1;
`endif

`ifdef SYNC_IMPL1
    reg [WIDTH-1:0] buffer0;
    reg [WIDTH-1:0] buffer1;

    always @ (posedge clk) begin
        buffer0 <= d;
        buffer1 <= buffer0;
    end

    assign q = buffer1;
`endif

`ifdef SYNC_BLOCK
    wire [WIDTH-1:0] buffer;
    d_flip_flop #(WIDTH) dff_0 (clk, d, buffer);
    d_flip_flop #(WIDTH) dff_1 (clk, buffer, q);
`endif

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
