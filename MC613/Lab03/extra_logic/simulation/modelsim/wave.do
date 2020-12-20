onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /extra_logic/y0
add wave -noupdate /extra_logic/w0
add wave -noupdate /extra_logic/y1
add wave -noupdate /extra_logic/w1
add wave -noupdate /extra_logic/y2
add wave -noupdate /extra_logic/w2
add wave -noupdate /extra_logic/y3
add wave -noupdate /extra_logic/w3
add wave -noupdate /extra_logic/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1948 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 42
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
WaveRestoreZoom {0 ps} {4186 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/y0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/y1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/y2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/y3 
wave create -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/w0 
wave create -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/w1 
wave create -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/w2 
wave create -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/w3 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/y0 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/y1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/extra_logic/y2 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/extra_logic/y3 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/w0 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/extra_logic/w1 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/w2 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/extra_logic/w3 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/extra_logic/y0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 400ps sim:/extra_logic/y0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 400ps sim:/extra_logic/y0 
wave create -driver expectedOutput -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/f 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/y0 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ps -endtime 200ps Edit:/extra_logic/y0 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 200ps Edit:/extra_logic/y0 
wave modify -driver freeze -pattern constant -value 1 -starttime 200ps -endtime 300ps Edit:/extra_logic/y0 
wave modify -driver freeze -pattern constant -value 1 -starttime 300ps -endtime 400ps Edit:/extra_logic/y0 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/extra_logic/w0 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ps -endtime 200ps Edit:/extra_logic/w0 
wave modify -driver freeze -pattern constant -value 0 -starttime 200ps -endtime 300ps Edit:/extra_logic/w0 
wave modify -driver freeze -pattern constant -value 1 -starttime 300ps -endtime 400ps Edit:/extra_logic/w0 
wave create -driver freeze -pattern constant -value 0 -starttime 400ps -endtime 600ps sim:/extra_logic/y1 
wave modify -driver freeze -pattern constant -value 1 -starttime 600ps -endtime 800ps Edit:/extra_logic/y1 
wave create -driver freeze -pattern constant -value 0 -starttime 400ps -endtime 500ps sim:/extra_logic/w1 
wave modify -driver freeze -pattern constant -value 1 -starttime 500ps -endtime 600ps Edit:/extra_logic/w1 
wave modify -driver freeze -pattern constant -value 0 -starttime 600ps -endtime 700ps Edit:/extra_logic/w1 
wave modify -driver freeze -pattern constant -value 1 -starttime 700ps -endtime 800ps Edit:/extra_logic/w1 
wave create -driver freeze -pattern constant -value 0 -starttime 800ps -endtime 1000ps sim:/extra_logic/y2 
wave modify -driver freeze -pattern constant -value 1 -starttime 1000ps -endtime 1200ps Edit:/extra_logic/y2 
wave create -driver freeze -pattern constant -value 0 -starttime 800ps -endtime 900ps sim:/extra_logic/w2 
wave modify -driver freeze -pattern constant -value 1 -starttime 900ps -endtime 1000ps Edit:/extra_logic/w2 
wave modify -driver freeze -pattern constant -value 0 -starttime 1000ps -endtime 1100ps Edit:/extra_logic/w2 
wave modify -driver freeze -pattern constant -value 1 -starttime 1100ps -endtime 1200ps Edit:/extra_logic/w2 
wave create -driver freeze -pattern constant -value 0 -starttime 1200ps -endtime 1400ps sim:/extra_logic/y3 
wave modify -driver freeze -pattern constant -value 1 -starttime 1400ps -endtime 1600ps Edit:/extra_logic/y3 
wave create -driver freeze -pattern constant -value 0 -starttime 1200ps -endtime 1300ps sim:/extra_logic/w3 
wave modify -driver freeze -pattern constant -value 1 -starttime 1300ps -endtime 1400ps Edit:/extra_logic/w3 
wave modify -driver freeze -pattern constant -value 0 -starttime 1400ps -endtime 1500ps Edit:/extra_logic/w3 
wave modify -driver freeze -pattern constant -value 1 -starttime 1500ps -endtime 1600ps Edit:/extra_logic/w3 
wave modify -driver freeze -pattern constant -value 0 -starttime 400ps -endtime 1600ps Edit:/extra_logic/y0 
wave modify -driver freeze -pattern constant -value 0 -starttime 400ps -endtime 1600ps Edit:/extra_logic/w0 
wave modify -driver freeze -pattern constant -value 0 -starttime 800ps -endtime 1600ps Edit:/extra_logic/y1 
wave modify -driver freeze -pattern constant -value 0 -starttime 800ps -endtime 1600ps Edit:/extra_logic/w1 
wave modify -driver freeze -pattern constant -value 0 -starttime 1200ps -endtime 1600ps Edit:/extra_logic/y2 
wave modify -driver freeze -pattern constant -value 0 -starttime 1200ps -endtime 1600ps Edit:/extra_logic/w2 
WaveCollapseAll -1
wave clipboard restore
