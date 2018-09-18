
module clk_divider
#( 
    parameter DELAY = 1
)(
    input  clk,
    input  rst_n,
    input  en,
    output strobe
);
    localparam WIDTH = $clog2(DELAY);
    localparam ZERO  = { WIDTH { 1'b0 } };

    reg [WIDTH-1:0] cntr;
    wire delay_end = (cntr == DELAY);

    always @ (posedge clk or negedge rst_n)
        if(~rst_n)
            cntr <= ZERO;
        else if(en) 
            cntr <= delay_end ? ZERO : cntr + 1;

    assign strobe = en & delay_end;

endmodule
