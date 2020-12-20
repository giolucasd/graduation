onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /xbar_stage_8/SW
add wave -noupdate -expand /xbar_stage_8/LEDR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {901 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ps -endtime 100ps sim:/xbar_stage_8/SW 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000001 -range 7 0 -starttime 100ps -endtime 200ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 00000011 -range 7 0 -starttime 200ps -endtime 300ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 00000111 -range 7 0 -starttime 300ps -endtime 400ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 400ps -endtime 500ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 00011111 -range 7 0 -starttime 500ps -endtime 600ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 00111111 -range 7 0 -starttime 600ps -endtime 700ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 01111111 -range 7 0 -starttime 700ps -endtime 800ps Edit:/xbar_stage_8/SW 
wave modify -driver freeze -pattern constant -value 11111111 -range 7 0 -starttime 800ps -endtime 900ps Edit:/xbar_stage_8/SW 
WaveCollapseAll -1
wave clipboard restore
