
set_global_assignment -name TOP_LEVEL_ENTITY board_terasic

set_global_assignment -name SYSTEMVERILOG_FILE ../rtl/board_terasic.sv
set_global_assignment -name VERILOG_FILE       ../rtl/seven_seg_digit.v
set_global_assignment -name VERILOG_FILE       ../rtl/seven_seg_6.v
set_global_assignment -name SYSTEMVERILOG_FILE ../rtl/seven_seg_N.sv
