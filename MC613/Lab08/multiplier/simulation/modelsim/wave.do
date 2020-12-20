onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /multiplier/a
add wave -noupdate -expand /multiplier/b
add wave -noupdate /multiplier/clk
add wave -noupdate /multiplier/set
add wave -noupdate -expand /multiplier/r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 62
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
WaveRestoreZoom {0 ps} {1059 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 0ps -endtime 1000ps sim:/multiplier/a 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0101 -range 3 0 -starttime 0ps -endtime 1000ps sim:/multiplier/b 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/multiplier/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/multiplier/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 200ps sim:/multiplier/set 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps Edit:/multiplier/set 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 1000ps Edit:/multiplier/set 
wave modify -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 0ps -endtime 1000ps Edit:/multiplier/b 
wave modify -driver freeze -pattern constant -value 0101 -range 3 0 -starttime 0ps -endtime 1000ps Edit:/multiplier/a 
WaveCollapseAll -1
wave clipboard restore
