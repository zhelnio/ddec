`timescale 1 ns / 100 ps

module testbench;

    localparam t    = 20;
    localparam Tmax = 300;
    localparam WIDTH = 8;

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

    wire [WIDTH-1:0] value;

    // dut
    counter #(WIDTH) counter (clk, rst_n, value);

    // test duration
    initial begin
        repeat(Tmax) @(posedge clk);
        $finish;
    end

    initial $monitor ("%5t value=%3d %8b", $time, value, value);
    initial $dumpvars;

endmodule
