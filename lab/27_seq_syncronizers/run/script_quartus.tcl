
set_global_assignment -name TOP_LEVEL_ENTITY board_top

set_global_assignment -name VERILOG_FILE       ../rtl/board_top.v
set_global_assignment -name VERILOG_FILE       ../rtl/syncronizer.v
set_global_assignment -name SEARCH_PATH        ../rtl

set_global_assignment -name SDC_FILE     ./system.sdc
