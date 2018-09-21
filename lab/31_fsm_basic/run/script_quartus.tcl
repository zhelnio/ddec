
set_global_assignment -name TOP_LEVEL_ENTITY board_terasic

set_global_assignment -name VERILOG_FILE       ../rtl/board_terasic.v
set_global_assignment -name VERILOG_FILE       ../rtl/clk_divider.v
set_global_assignment -name VERILOG_FILE       ../rtl/fsm_mealy.v
set_global_assignment -name VERILOG_FILE       ../rtl/fsm_moore.v
set_global_assignment -name VERILOG_FILE       ../rtl/fsm_moore_ose.v
set_global_assignment -name VERILOG_FILE       ../rtl/lab_top.v
set_global_assignment -name VERILOG_FILE       ../rtl/hex_smile.v

set_global_assignment -name SDC_FILE     ./system.sdc
