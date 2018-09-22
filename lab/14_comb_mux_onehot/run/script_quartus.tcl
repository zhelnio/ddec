
set_global_assignment -name TOP_LEVEL_ENTITY board_top

set_global_assignment -name VERILOG_FILE       ../rtl/board_top.v
set_global_assignment -name VERILOG_FILE       ../rtl/b2_mux_4_1.v
set_global_assignment -name SYSTEMVERILOG_FILE ../rtl/bN_mux_N_1_priority.sv
set_global_assignment -name SYSTEMVERILOG_FILE ../rtl/lab_top.sv
