onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /xbar_stage_5/SW
add wave -noupdate -expand /xbar_stage_5/LEDR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {599 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
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
configure wave -timelineunits ns
update
WaveRestoreZoom {225 ps} {677 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 0ps -endtime 100ps sim:/xbar_stage_5/SW 
wave create -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 0ps -endtime 100ps sim:/xbar_stage_5/SW 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 100ps -endtime 200ps Edit:/xbar_stage_5/SW 
wave modify -driver freeze -pattern constant -value 00011 -range 4 0 -starttime 200ps -endtime 300ps Edit:/xbar_stage_5/SW 
wave modify -driver freeze -pattern constant -value 00111 -range 4 0 -starttime 300ps -endtime 400ps Edit:/xbar_stage_5/SW 
wave modify -driver freeze -pattern constant -value 01111 -range 4 0 -starttime 400ps -endtime 500ps Edit:/xbar_stage_5/SW 
wave modify -driver freeze -pattern constant -value 11111 -range 4 0 -starttime 500ps -endtime 600ps Edit:/xbar_stage_5/SW 
WaveCollapseAll -1
wave clipboard restore
