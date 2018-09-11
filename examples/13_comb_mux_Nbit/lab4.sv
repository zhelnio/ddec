
module b2_mux_4_1_case_sv
#(
    parameter DATA_WIDTH = 4,
              ADDR_WIDTH = 4,
    parameter INPT_WIDTH = 2**ADDR_WIDTH
)(
    input  [INPT_WIDTH-1:0][DATA_WIDTH-1:0] d,   // packed array in a port list is a SystemVerilog feature
    input                  [ADDR_WIDTH-1:0] sel,
    output                 [DATA_WIDTH-1:0] y
);
    assign y = d[sel];

endmodule

// this module have no SystemVerilog features in port list and can be used in pure Verilog code
module lab4_top_sv
(
    input  [1:0] idata0,
    input  [1:0] idata1,
    input  [1:0] idata2,
    input  [1:0] sel,
    output [1:0] odata0,
    output [1:0] odata1,
    output [1:0] odata2,
    output [1:0] odata3 
);
    // 1-3. pure verilog examples
	b2_mux_3_1_case_latch    b2_mux_3_1_case_latch    (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata0));
	b2_mux_3_1_case_correct  b2_mux_3_1_case_correct  (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata1));
	b2_mux_3_1_casez_correct b2_mux_3_1_casez_correct (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata2));

    // 4. SystemVerilog packed array example
    wire [3:0][1:0] input_data; // packed array is a SystemVerilog feature
                                // in Verilog you have to use 'wire [7:0] input_data' - the result is the same
    assign input_data = { idata2, idata2, idata1, idata0 };

    b2_mux_4_1_case_sv
    #(
        .DATA_WIDTH ( 2 ),
        .ADDR_WIDTH ( 2 )
    )
    b2_mux_4_1_case_sv
    (
        .d   ( input_data ),
        .sel ( sel        ),
        .y   ( odata3     )
    );
	
endmodule
