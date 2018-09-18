
set_global_assignment -name TOP_LEVEL_ENTITY board_top

# set_global_assignment -name VERILOG_FILE       ../rtl/board_top.v
# set_global_assignment -name VERILOG_FILE       ../rtl/syncronizer.v
set_global_assignment -name SEARCH_PATH        ../rtl

set_global_assignment -name SDC_FILE     ./system.sdc

set_global_assignment -name VERILOG_FILE       ../rtl/board_top.v
set_global_assignment -name VERILOG_FILE       ../rtl/display_driver.v
set_global_assignment -name VERILOG_FILE       ../rtl/prm_register.v
set_global_assignment -name VERILOG_FILE       ../rtl/prm_register_we.v
set_global_assignment -name VERILOG_FILE       ../rtl/sr04_control.v
set_global_assignment -name VERILOG_FILE       ../rtl/sr04_receiver.v
set_global_assignment -name VERILOG_FILE       ../rtl/strobe_gen.v
