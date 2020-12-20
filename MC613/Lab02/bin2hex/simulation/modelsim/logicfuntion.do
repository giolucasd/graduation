onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /minimizado/a
add wave -noupdate /minimizado/b
add wave -noupdate /minimizado/c
add wave -noupdate /minimizado/d
add wave -noupdate /minimizado/e
add wave -noupdate /minimizado/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 182
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
WaveRestoreZoom {403 ps} {1638 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/minimizado/a 
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/minimizado/b 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/minimizado/c 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/minimizado/d 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/minimizado/e 
WaveCollapseAll -1
wave clipboard restore
