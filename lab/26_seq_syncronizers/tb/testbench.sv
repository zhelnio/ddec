`timescale 1 ns / 100 ps

module testbench;

    reg  clk, d;
    wire q;

    // dut
    sync sync (clk, d, q);
    
    initial $dumpvars;

    initial clk = 0;
    initial forever begin
        #20;
        clk = ~clk;
    end

    initial
    begin
        $monitor ("%0d clk %b d %b q %b", $time, clk, d, q);

        #80 d = 0;
        #80 d = 1;
        #80;

        $finish;
    end

endmodule
