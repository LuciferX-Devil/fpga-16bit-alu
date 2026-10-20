# Run from any directory: vivado -mode batch -source <repo>/scripts/create_project.tcl
set root [file normalize [file join [file dirname [info script]] ..]]
set part xa7a12tcpg238-2I
if {[info exists ::env(FPGA_PART)]} { set part $::env(FPGA_PART) }
create_project alu16 [file join $root build vivado] -part $part -force
set_property target_language Verilog [current_project]
add_files [glob [file join $root rtl *.v]]
set_property top alu16 [get_filesets sources_1]
add_files -fileset sim_1 [glob [file join $root tb *.v]]
set_property top alu16_tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
puts "Created project: [file join $root build vivado alu16.xpr]"
