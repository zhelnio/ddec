`timescale 1 ns / 100 ps

module testbench;

    localparam t    = 20;
    localparam Tmax = 300000;
    localparam Twait = 100;
    localparam Techo = 40;
    localparam enableEcho = 0;
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
    lab_top
    #(
        .RANGE_WIDTH   ( WIDTH ),
        .DELAY_TRIGGER ( 10    ),
        .DELAY_WAIT    ( 200   ),
        .DELAY_POSTFIX ( 500   ) 
    )
    lab_top
    (
        .clk     ( clk       ),
        .rst_n   ( rst_n     ),
        .echo    ( echo      ),
        .trigger ( trigger   ),
        .range   ( range     ) 
    );

    initial begin
        echo = 1'b0;
        forever begin
            @(posedge clk);
            if(enableEcho) begin
                if(trigger) begin
                    repeat(Twait) @(posedge clk);
                    echo = 1'b1;
                    repeat(Techo) @(posedge clk);
                    echo = 1'b0;
                end
            end
        end
    end

    // test duration
    initial begin
        repeat(Tmax) @(posedge clk);
        $finish;
    end

    initial $monitor ("%5t trigger=%b echo=%b range=%d", $time, trigger, echo, range);
    initial $dumpvars;

endmodule
