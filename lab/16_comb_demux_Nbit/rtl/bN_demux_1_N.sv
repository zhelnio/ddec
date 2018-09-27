
module bN_demux_1_N
#(
    parameter DATA_WIDTH = 4,
              ADDR_WIDTH = 4,
    parameter OUTPT_SIZE = 2**ADDR_WIDTH
)(
    input                      [DATA_WIDTH-1:0] din,
    input                      [ADDR_WIDTH-1:0] sel,
    // packed array in a port list is a SystemVerilog feature
    output reg [OUTPT_SIZE-1:0][DATA_WIDTH-1:0] dout 
);
    localparam ZEROS = { (OUTPT_SIZE * DATA_WIDTH) { 1'b0 } };

    always @(*) begin
        dout = ZEROS;
        dout[sel] = din;
    end

endmodule
