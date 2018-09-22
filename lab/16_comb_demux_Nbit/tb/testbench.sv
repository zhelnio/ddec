`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    reg       [1:0] din;
    reg       [1:0] sel;
    wire [3:0][1:0] dout_0;
    wire [3:0][1:0] dout_1;

    b2_demux_1_4_univ
    #(
        .MODE  ( "CASE"      )
    )
    case_0
    (
        .din   ( din         ),
        .sel   ( sel         ),
        .dout0 ( dout_0 [0]  ),
        .dout1 ( dout_0 [1]  ),
        .dout2 ( dout_0 [2]  ),
        .dout3 ( dout_0 [3]  )
    );

    b2_demux_1_4_univ
    #(
        .MODE  ( "SV" )
    )
    case_1
    (
        .din   ( din         ),
        .sel   ( sel         ),
        .dout0 ( dout_1 [0]  ),
        .dout1 ( dout_1 [1]  ),
        .dout2 ( dout_1 [2]  ),
        .dout3 ( dout_1 [3]  )
    );

    initial
        begin
            din = 2'b11;
            #5;
            sel = 2'b00;     // sel change to 00; a -> y
            #10;
            sel = 2'b01;     // sel change to 01; b -> y
            #10
            sel = 2'b10;     // sel change to 10; c -> y
            #10;
            sel = 2'b11;     // sel change to 11; ? -> y
            #10;
            din = 2'b10;
            #10;
            din = 2'b01;
            #10;
            $finish();
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("sel=%b din=%b dout_0=%b dout_1=%b",
                  sel,   din,   dout_0,   dout_1,  );
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
