onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory/clock
add wave -noupdate /memory/we
add wave -noupdate /memory/address
add wave -noupdate /memory/datain
add wave -noupdate /memory/dataout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 230
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
WaveRestoreZoom {0 ps} {415 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/memory/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/memory/we 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 500ps Edit:/memory/we 
wave create -driver freeze -pattern counter -startvalue 0000000000 -endvalue 1111111111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 9 0 -starttime 0ps -endtime 1000ps sim:/memory/address 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000000000000000000000000000000 -endvalue 11111111111111111111111111111111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 31 0 -starttime 0ps -endtime 1000ps sim:/memory/datain 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
