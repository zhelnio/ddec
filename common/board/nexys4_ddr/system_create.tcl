
# path where project will be created
set project_path [pwd]
set script_path [file dirname [file normalize [info script]]]

# global settings
set project_name    "system"
set project_part    "xc7a100tcsg324-1"
set testbench_top   "testbench"

# source files path
set rtl_path $project_path/../rtl
set tb_path  $project_path/../tb

# load project local settings
source $project_path/../run/script_vivado.tcl

# create project
create_project $project_name $project_path -part $project_part -force

# fill 'sources_1' fileset
if {[info exists source_files]} {
    add_files -norecurse -fileset [get_filesets sources_1] $source_files
}

# fill 'constrs_1' fileset
if {[info exists constr_files]} {
    add_files -norecurse -fileset [get_filesets constrs_1] $constr_files
}

# fill 'sim_1' fileset
if {[info exists sim_files]} {
    set obj [get_filesets sim_1]
    add_files -norecurse -fileset $obj $sim_files
    set_property top $testbench_top $obj
}

puts "INFO: Project created:$project_name"
