onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fsm_table/clk
add wave -noupdate /fsm_table/reset
add wave -noupdate /fsm_table/w
add wave -noupdate /fsm_table/state
add wave -noupdate /fsm_table/z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {978 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {1081 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/fsm_table/clk 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/fsm_table/reset 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 1000ps Edit:/fsm_table/reset 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/fsm_table/w 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/fsm_table/w 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/fsm_table/w 
WaveCollapseAll -1
wave clipboard restore
