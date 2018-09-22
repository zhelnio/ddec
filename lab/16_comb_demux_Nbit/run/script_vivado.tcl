
set source_files [list \
    "[file normalize "../rtl/b2_demux_1_4_univ.v"]" \
    "[file normalize "../rtl/bN_demux_1_4_case.v"]" \
    "[file normalize "../rtl/bN_demux_1_N.sv"]" \
    "[file normalize "../rtl/board_top.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
