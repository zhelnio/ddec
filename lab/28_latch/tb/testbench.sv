`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    
    localparam t = 20;

    reg  [2:0][1:0] data;
    reg       [1:0] sel;
    reg             le;
    wire      [1:0] case_latch;
    wire      [1:0] case_corrt;
    wire      [1:0] latch;
 
    reg  clk;
    initial begin
        clk <= 0;
        forever 
            #(t/2) clk <= ~clk;
    end

    // device under test
    lab_top dut
    (
        .clk        ( clk        ),
        .idata0     ( data[0]    ),
        .idata1     ( data[1]    ),
        .idata2     ( data[2]    ),
        .sel        ( sel        ),
        .le         ( le         ),
        .case_latch ( case_latch ),
        .case_corrt ( case_corrt ),
        .latch      ( latch      ) 
    );

    initial 
        begin
            data = 6'b111001;
            
            @(posedge clk); sel = 2'b00; le = 1'b1;
            @(posedge clk); sel = 2'b01;
            @(posedge clk); sel = 2'b10;
            @(posedge clk); $display("sel = incorrect value"); 
                            sel = 2'b11; 
            
            @(posedge clk); data[0] = 2'b00;
            @(posedge clk); data[0] = 2'b01;
            @(posedge clk); $display("corrected:");
                            sel = 2'b01;
            @(posedge clk); $display("sel = incorrect value");
                            sel = 2'b11;
            @(posedge clk); $display("corrected:");
                            sel = 2'b00;
            @(posedge clk); data[0] = 2'b11;

            @(posedge clk); $display("latch disable:");
                            le = 1'b0;
            @(posedge clk); data[0] = 2'b10;
            @(posedge clk); $display("latch enable:");
                            le = 1'b1;
            @(posedge clk); data[0] = 2'b01;

            $finish();
        end

    initial
        $monitor("data=%b sel=%b le=%b case_latch=%b case_corrt=%b latch=%b", 
                  data,   sel,   le,   case_latch,   case_corrt,   latch    );

    initial 
        $dumpvars;

endmodule
