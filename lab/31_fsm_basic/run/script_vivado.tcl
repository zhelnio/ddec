
set source_files [list \
    "[file normalize "../rtl/board_digilent.v"]" \
    "[file normalize "../rtl/clk_divider.v"]" \
    "[file normalize "../rtl/fsm_mealy.v"]" \
    "[file normalize "../rtl/fsm_moore.v"]" \
    "[file normalize "../rtl/fsm_moore_ose.v"]" \
    "[file normalize "../rtl/lab_top.v"]" \
    "[file normalize "../rtl/hex_smile.v"]" \
    "[file normalize "../rtl/hex_smile_ca.v"]" \
]

set constr_files [list \
    "[file normalize "./system.xdc"]" \
]

set sim_files [list \
    "[file normalize "../tb/testbench.sv"]" \
]
