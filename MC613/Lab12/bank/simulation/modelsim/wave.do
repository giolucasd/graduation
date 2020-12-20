onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bank/clock
add wave -noupdate /bank/WR_EN
add wave -noupdate /bank/RD_EN
add wave -noupdate /bank/clear
add wave -noupdate /bank/WR_ADDR
add wave -noupdate /bank/RD_ADDR1
add wave -noupdate /bank/RD_ADDR2
add wave -noupdate /bank/DATA_IN
add wave -noupdate /bank/DATA_OUT1
add wave -noupdate /bank/DATA_OUT2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {739 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 158
configure wave -valuecolwidth 229
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
WaveRestoreZoom {464 ps} {950 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/bank/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/bank/WR_EN 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 500ps Edit:/bank/WR_EN 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/bank/RD_EN 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/bank/clear 
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 1000ps sim:/bank/WR_ADDR 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 1000ps sim:/bank/RD_ADDR1 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 1000ps sim:/bank/RD_ADDR2 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000000000000000000000000000000 -endvalue 11111111111111111111111111111111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 31 0 -starttime 0ps -endtime 1000ps sim:/bank/DATA_IN 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 0ps -endtime 1000ps Edit:/bank/WR_ADDR 
wave modify -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 1000ps Edit:/bank/WR_ADDR 
wave modify -driver freeze -pattern constant -value 0 -starttime 500ps -endtime 1000ps Edit:/bank/RD_EN 
WaveCollapseAll -1
wave clipboard restore
