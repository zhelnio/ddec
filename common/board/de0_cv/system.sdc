
create_clock -period "50.0 MHz" [get_ports CLK]
derive_clock_uncertainty

set_false_path -from [get_ports {KEY*}]  -to *
set_false_path -from [get_ports {SW*}]   -to *
set_false_path -from [get_ports {GPIO*}] -to *

set_false_path -from * -to [get_ports {LED*}]
set_false_path -from * -to [get_ports {HEX*}]
set_false_path -from * -to [get_ports {GPIO*}]
