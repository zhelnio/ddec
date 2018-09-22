
module bN_demux_1_4_case
#(
    parameter   DATA_WIDTH = 2
)(
    input      [DATA_WIDTH-1:0] din,
    input      [           1:0] sel,
    output reg [DATA_WIDTH-1:0] dout0,
    output reg [DATA_WIDTH-1:0] dout1,
    output reg [DATA_WIDTH-1:0] dout2,
    output reg [DATA_WIDTH-1:0] dout3
);
    localparam ZEROS = { DATA_WIDTH { 1'b0 } };

    always @(*) begin
        dout0 = ZEROS;
        dout1 = ZEROS;
        dout2 = ZEROS;
        dout3 = ZEROS;

        case (sel)
             2'b00: dout0 = din;
             2'b01: dout1 = din;
             2'b10: dout2 = din;
             2'b11: dout3 = din;
        endcase
    end
         
endmodule
