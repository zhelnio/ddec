
module bN_mux_N_1
#(
    parameter DATA_WIDTH = 4,
              ADDR_WIDTH = 4,
    parameter INPT_WIDTH = 2**ADDR_WIDTH
)(
    // packed array in a port list is a SystemVerilog feature
    input  [INPT_WIDTH-1:0][DATA_WIDTH-1:0] d,   
    input                  [ADDR_WIDTH-1:0] sel,
    output                 [DATA_WIDTH-1:0] y
);
    assign y = d[sel];

endmodule
