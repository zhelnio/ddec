
set source_files [list \
    "[file normalize "../rtl/board_top.v"]" \
    "[file normalize "../rtl/d_flip_flop.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
    "[file normalize "../run/script_vivado_xdc.tcl "]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
