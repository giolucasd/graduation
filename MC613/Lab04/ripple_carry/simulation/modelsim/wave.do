onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /ripple_carry/x
add wave -noupdate -expand /ripple_carry/y
add wave -noupdate /ripple_carry/cin
add wave -noupdate -expand /ripple_carry/r
add wave -noupdate /ripple_carry/cout
add wave -noupdate /ripple_carry/overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {218 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 174
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
WaveRestoreZoom {0 ps} {970 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 100ps sim:/ripple_carry/x 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 100ps sim:/ripple_carry/y 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/ripple_carry/cin 
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 100ps -endtime 200ps Edit:/ripple_carry/x 
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 100ps -endtime 200ps Edit:/ripple_carry/y 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ps -endtime 200ps Edit:/ripple_carry/cin 
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 200ps -endtime 300ps Edit:/ripple_carry/x 
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 200ps -endtime 300ps Edit:/ripple_carry/y 
wave modify -driver freeze -pattern constant -value 0 -starttime 200ps -endtime 300ps Edit:/ripple_carry/cin 
wave modify -driver freeze -pattern constant -value 0111 -range 3 0 -starttime 300ps -endtime 400ps Edit:/ripple_carry/x 
wave modify -driver freeze -pattern constant -value 0111 -range 3 0 -starttime 300ps -endtime 400ps Edit:/ripple_carry/y 
wave modify -driver freeze -pattern constant -value 1 -starttime 300ps -endtime 400ps Edit:/ripple_carry/cin 
wave modify -driver freeze -pattern constant -value 1111 -range 3 0 -starttime 400ps -endtime 500ps Edit:/ripple_carry/x 
wave modify -driver freeze -pattern constant -value 1111 -range 3 0 -starttime 400ps -endtime 500ps Edit:/ripple_carry/y 
wave modify -driver freeze -pattern constant -value 0 -starttime 400ps -endtime 500ps Edit:/ripple_carry/cin 
WaveCollapseAll -1
wave clipboard restore
