
set_global_assignment -name TOP_LEVEL_ENTITY board_top

set_global_assignment -name SEARCH_PATH        ../rtl

set_global_assignment -name SDC_FILE     ./system.sdc

set_global_assignment -name VERILOG_FILE       ../rtl/board_top.v
set_global_assignment -name VERILOG_FILE       ../rtl/display_driver.v
set_global_assignment -name VERILOG_FILE       ../rtl/kb_4x4.v.v

set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to GPIO[0]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to GPIO[1]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to GPIO[2]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to GPIO[3]
