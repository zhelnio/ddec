// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

    reg        clk;
    reg        rst_n;
    reg        idata;
    wire [2:0] smile;
    wire       indicator;
    wire       strobe;

    //dut
    lab_top
    #(
        .CLK_DIV   ( 1         )
    )
    dut
    (
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .idata     ( idata     ),
        .smile     ( smile     ),
        .indicator ( indicator ),
        .strobe    ( strobe    )
    );

initial 
    begin
        // set inital values of signal
        clk = 1;
        rst_n = 0;
        idata = 0;
        
        #40;
           rst_n = 1;
        #20;
           idata = 0;
        #200;
           idata = 1;
        #100;
           idata = 0;
        #100;
           idata = 0;
    end
    
    //every 10 ns invert clk 
    always #10 clk = ~clk;


    initial 
        #2000 $finish;
    
   // do at the beginning of the simulation
   // print signal values on every change
   initial forever begin
       @(posedge clk);
       if(strobe) 
            $display("%5t rst_n=%b, idata=%b, smile=%b", 
                   $time, rst_n,    idata,    smile,   );
   end

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule
