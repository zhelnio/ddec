`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
    reg  [1:0] a;
    reg  [1:0] b;
    reg  [1:0] c;
    reg  [1:0] sel;
    wire [5:0][1:0] data;
 
    // device under test
    lab4_top dut
    (
        .idata0 ( a       ),
        .idata1 ( b       ),
        .idata2 ( c       ),
        .sel    ( sel     ),
        .odata0 ( data[0] ),
        .odata1 ( data[1] ),
        .odata2 ( data[2] ),
        .odata3 ( data[3] ),
        .odata4 ( data[4] ),
        .odata5 ( data[5] )
    );
    
    initial 
        begin
            a = 2'b00;
            b = 2'b01;
            c = 2'b10;
            #5;
            sel = 2'b00;     // sel change to 00; a -> y
            #10;
            sel = 2'b01;     // sel change to 01; b -> y
            #10
            sel = 2'b10;     // sel change to 10; c -> y
            #10;
            sel = 2'b11;     // sel change to 11; ? -> y
            #10;
            sel = 2'b00;     // sel change to 00; a -> y
            #10;
            sel = 2'b11;     // sel change to 11; ? -> y
            #10;
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("a=%b b=%b c=%b sel=%b data[0]=%b data[1]=%b data[2]=%b data[3]=%b data[4]=%b data[5]=%b", 
                  a,   b,   c,   sel,   data[0],   data[1],   data[2],   data[3],   data[4],   data[5]);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
