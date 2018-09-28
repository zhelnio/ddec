
set source_files [list \
    "[file normalize "../rtl/board_digilent.sv"]" \
    "[file normalize "../rtl/seven_seg_digit.v"]" \
    "[file normalize "../rtl/seven_seg_N_ca.sv"]" \
    "[file normalize "../rtl/counter.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
