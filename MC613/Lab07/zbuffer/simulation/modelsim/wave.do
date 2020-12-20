onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /zbuffer/X
add wave -noupdate /zbuffer/E
add wave -noupdate -expand /zbuffer/F
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1143 ps} 0}
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
WaveRestoreZoom {650 ps} {1650 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps sim:/zbuffer/X 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/zbuffer/E 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1600ps Edit:/zbuffer/E 
WaveCollapseAll -1
wave clipboard restore
