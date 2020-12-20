onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_bank/clk
add wave -noupdate /register_bank/reg_rd
add wave -noupdate /register_bank/reg_wr
add wave -noupdate /register_bank/we
add wave -noupdate /register_bank/clear
add wave -noupdate -expand /register_bank/data_in
add wave -noupdate /register_bank/data_out
add wave -noupdate -expand /register_bank/memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1572 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
configure wave -valuecolwidth 229
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
WaveRestoreZoom {282 ps} {1103 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/register_bank/clk 
wave create -driver freeze -pattern constant -value 010 -range 2 0 -starttime 0ps -endtime 1600ps sim:/register_bank/reg_rd 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 010 -range 2 0 -starttime 0ps -endtime 1600ps sim:/register_bank/reg_wr 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/register_bank/we 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1600ps sim:/register_bank/clear 
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps sim:/register_bank/data_in 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 111 -range 2 0 -starttime 0ps -endtime 1600ps Edit:/register_bank/reg_wr 
wave modify -driver freeze -pattern random -initialvalue 000 -period 100ps -random_type Uniform -seed 5 -range 2 0 -starttime 0ps -endtime 1600ps Edit:/register_bank/reg_wr 
wave modify -driver freeze -pattern constant -value 1 -starttime 1500ps -endtime 1600ps Edit:/register_bank/clear 
WaveCollapseAll -1
wave clipboard restore
