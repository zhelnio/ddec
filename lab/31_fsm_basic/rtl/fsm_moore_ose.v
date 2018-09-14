
// Moore FSM with optimized states codes
module fsm_moore_osc
(
    input  clk,
    input  rst_n,
    input  en,
    input  idata,
    output smile
);
    parameter [1:0] S_RESET = 2'b00,
                    S_SMILE = 2'b01;

    reg  [1:0] state;
    wire [1:0] next_state;

    // State register
    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            state <= S_RESET;
        else if (en)
            state <= next_state;

    // Next state logic (shift register!)
    assign next_state = { state[0], idata };

    // Output logic based on current state
    assign smile = (state == S_SMILE);

endmodule
