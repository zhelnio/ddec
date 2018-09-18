`timescale 1 ns / 100 ps

module testbench;

    localparam t    = 20;
    localparam Tmax = 300000;
    localparam WIDTH = 16;

    // clock abn reset
    reg  clk, rst_n;

    initial begin
        clk <= 0;
        forever
            #(t/2) clk <= ~clk;
    end

    initial begin
        rst_n <= 'b0;
        repeat(3) @(posedge clk);
        rst_n <= 'b1;
    end

    wire [WIDTH-1:0] range;
    reg              echo;
    wire             trigger;

    // dut
    sr04_receiver
    #(
        .RANGE_WIDTH      ( WIDTH ),
        .DELAY_CLK_1US    ( 3     ),
        .DELAY_1US_1SM    ( 3     ),
        .DELAY_TRIGGER_US ( 2     ),
        .DELAY_ECHO_US    ( 2000  ),
        .DELAY_POSTFIX_US ( 5000  ) 
    )
    dut
    (
        .clk     ( clk       ),
        .rst_n   ( rst_n     ),
        .echo    ( echo      ),
        .trigger ( trigger   ),
        .range   ( range     ) 
    );

    // peripheral device simulation model
    sr04_simulation_model sensor
    (
        .clk     ( clk     ),
        .trigger ( trigger ),
        .enable  ( 1'b1    ),
        .echo    ( echo    ) 
    );

    // test duration
    initial begin
        repeat(Tmax) @(posedge clk);
        $finish;
    end

    initial $monitor ("%5t trigger=%b echo=%b range=%d", $time, trigger, echo, range);
    initial $dumpvars;

endmodule

module sr04_simulation_model 
#(
    parameter Twait = 1000,
              Techo = 3000
)(
    input      clk,
    input      trigger,
    input      enable,
    output reg echo
);

    initial begin
        echo = 1'b0;
        forever begin
            @(posedge clk);
            @(negedge trigger);
            if(enable) begin
                repeat(Twait) @(posedge clk);
                echo = 1'b1;
                repeat(Techo) @(posedge clk);
                echo = 1'b0;
            end
        end
    end

endmodule
