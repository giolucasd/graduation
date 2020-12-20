onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /barrel_shifter/s
add wave -noupdate -expand /barrel_shifter/w
add wave -noupdate -expand /barrel_shifter/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {398 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {768 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 00 -endvalue 11 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 1 0 -starttime 0ps -endtime 400ps sim:/barrel_shifter/s 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 400ps sim:/barrel_shifter/w 
WaveExpandAll -1
wave modify -driver freeze -pattern counter -startvalue 0101 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 400ps Edit:/barrel_shifter/w 
wave modify -driver freeze -pattern counter -startvalue 0100 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 400ps Edit:/barrel_shifter/w 
wave modify -driver freeze -pattern counter -startvalue 1010 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 400ps Edit:/barrel_shifter/w 
WaveCollapseAll -1
wave clipboard restore
