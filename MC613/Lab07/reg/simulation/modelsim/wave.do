onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /reg/data_out
add wave -noupdate -expand /reg/data_in
add wave -noupdate /reg/clk
add wave -noupdate /reg/load
add wave -noupdate /reg/clear
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {130 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 59
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1061 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1000ps sim:/reg/data_in 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/reg/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1600ps Edit:/reg/clk 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/reg/load 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/reg/clear 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 1600ps Edit:/reg/clear 
wave modify -driver freeze -pattern constant -value 1 -starttime 1600ps -endtime 1700ps Edit:/reg/clear 
wave modify -driver freeze -pattern constant -value 1 -starttime 1600ps -endtime 1700ps Edit:/reg/load 
wave modify -driver freeze -pattern constant -value 0 -starttime 01600ps -endtime 1700ps Edit:/reg/clk 
wave modify -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 01600ps -endtime 1700ps Edit:/reg/data_in 
wave modify -driver freeze -pattern constant -value 0 -starttime 1500ps -endtime 1600ps Edit:/reg/clk 
wave modify -driver freeze -pattern constant -value 1 -starttime 1600ps -endtime 1700ps Edit:/reg/clk 
WaveCollapseAll -1
wave clipboard restore
