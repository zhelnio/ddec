`timescale 1 ns / 100 ps

module testbench;

    reg  clk, d;
    wire q;

    // dut
    sync sync (clk, d, q);
    
    initial $dumpvars;

    initial begin
        clk <= 0;
        forever
            #20 clk <= ~clk;
        end

    initial
    begin
        $monitor ("%0d clk %b d %b q %b", $time, clk, d, q);

        repeat(2) @(posedge clk);
        #10 d = 0;
        repeat(2) @(posedge clk);
        #10 d = 1;
        repeat(4) @(posedge clk);

        $finish;
    end

endmodule
