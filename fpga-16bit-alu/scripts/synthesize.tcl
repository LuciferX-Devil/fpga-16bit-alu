source [file join [file dirname [info script]] create_project.tcl]
launch_runs synth_1 -jobs 4
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} {
    error "Synthesis did not complete; inspect the Vivado run log."
}
open_run synth_1
report_utilization -file [file join $root build utilization_synth.rpt]
close_project
