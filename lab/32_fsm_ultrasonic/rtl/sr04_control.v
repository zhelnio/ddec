

module sr04_control
#(
    parameter DELAY_TRIGGER = 10,
              DELAY_ECHO    = 25000,
              DELAY_POSTFIX = 500000,
              DELAY_WIDTH   = $clog2(DELAY_POSTFIX)
)(
    input      clk,
    input      rst_n,
    input      strobe_us,
    input      strobe_cm,
    input      echo,
    output reg trigger,
    output reg measure_cm,
    output reg measure_end
);
    localparam S_TRIGGER = 0, // trigger input to module
               S_ECHO    = 1, // wait for echo signal
               S_SAVE    = 2, // save the result
               S_POSTFIX = 3; // measurement cycle final delay,
    
    //                                      S_SAVE ---.
    //                                                |
    // state   :    <- S_TRIGGER -><-     S_ECHO    ->X<- S_POSTFIX ->
    // trigger : .../`````````````\__________________________________...
    // echo    : ...___________________/```````````\_________________...

    // State variables
    wire [            1:0] state;
    reg  [            1:0] state_nx;
    prm_register #(2) state_r (clk, rst_n, state_nx, state);

    wire [DELAY_WIDTH-1:0] delay;
    wire [DELAY_WIDTH-1:0] delay_nx = (state_nx != state) ? 0 : delay + 1;
    wire                   delay_we = strobe_us;
    prm_register_we #(DELAY_WIDTH) delay_r (clk, rst_n, delay_we, delay_nx, delay);

    // next state variables value
    always @(*) begin
        state_nx = state;
        case (state)
            S_TRIGGER : if (delay == DELAY_TRIGGER)
                            state_nx = S_ECHO;
            S_ECHO    : if (delay == DELAY_ECHO)
                            state_nx = S_SAVE;
            S_SAVE    : state_nx = S_POSTFIX;
            S_POSTFIX : if (delay == DELAY_POSTFIX)
                            state_nx = S_TRIGGER;
        endcase
    end

    // fsm output
    always @(*) begin
        trigger     = 1'b0;
        measure_cm  = 1'b0;
        measure_end = 1'b0;
        case (state)
            S_TRIGGER : trigger     = 1'b1;
            S_ECHO    : measure_cm  = strobe_cm & echo;
            S_SAVE    : measure_end = 1'b1;
        endcase
    end

endmodule
