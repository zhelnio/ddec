module b1_mux_2_1_comb
(
    input  d0,
    input  d1,
    input  sel,
    output y
);

    assign y = (sel & d1) | (~sel & d0);

endmodule

module b1_mux_2_1_sel
(
    input  d0,
    input  d1,
    input  sel,
    output y
);

    assign y = sel ? d1 : d0;

endmodule

module b1_mux_2_1_if
(
    input  d0,
    input  d1,
    input  sel,
    output reg y
);
	always@(*)
	begin
		if(sel)
			y = d1;
		else 
			y = d0;
	end

endmodule

module b1_mux_2_1_case
(
    input  d0,
    input  d1,
    input  sel,
    output reg y
);
	always@(*)
	begin
		case (sel)
			0: y = d0;
			1: y = d1;
		endcase
	end

endmodule

module b1_mux_2_1_index
(
    input  [1:0] d,
    input        sel,
    output       y
);
    assign y = d[sel];

endmodule

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

module board_top
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LED
);

    lab_top lab_top
    (
        .idata0  ( SW  [0] ),
        .idata1  ( SW  [1] ),
        .sel     ( KEY [0] ),
        .y_comb  ( LED [0] ),
        .y_sel   ( LED [1] ),
        .y_if    ( LED [2] ),
        .y_case  ( LED [3] ),
        .y_index ( LED [4] ) 
    );

endmodule
