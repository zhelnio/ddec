`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
    reg        a;
    reg        b;
    reg        sel;
    wire [4:0] y;
 
   // creating the instance of the module we want to test
    lab_top dut
    (
        .idata0  ( a       ),
        .idata1  ( b       ),
        .sel     ( sel     ),
        .y       ( y       ) 
    );

    initial
        begin
            a = 1'b0;
            b = 1'b1;
            #5;
            sel = 1'b0;     // sel change to 0; a -> y
            #10;
            sel = 1'b1;     // sel change to 1; b -> y
            #10
            b = 1'b0;		// b change; y changes too. sel == 1'b1
            #5
            b = 1'b1;
            #5;            // pause
            $finish();
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("a=%b b=%b sel=%b y=%b", 
                  a,   b,   sel,   y,   );
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
