
set source_files [list \
    "[file normalize "../rtl/board_top.v"]" \
    "[file normalize "../rtl/display_driver.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
