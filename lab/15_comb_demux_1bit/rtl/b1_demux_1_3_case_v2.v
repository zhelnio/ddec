
module b1_demux_1_3_case_v2
(
    input            din,
    input      [1:0] sel,
    output reg       dout0,
    output reg       dout1,
    output reg       dout2 
);
    always @(*) begin
        dout0 = 1'b0;
        dout1 = 1'b0;
        dout2 = 1'b0;
        case (sel)
             2'b00: dout0 = din;
             2'b01: dout1 = din;
             2'b10: dout2 = din;
        endcase
    end

endmodule
