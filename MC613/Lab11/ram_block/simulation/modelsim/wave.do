onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ram_block/Clock
add wave -noupdate /ram_block/WrEn
add wave -noupdate -expand /ram_block/Data
add wave -noupdate -expand /ram_block/Address
add wave -noupdate /ram_block/Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {250 ps} 0}
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
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/ram_block/Clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/ram_block/WrEn 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 500ps Edit:/ram_block/WrEn 
wave create -driver freeze -pattern random -initialvalue 00000000 -period 100ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1000ps sim:/ram_block/Data 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0000000 -range 6 0 -starttime 0ps -endtime 1000ps sim:/ram_block/Address 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 0000001 -range 6 0 -starttime 0ps -endtime 250ps Edit:/ram_block/Address 
wave modify -driver freeze -pattern constant -value 0000000 -range 6 0 -starttime 500ps -endtime 750ps Edit:/ram_block/Address 
wave modify -driver freeze -pattern constant -value 0000001 -range 6 0 -starttime 750ps -endtime 1000ps Edit:/ram_block/Address 
WaveCollapseAll -1
wave clipboard restore
