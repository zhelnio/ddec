
module b2_mux_N_1_priority_sv
#(
    parameter DATA_WIDTH = 4,
              INPUT_SIZE = 4
)(
    input      [INPUT_SIZE-1:0][DATA_WIDTH-1:0] d,   // packed array in a port list is a SystemVerilog feature
    input      [INPUT_SIZE-1:0]                 sel,
    output reg                 [DATA_WIDTH-1:0] y
);
    always @(*) begin
        y = d[0];
        for (int i = 0; i < INPUT_SIZE; i = i+1 ) begin
            if(sel[i])
                y = d[i];
        end
    end

endmodule


// this module have no SystemVerilog features in port list and can be used in pure Verilog code
module lab4_top_sv
(
    input  [1:0] idata0, 
    input  [1:0] idata1,
    input  [1:0] idata2,
    input  [1:0] idata3,
    input  [3:0] sel,
    output [1:0] odata0,
    output [1:0] odata1,
    output [1:0] odata2
);
    // 1-2. pure Verilog examples
    b2_mux_3_1_case_one_hot   b2_mux_3_1_case_one_hot   (.d0(idata0), .d1(idata1), .d2(idata2), .d3(idata3), .sel(sel), .y(odata0));
    b2_mux_3_1_casez_priority b2_mux_3_1_casez_priority (.d0(idata0), .d1(idata1), .d2(idata2), .d3(idata3), .sel(sel), .y(odata1));

    // 3. SystemVerilog packed array example
    wire [3:0][1:0] input_data; // packed array is a SystemVerilog feature
                                // in Verilog you have to use 'wire [7:0] input_data' - the result is the same
    assign input_data = { idata3, idata2, idata1, idata0 };

    b2_mux_N_1_priority_sv
    #(
        .DATA_WIDTH ( 2 ),
        .INPUT_SIZE ( 4 ) 
    )
    b2_mux_N_1_priority_sv
    (
        .d   ( input_data ),
        .sel ( sel        ),
        .y   ( odata2     )
    );

endmodule
