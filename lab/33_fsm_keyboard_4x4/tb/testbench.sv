`timescale 1 ns / 100 ps

module testbench;

    localparam t    = 20;
    localparam Tmax = 300000;
    localparam WIDTH = 16;

    // clock and reset
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

    wire [ 3:0] row;
    wire [ 3:0] clm;
    wire [31:0] value;

    // DUT START

    kb_4x4 dut
    (
        .clk    ( clk   ),
        .rst_n  ( rst_n ),
        .row    ( row   ),
        .clm    ( clm   ),
        .value  ( value )
    );

    // DUT END

    // peripheral device simulation model
    wire [ 3:0] tb_btn;
    wire        tb_vld;

    kb_4x4_simulation_model kb
    (
        .clk    ( clk    ),
        .row    ( row    ),
        .clm    ( clm    ),
        .tb_btn ( tb_btn ),
        .tb_vld ( tb_vld ) 
    );

    // test duration
    initial begin
        repeat(Tmax) @(posedge clk);
        $finish;
    end

    initial $monitor ("%5t tb_btn=%d clm=%b row=%b value=%d", $time, tb_btn, clm, row, value);
    initial $dumpvars;

endmodule



module kb_4x4_simulation_model
#(
    parameter DELAY_UP   = 100,
              DELAY_DOWN = 300
)(
    input        clk,
    input  [3:0] clm,
    output [3:0] row,
    output [3:0] tb_btn,
    output       tb_vld
);
    reg [3:0] button_num;
    reg       button_valid;

    initial forever begin
        button_valid = 1'b1;
        button_num   = $urandom();
        $display ("%5t button %d pressed", $time, button_num);

        repeat(DELAY_UP) @(posedge clk);

        button_valid = 1'b0;
        $display ("%5t button %d released", $time, button_num);

        repeat(DELAY_DOWN) @(posedge clk);
    end

    wire [3:0] button_row = (1 << button_num[1:0]);
    wire [3:0] button_clm = (1 << button_num[3:2]);

    assign row    = (button_clm & ~clm) ? ~button_row : ~4'b0;
    assign tb_btn = button_num;
    assign tb_vld = button_valid;
 
endmodule
