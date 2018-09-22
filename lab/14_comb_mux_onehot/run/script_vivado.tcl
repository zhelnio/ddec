
set source_files [list \
    "[file normalize "../rtl/board_top.v"]" \
    "[file normalize "../rtl/b2_mux_4_1.v"]" \
    "[file normalize "../rtl/bN_mux_N_1_priority.sv"]" \
    "[file normalize "../rtl/lab_top.sv"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
