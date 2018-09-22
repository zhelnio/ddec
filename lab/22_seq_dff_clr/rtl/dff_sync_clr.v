module dff_sync_clr
(
    input       clk,
    input       clr,
    input       d,
    output  reg q
);

    always @ (posedge clk)
        if (clr)
            q <= 0;
        else
            q <= d;
 
endmodule
