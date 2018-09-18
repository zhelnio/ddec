
module strobe_gen
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

    wire [WIDTH-1:0] cntr;
    wire [WIDTH-1:0] cntr_nx;
    prm_register #(WIDTH) cntr_r (clk, rst_n, cntr_nx, cntr);

    wire   cntr_clr = (cntr == DELAY);
    assign cntr_nx  = cntr_clr ? ZERO : cntr + 1;

    assign strobe = en & cntr_clr;

endmodule
