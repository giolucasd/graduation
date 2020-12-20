onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /shift_register/par_out
add wave -noupdate -expand /shift_register/par_in
add wave -noupdate -expand /shift_register/mode
add wave -noupdate /shift_register/clk
add wave -noupdate /shift_register/ser_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {768 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 194
configure wave -valuecolwidth 61
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
WaveRestoreZoom {0 ps} {921 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 101010 -range 5 0 -starttime 0ps -endtime 800ps sim:/shift_register/par_in 
WaveExpandAll -1
wave create -driver freeze -pattern random -initialvalue 00 -period 200ps -random_type Uniform -seed 5 -range 1 0 -starttime 0ps -endtime 800ps sim:/shift_register/mode 
WaveExpandAll -1
wave modify -driver freeze -pattern random -initialvalue 00 -period 100ps -random_type Uniform -seed 5 -range 1 0 -starttime 0ps -endtime 800ps Edit:/shift_register/mode 
wave modify -driver freeze -pattern counter -startvalue 00 -endvalue 11 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 1 0 -starttime 0ps -endtime 800ps Edit:/shift_register/mode 
wave create -driver freeze -pattern clock -initialvalue 0 -period 50ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/shift_register/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/shift_register/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/shift_register/ser_in 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ps -endtime 800ps Edit:/shift_register/ser_in 
WaveCollapseAll -1
wave clipboard restore
