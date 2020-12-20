onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fsm_diag/clock
add wave -noupdate /fsm_diag/reset
add wave -noupdate /fsm_diag/w
add wave -noupdate /fsm_diag/z
add wave -noupdate /fsm_diag/currentState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {441 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
configure wave -valuecolwidth 40
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
WaveRestoreZoom {650 ps} {1676 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/fsm_diag/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/fsm_diag/reset 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps Edit:/fsm_diag/reset 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/fsm_diag/w 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/fsm_diag/w 
WaveCollapseAll -1
wave clipboard restore
