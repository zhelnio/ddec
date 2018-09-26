
`define ENABLE_SV_CODE

// this module have no SystemVerilog features in port list and can be used in pure Verilog code
module lab_top
(
    input  [1:0] idata0,
    input  [1:0] idata1,
    input  [1:0] idata2,
    input  [1:0] sel,
    output [1:0] odata0,
    output [1:0] odata1,
    output [1:0] odata2,
    output [1:0] odata3, 
    output [1:0] odata4 
);
    // 1-3. pure verilog examples
	b2_mux_3_1_case_full    b2_mux_3_1_case_full    (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata0));
	b2_mux_3_1_case         b2_mux_3_1_case         (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata1));
	b2_mux_3_1_case_default b2_mux_3_1_case_default (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata2));
    b2_mux_3_1_casez        b2_mux_3_1_casez        (.d0(idata0),.d1(idata1),.d2(idata2),.sel(sel),.y(odata3));

`ifdef ENABLE_SV_CODE
    // 4. SystemVerilog packed array example
    wire [3:0][1:0] input_data; // packed array is a SystemVerilog feature
                                // in Verilog you have to use 'wire [7:0] input_data' - the result is the same
    assign input_data = { idata2, idata2, idata1, idata0 };

    bN_mux_N_1
    #(
        .DATA_WIDTH ( 2 ),
        .ADDR_WIDTH ( 2 )
    )
    bN_mux_N_1
    (
        .d   ( input_data ),
        .sel ( sel        ),
        .y   ( odata4     )
    );

`else
    assign odata4 = 2'b0;
`endif
	
endmodule
