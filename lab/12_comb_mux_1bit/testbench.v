`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
    reg  a;
    reg  b;
    reg  sel;
    wire y_comb;
    wire y_sel;
    wire y_if;
    wire y_case;
    wire y_index;
 
   // creating the instance of the module we want to test
    lab_top dut
    (
        .idata0  ( a       ),
        .idata1  ( b       ),
        .sel     ( sel     ),
        .y_comb  ( y_comb  ),
        .y_sel   ( y_sel   ),
        .y_if    ( y_if    ),
        .y_case  ( y_case  ),
        .y_index ( y_index ) 
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
        $monitor("a=%b b=%b sel=%b y_comb=%b y_sel=%b y_if=%b y_case=%b y_index=%b", 
                 a, b, sel, y_comb, y_sel, y_if, y_case, y_index);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
