
module lab_top
(
    input        clk,
    input  [1:0] idata0,
    input  [1:0] idata1,
    input  [1:0] idata2,
    input  [1:0] sel,
    input        le,
    output [1:0] case_latch,
    output [1:0] case_corrt,
    output [1:0] latch
);
    case_inferred_latch  case_inferred_latch (.d0(idata0), .d1(idata1), .d2(idata2), .sel(sel), .y(case_latch));
    mux_case_correct     mux_case_correct    (.d0(idata0), .d1(idata1), .d2(idata2), .sel(sel), .y(case_corrt));
    mod_latch            mod_latch           (.d (idata0), .le(le ),                            .y(latch)     );

endmodule
