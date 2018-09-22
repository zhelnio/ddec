
set source_files [list \
    "[file normalize "../rtl/b1_demux_1_3_case.v"]" \
    "[file normalize "../rtl/b1_demux_1_3_case_v2.v"]" \
    "[file normalize "../rtl/b1_demux_1_3_shift.v"]" \
    "[file normalize "../rtl/board_top.v"]" \
    "[file normalize "../rtl/lab_top.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
