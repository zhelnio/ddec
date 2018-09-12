
module lab_top
(
    input   idata0,
    input   idata1,
    input   sel,
    output  y_comb, 
    output  y_sel,  
    output  y_if,   
    output  y_case, 
    output  y_index
);

    b1_mux_2_1_comb  b1_mux_2_1_comb  (   idata0, idata1,   sel, y_comb  );
    b1_mux_2_1_sel   b1_mux_2_1_sel   (   idata0, idata1,   sel, y_sel   );
    b1_mux_2_1_if    b1_mux_2_1_if    (   idata0, idata1,   sel, y_if    );
    b1_mux_2_1_case  b1_mux_2_1_case  (   idata0, idata1,   sel, y_case  );
    b1_mux_2_1_index b1_mux_2_1_index ( { idata0, idata1 }, sel, y_index );

endmodule
