`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    reg       [1:0] din;
    reg       [1:0] sel;
    wire [3:0][1:0] dout_case;
    wire [3:0][1:0] dout_block;
    wire [3:0][1:0] dout_sv;

    lab_top
    #(
        .MODE  ( "CASE"        )
    )
    lab_top_case
    (
        .din   ( din           ),
        .sel   ( sel           ),
        .dout0 ( dout_case[0]  ),
        .dout1 ( dout_case[1]  ),
        .dout2 ( dout_case[2]  ),
        .dout3 ( dout_case[3]  )
    );

    lab_top
    #(
        .MODE  ( "BLOCK"       )
    )
    lab_top_block
    (
        .din   ( din           ),
        .sel   ( sel           ),
        .dout0 ( dout_block[0] ),
        .dout1 ( dout_block[1] ),
        .dout2 ( dout_block[2] ),
        .dout3 ( dout_block[3] )
    );

    lab_top lab_top_sv
    (
        .din   ( din           ),
        .sel   ( sel           ),
        .dout0 ( dout_sv[0]    ),
        .dout1 ( dout_sv[1]    ),
        .dout2 ( dout_sv[2]    ),
        .dout3 ( dout_sv[3]    )
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
        $monitor("sel=%b din=%b din=%b dout_case=%b dout_block=%b dout_sv=%b",
                  sel,   din,   din,   dout_case,   dout_block,   dout_sv);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
