onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ff_t/Clk
add wave -noupdate /ff_t/T
add wave -noupdate /ff_t/Preset
add wave -noupdate /ff_t/Clear
add wave -noupdate /ff_t/Q
add wave -noupdate /ff_t/Q_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {796 ps} 0}
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
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/ff_t/Clk 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/ff_t/T 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/ff_t/Preset 
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/ff_t/Clear 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps Edit:/ff_t/Clear 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 800ps Edit:/ff_t/Clear 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 800ps Edit:/ff_t/Preset 
WaveCollapseAll -1
wave clipboard restore
