onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /original/a
add wave -noupdate /original/b
add wave -noupdate /original/c
add wave -noupdate /original/d
add wave -noupdate /original/e
add wave -noupdate /original/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 130
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1618 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/original/a 
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/original/b 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/original/c 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/original/d 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/original/e 
WaveCollapseAll -1
wave clipboard restore
