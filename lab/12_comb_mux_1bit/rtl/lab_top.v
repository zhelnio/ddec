
module lab_top
(
    input        idata0,
    input        idata1,
    input        sel,
    output [4:0] y
);

    b1_mux_2_1_comb  b1_mux_2_1_comb  (   idata0, idata1,   sel, y[0] );
    b1_mux_2_1_sel   b1_mux_2_1_sel   (   idata0, idata1,   sel, y[1] );
    b1_mux_2_1_if    b1_mux_2_1_if    (   idata0, idata1,   sel, y[2] );
    b1_mux_2_1_case  b1_mux_2_1_case  (   idata0, idata1,   sel, y[3] );
    b1_mux_2_1_index b1_mux_2_1_index ( { idata1, idata0 }, sel, y[4] );

endmodule
