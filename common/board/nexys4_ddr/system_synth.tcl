
set project_name  "system"
set synth_task    "synth_1"
set impl_task     "impl_1"
set timing_report "timing_1"

open_project "$project_name.xpr"

# run synthesis
launch_runs $synth_task -jobs 2
wait_on_run -verbose $synth_task

# run implementation
launch_runs $impl_task  -jobs 2 -to_step write_bitstream
wait_on_run -verbose $impl_task

# create the timing report
open_run $impl_task -name $impl_task
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets
