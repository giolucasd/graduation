onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /mux16_to_1/sel
add wave -noupdate -expand /mux16_to_1/data
add wave -noupdate /mux16_to_1/output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3194 ps} 0}
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
WaveRestoreZoom {0 ps} {3 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 0ps -endtime 1000ps sim:/mux16_to_1/sel 
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 3200ps sim:/mux16_to_1/sel 
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 100ps sim:/mux16_to_1/sel 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 100ps -endtime 200ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 200ps -endtime 300ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 300ps -endtime 400ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0100 -range 3 0 -starttime 400ps -endtime 500ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0101 -range 3 0 -starttime 500ps -endtime 600ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0110 -range 3 0 -starttime 600ps -endtime 700ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0111 -range 3 0 -starttime 700ps -endtime 800ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1000 -range 3 0 -starttime 800ps -endtime 900ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1001 -range 3 0 -starttime 900ps -endtime 1000ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 1000ps -endtime 1100ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1011 -range 3 0 -starttime 1100ps -endtime 1200ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1100 -range 3 0 -starttime 1200ps -endtime 1300ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1101 -range 3 0 -starttime 1300ps -endtime 1400ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1110 -range 3 0 -starttime 1400ps -endtime 1500ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1111 -range 3 0 -starttime 1500ps -endtime 1600ps Edit:/mux16_to_1/sel 
wave create -driver freeze -pattern constant -value 0000000000000000 -range 15 0 -starttime 0ps -endtime 1600ps sim:/mux16_to_1/data 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 1000000000000000 -range 15 0 -starttime 1600ps -endtime 3200ps Edit:/mux16_to_1/data 
wave modify -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 1600ps -endtime 1700ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 1700ps -endtime 1800ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 1800ps -endtime 1900ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 1900ps -endtime 2000ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0100 -range 3 0 -starttime 2000ps -endtime 2100ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0101 -range 3 0 -starttime 2100ps -endtime 2200ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0110 -range 3 0 -starttime 2200ps -endtime 2300ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 0111 -range 3 0 -starttime 2300ps -endtime 2400ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1000 -range 3 0 -starttime 2400ps -endtime 2500ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1001 -range 3 0 -starttime 2500ps -endtime 2600ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 2600ps -endtime 2700ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1011 -range 3 0 -starttime 2700ps -endtime 2800ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1100 -range 3 0 -starttime 2800ps -endtime 2900ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1101 -range 3 0 -starttime 2900ps -endtime 3000ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1110 -range 3 0 -starttime 3000ps -endtime 3100ps Edit:/mux16_to_1/sel 
wave modify -driver freeze -pattern constant -value 1111 -range 3 0 -starttime 3100ps -endtime 3200ps Edit:/mux16_to_1/sel 
WaveCollapseAll -1
wave clipboard restore
