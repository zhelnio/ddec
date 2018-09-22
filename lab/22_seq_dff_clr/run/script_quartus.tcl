
set_global_assignment -name TOP_LEVEL_ENTITY board_top

set_global_assignment -name VERILOG_FILE       ../rtl/board_top.v
set_global_assignment -name VERILOG_FILE       ../rtl/dff_sync_clr.v

set_global_assignment -name SDC_FILE     ./system.sdc
set_global_assignment -name SDC_FILE     ../run/script_sdc.tcl
