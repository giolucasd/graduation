onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dec2_to_4/w0
add wave -noupdate /dec2_to_4/w1
add wave -noupdate /dec2_to_4/en
add wave -noupdate /dec2_to_4/y0
add wave -noupdate /dec2_to_4/y1
add wave -noupdate /dec2_to_4/y2
add wave -noupdate /dec2_to_4/y3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {399 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 400ps sim:/dec2_to_4/w0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 400ps sim:/dec2_to_4/w1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 400ps sim:/dec2_to_4/en 
WaveCollapseAll -1
wave clipboard restore
