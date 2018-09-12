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
