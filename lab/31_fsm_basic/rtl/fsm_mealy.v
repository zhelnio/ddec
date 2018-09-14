
module fsm_mealy
(
    input  clk,
    input  rst_n,
    input  en,
    input  idata,
    output smile
);

    parameter S0 = 0,
              S1 = 1;

    reg  state;
    wire next_state;

    // State register
    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            state <= S0;
        else if (en)
            state <= next_state;

    // Next state logic
    assign next_state = idata ? S0 : S1;

    // Output logic based on current state
    assign smile = (idata & state == S1);

endmodule
