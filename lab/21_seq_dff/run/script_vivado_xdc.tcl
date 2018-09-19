
create_clock -add -name slow_clock -period 10.00 -waveform {0 5} [get_ports {KEY[0]}];
