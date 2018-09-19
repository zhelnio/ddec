
set source_files [list \
    "[file normalize "../rtl/comb_mux_1bit.v"]" \
    "[file normalize "../rtl/lab_top.v"]" \
    "[file normalize "../rtl/board_top.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
