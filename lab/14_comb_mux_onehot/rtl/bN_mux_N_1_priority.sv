
module bN_mux_N_1_priority
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
