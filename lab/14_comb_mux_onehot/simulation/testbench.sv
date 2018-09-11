`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
    reg  [1:0] a;
    reg  [1:0] b;
    reg  [1:0] c;
    reg  [1:0] d;
    reg  [3:0] sel;
    wire [5:0][1:0] data;
 
    // device under test
    lab4_top_sv dut
    (
        .idata0 ( a       ),
        .idata1 ( b       ),
        .idata2 ( c       ),
        .idata3 ( c       ),
        .sel    ( sel     ),
        .odata0 ( data[0] ),
        .odata1 ( data[1] ),
        .odata2 ( data[2] ) 
    );

    initial 
        begin
            a = 2'b00;
            b = 2'b01;
            c = 2'b10;
            d = 2'b11;
            #5;
            sel = 4'b0000;     // sel change to 00; a -> y
            #10;
            sel = 4'b0001;     // sel change to 01; b -> y
            #10
            sel = 4'b0010;     // sel change to 10; c -> y
            #10;
            sel = 4'b0100;     // sel change to 11; ? -> y
            #10;
            sel = 4'b1000;     // sel change to 00; a -> y
            #10;
            sel = 4'b0011;     // sel change to 00; a -> y
            #10;
            sel = 4'b1010;     // sel change to 00; a -> y
            #10;
            sel = 4'b1111;     // sel change to 00; a -> y
            #10;
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("a=%b b=%b c=%b d=%b sel=%b data[0]=%b data[1]=%b data[2]=%b", 
                  a,   b,   c,   d,   sel,   data[0],   data[1],   data[2],   );
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
