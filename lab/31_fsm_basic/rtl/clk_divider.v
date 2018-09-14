
// this is a bot only a counter
// but also a counter-based FSM
module clk_divider
#( 
    parameter WIDTH = 24 
)(
    input  clk,
    input  rst_n,
    output strobe,
    output half
);
    localparam ZERO = { WIDTH { 1'b0 } };

    // state
    reg [WIDTH-1:0] counter;
    always @ (posedge clk or negedge rst_n)
    begin
        if (~rst_n)
            counter <= ZERO;
        else
            counter <= counter + 1; //next state
    end

    // state-based output
    assign strobe = (counter == ZERO);
    assign half   =  counter[WIDTH-1];

endmodule
