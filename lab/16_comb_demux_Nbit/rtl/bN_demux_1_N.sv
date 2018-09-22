
module bN_demux_1_N
#(
    parameter DATA_WIDTH = 4,
              ADDR_WIDTH = 4,
    parameter OUTPT_SIZE = 2**ADDR_WIDTH
)(
    input                      [DATA_WIDTH-1:0] din,
    input                      [ADDR_WIDTH-1:0] sel,
    output reg [OUTPT_SIZE-1:0][DATA_WIDTH-1:0] dout // packed array in a port list is a SystemVerilog feature
);
    localparam ZEROS = { DATA_WIDTH { 1'b0 } };

    always @(*) begin
        for (int i = 0; i < OUTPT_SIZE; i = i+1 )
            dout[i] = ZEROS;
        
        dout[sel] = din;
    end

endmodule
