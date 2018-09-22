`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    reg  [2:0] din;
    reg  [1:0] sel;
    wire [2:0] dout0;
    wire [2:0] dout1;
    wire [2:0] dout2;

    lab_top lab_top
    (
        .din   ( din   ),
        .sel   ( sel   ),
        .dout0 ( dout0 ),
        .dout1 ( dout1 ),
        .dout2 ( dout2 ) 
    );

    initial
        begin
            din = 3'b111;
            #5;
            sel = 2'b00;
            #10;
            sel = 2'b01;
            #10
            sel = 2'b10;
            #10;
            sel = 2'b11;
            #10;
            sel = 2'b10;
            #10;
            din = 3'b101;
            #10;
            din = 3'b010;
            #10;
            $finish();
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("sel=%b din=%b dout0=%b dout1=%b dout2=%b",
                  sel,   din,   dout0,   dout1,   dout2,   );
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
