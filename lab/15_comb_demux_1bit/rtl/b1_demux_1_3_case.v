
module b1_demux_1_3_case
(
    input            din,
    input      [1:0] sel,
    output reg       dout0,
    output reg       dout1,
    output reg       dout2 
);
    always @(*)
        case (sel)
            2'b00 :  begin
                        dout0 = din;
                        dout1 = 0;
                        dout2 = 0;
                     end
            2'b01  : begin
                        dout0 = 0;
                        dout1 = din;
                        dout2 = 0;
                     end
            2'b10  : begin
                        dout0 = 0;
                        dout1 = 0;
                        dout2 = din;
                     end
            default: begin
                        dout0 = 0;
                        dout1 = 0;
                        dout2 = 0;
                     end
        endcase

endmodule
